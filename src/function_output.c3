module generator;
import std::io;
import std::io::file;
import std::encoding::json;
import std::collections::object @public;
import std::collections::map;
import std::collections::list;
import std::collections::tuple;
import std::sort;
import std::math;

struct Arg {
  String type;
  String name;
}

struct Func {
  String stname;             // the name of the struct the function belongs to (will be "" if it is top level in ImGui namespace)
  String ov_cimguiname;      // the overloaded cimgui name (if absent it would be taken from cimguiname)
  String cimguiname;         // the name without overloading (this should be used if there is not ov_cimguiname)
  String ret;                // the return type
  String retref;             // is set if original return type is a reference. (will be a pointer in cimgui)
  String argsT;              // an array of collections (each one with type: argument type and name: the argument name, when the argument is a function pointer also ret: return type and signature: the function signature)
  String args;               // a string of argsT concatenated and separated by commas
  String call_args;          // a string with the argument names separated by commas for calling imgui function
  String defaults;           // a collection in which key is argument name and value is the default value.
  String manual;             // will be true if this function is hand-written (not generated)
  String skipped;            // will be true if this function is not generated (and not hand-written)
  String isvararg;           // is set if some argument is a vararg
  String constructor;        // is set if the function is a constructor for a class.
  String destructor;         // is set if the function is a destructor for a class but not just a default destructor.
  String realdestructor;     // is set if the function is a destructor for a class
  String templated;          // is set if the function belongs to a templated class (ImVector)
  String templatedgen;       // is set if the function belongs to a struct generated from template (ImVector_ImWchar)
  String nonUDT;             // if present the original function was returning a user defined type so that signature has been changed to accept a pointer to the UDT as first argument.
  String location;           // name of the header file and linenumber this function comes from. (imgui:000, internal:123, imgui_impl_xxx:123)
  String is_static_function; // is setted when it is an struct static function.
}

fn void output_functions(Object* json_obj, String output_path) {
  io::printf("Outputting functions...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();

  List(<Object*>) imgui_funcs;
  List(<Object*>) struct_funcs;

  json_obj.map.@each(; String name, Object* values) {
    assert(values.is_array());
    foreach (func : values.array) {
      assert(func.has_key("stname"));
      if (!func.get_string("args")!!.contains("va_list")) {
        String stname = func.get_string("stname")!!.trim();
        if (stname.len == 0) {
          imgui_funcs.push(func);
        } else if (!func.has_key("templated")) {
          struct_funcs.push(func);
        }
      }
    }
  };

  (void)io::fprintf(&output, "module %s;\n", IMGUI_MODULE_NAME);
  output_imgui_func(&output, imgui_funcs);
  output_struct_func(&output, struct_funcs);
}

fn void output_imgui_func(File* output, List(<Object*>) funcs) {
  foreach (func : funcs) {
    @start_string_builder(output; DString* sb) {
      List(<String>) callbacks;

      if (try udt_val = func.get_int("nonUDT")) {
        Object* first_param = func.get("argsT")!!.get_at(0);

        { // checks
          DString temp;
          temp.temp_init();
          clean_type(&temp, func.get_string("ret")!!);
          assert(temp.str_view() == "void");
          assert(first_param.get_string("name")!! == "pOut");
          usz ptr_count = 0;
          clean_ptr(first_param.get_string("type")!!, &ptr_count);
          assert(ptr_count == 1);
        }

        // extern function
        sb.appendf("extern fn ");
        clean_type(sb, func.get_string("ret")!!); // return type
        sb.appendf(" %s(", func.get_string("ov_cimguiname")!!); // function name
        clean_params_list(sb, func, true); // parameters
        sb.appendf(") @extern(\"%s\") @local;\n", func.get_string("ov_cimguiname")!!); // link name

        // function definition
        sb.appendf("fn ");
        clean_type(sb, clean_ptr(first_param.get_string("type")!!)); // return type
        sb.appendf(" ");
        to_snake_case(sb, func.get_string("ov_cimguiname")!!.strip("ig"), false);
        sb.appendf("(");
        clean_params_list(sb, func);
        sb.appendf(") @inline {\n\t");

        // temporary variable
        clean_type(sb, clean_ptr(first_param.get_string("type")!!));
        sb.appendf(" ");
        sb.appendf("%s;\n\t", first_param.get_string("name")!!);

        // extern function call
        sb.appendf("%s(&%s", func.get_string("ov_cimguiname")!!, first_param.get_string("name")!!);
        if (func.get_string("call_args")!! != "()") {
          sb.appendf(", %s", func.get_string("call_args")!!.trim("()"));
        }
        sb.appendf(");\n\t");

        sb.appendf("return %s;\n", first_param.get_string("name")!!);
        sb.appendf("}\n");
      } else {
        sb.appendf("extern fn ");
        clean_type(sb, func.get_string("ret")!!);
        sb.appendf(" ");
        to_snake_case(sb, func.get_string("ov_cimguiname")!!.strip("ig"));
        sb.appendf("(");
        clean_params_list(sb, func);
        sb.appendf(") @extern(\"%s\");\n", func.get_string("ov_cimguiname")!!)!!;
      }

      output_callbacks(sb, func);
      sb.appendf("\n")!!;
    };
  }
  output.flush()!!;
}

fn void output_struct_func(File* output, List(<Object*>) funcs) {
  HashMap(<String, List(<Object*>)>) struct_funcs;

  sort::quicksort(funcs);

  foreach (func : funcs) {
    @start_string_builder(output; DString* sb) {
      assert(func.get_string("ov_cimguiname")!!.starts_with(func.get_string("stname")!!));
      String struct_name = func.get_string("stname")!!;
      String method_name_raw = func.get_string("ov_cimguiname")!!.strip(struct_name).strip("_");
      String overload_name = func.get_string("ov_cimguiname")!!;

      DString method_name;
      method_name.temp_init();
      DString return_type;
      return_type.temp_init();
      DString param_list;
      param_list.temp_init();

      if (try ctor = func.get_bool("constructor")) {
        assert(!func.has_key("ret"));
        sb.appendf("extern fn ");
        clean_type(sb, func.get_string("stname")!!);
        sb.appendf("* ");
        sb.appendf("new_");
        usz name_len = func.get_string("stname")!!.len;
        to_snake_case(sb, clean_imgui(func.get_string("ov_cimguiname")!![name_len+1..]).strip_end("_Nil"));
        sb.appendf("(");
        clean_params_list(sb, func, true);
        sb.appendf(") @extern(\"%s\");\n", func.get_string("ov_cimguiname")!!);

        sb.appendf("\n");
      } else if (try dtor = func.get_bool("destructor")) {
        assert(func.get_string("ret")!! == "void");
        sb.appendf("extern fn void ");
        clean_type(sb, func.get_string("stname")!!);
        sb.appendf(".destroy("); // method name
        clean_params_list(sb, func, true);
        sb.appendf(") @extern(\"%s\");\n", func.get_string("ov_cimguiname")!!);

        sb.appendf("\n");
      } else if (try ret = func.get_string("ret")) {
        assert(func.has_key("ret"));
        if (try func.get_int("nonUDT")) {
          sb.appendf("extern fn ");
          clean_type(sb, func.get_string("ret")!!);
          sb.appendf(" ");
          to_camel_case(sb, func.get_string("ov_cimguiname")!!);
          sb.appendf("(");
          clean_params_list(sb, func, true);
          sb.appendf(") @extern(\"%s\");\n", func.get_string("ov_cimguiname")!!);

          assert(func.has_key("argsT"));
          Object* first_param = func.get("argsT").get_at(0)!!;
          { // Checks
            usz ptr_count = 0;
            clean_ptr(first_param.get_string("type")!!, &ptr_count);
            assert(ptr_count == 1);
            assert(first_param.get_string("name")!! == "pOut");
          }
          sb.appendf("fn ");
          clean_type(sb, clean_ptr(first_param.get_string("type")!!));
          sb.appendf(" ");
          if (try func.get_bool("is_static_function")) {
            to_snake_case(sb, clean_imgui(func.get_string("ov_cimguiname")!!));
          } else {
            clean_type(sb, func.get_string("stname")!!);
            sb.appendf("."); // method name
            to_snake_case(sb, func.get_string("ov_cimguiname")!![func.get_string("stname")!!.len..]);
          }
          sb.appendf("(");
          clean_params_list(sb, func);
          sb.appendf(") @inline {\n\t");
          clean_type(sb, clean_ptr(first_param.get_string("type")!!));
          sb.appendf(" ");
          sb.appendf("%s", first_param.get_string("name")!!);
          sb.appendf(";\n\t");
          to_camel_case(sb, func.get_string("ov_cimguiname")!!);
          sb.appendf("(&");
          sb.appendf("%s", first_param.get_string("name")!!);
          if (!func.has_key("is_static_function")) {
            sb.appendf(", self");
          }
          if (func.get_string("call_args")!! != "()") {
            foreach (idx, arg : func.get_string("call_args")!!.trim("()").split(",")) {
              sb.appendf(", ", arg);
              sb.appendf("%s", arg);
            }
          }
          sb.appendf(");\n\t");
          sb.appendf("return %s;", first_param.get_string("name")!!);
          sb.appendf("\n}\n");
          sb.appendf("\n");
        } else {
          assert(func.has_key("ret"));
          sb.appendf("extern fn ");
          clean_type(sb, func.get_string("ret")!!);
          sb.appendf(" ");
          clean_type(sb, func.get_string("stname")!!);
          sb.appendf("."); // method name
          to_snake_case(sb, func.get_string("ov_cimguiname")!![func.get_string("stname")!!.len..]);
          sb.appendf("(");
          clean_params_list(sb, func, true);
          sb.appendf(") @extern(\"%s\");\n", func.get_string("ov_cimguiname")!!);
          sb.appendf("\n");
        }
      } else {
        unreachable("HERE: why this '%s' no return type?\n", func.get_string("ov_cimguiname")!!);
      }
    };
  }
}

fn DString* make_callback_name(DString* sb, Object* func, Object* param) {
  sb.appendf(func.get_string("funcname")!!.strip("ig"));
  sb.appendf("_");
  to_pascal_case(sb, param.get_string("name")!!);
  sb.appendf("_");
  sb.appendf("Func");
  return sb;
}

fn DString* output_callbacks(DString* sb, Object* func) {
  foreach (param : func.get("argsT")!!.array) {
    if (try ret = param.get_string("ret")) {
      sb.appendf("def ");
      make_callback_name(sb, func, param);
      sb.appendf(" = fn ");
      clean_type(sb, ret);
      sb.appendf("(");
      clean_params(sb, param.get_string("signature")!!.trim("()"));
      sb.appendf(");\n");
    }
  }
  return sb;
}

// TODO: separate callback parser?
fn String clean_params_list(DString* sb, Object* func, bool full = false) {
  usz i = func.get_int("nonUDT") ?? 0;
  usz start = i;
  Object* args = func.get("argsT")!!;
  if (full) {
    i = 0;
    start = 0;
  }
  
  for (; i < args.array.len(); i++) {
    Object* param = args.get_at(i);
    if (i != start) {
      sb.append_chars(", ");
    }

    if (try ret = param.get_string("ret")) {
      make_callback_name(sb, func, param);
      sb.appendf(" %s", param.get_string("name")!!);
    } else {
      if (param.get_string("type")!! == "...") {
        sb.appendf("...");
      } else {
        clean_type(sb, param.get_string("type")!!);
        sb.appendf(" %s", param.get_string("name")!!);
        if (try default_value = func.get("defaults")!!.get(param.get_string("name")!!)) {
          clean_value(sb, default_value.s);
        }
      }
    }
  }
  return sb.str_view();
}

// TODO: redesign this function and clean_constant()
fn void clean_value(DString* sb, String s) {
  DString temp;
  temp.temp_init();
  // TODO: move this to string_utils?
  if (s == "NULL") {
    temp.append_chars(" = null");
  } else if (s == "true" || s == "false") {
    temp.appendf(" = %s", s);
  } else if (s.starts_with("sizeof")) {
    temp.appendf(" = %s.sizeof", s[s.index_of_char('(')!!+1..s.index_of_char(')')!!-1]);
  } else if (s.starts_with("ImVec")) {
    temp.appendf(" = {");
    foreach (idx, v : s[s.index_of_char('(')!!+1..s.index_of_char(')')!!-1].split(",")) {
      if (idx != 0) {
        temp.appendf(", ");
      }
      temp.appendf("%s", v);
    }
    temp.appendf("}");
  } else if (s.starts_with("%")) {
    temp.appendf(" = \"%s\"", s);
  } else if (s.ends_with("f")) {
    temp.appendf(" = %s", s);
  } else if (try value = s.to_long()) { // TODO: is 'long' type enough?. make sure it will not convert floating point
    temp.appendf(" = %d", value);
  } else if (try value = s.to_double()) {
    temp.appendf(" = %f", value);
  } else if (s.len == 0){
    temp.appendf(" = \"\"");
  } else {
    temp.appendf(" = %s", s);
  }

  temp.replace("FLT_MIN", "float.min");
  temp.replace("FLT_MAX", "float.max");
  sb.append_string(temp);
}

