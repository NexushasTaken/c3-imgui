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

  DString buffer;
  buffer.temp_init();

  List(<Object*>) imgui_funcs;
  List(<Object*>) struct_funcs;

  json_obj.map.@each(; String name, Object* values) {
    assert(values.is_array());
    foreach (func : values.array) {
      assert(func.has_key("stname"));
      if (!func.get_string("args")!!.contains("va_list")) {
        String stname = func.get_string("stname")!!.trim();
        if (stname.len > 0) {
          struct_funcs.push(func);
        } else {
          imgui_funcs.push(func);
        }
      }
    }
  };

  (void)io::fprintf(&output, "module %s;\n", IMGUI_MODULE_NAME);
  output_imgui_func(&output, imgui_funcs);
  //output_struct_func(&output, struct_funcs);
}

fn void output_imgui_func(File* output, List(<Object*>) funcs) {
  foreach (func : funcs) {
    DString func_name_buffer;
    func_name_buffer.temp_init();
    DString func_params_buffer;
    func_params_buffer.temp_init();
    DString func_ret_buffer;
    func_ret_buffer.temp_init();
    List(<String>) callbacks;

    String func_extern_name = func.get_string("ov_cimguiname")!!;
    String func_name = to_snake_case(&func_name_buffer, func.get_string("ov_cimguiname")!!.strip("ig"));
    String func_ret = clean_type(&func_ret_buffer, func.get_string("ret")!!);
    String func_params = clean_params_list(&func_params_buffer, func, &callbacks, func_name);

    if (try udt_val = func.get_int("nonUDT")) {
      // TODO: use first parameter as return value?
      assert(func_ret == "void");
      (void)io::fprintf(output, "//%s%s%s %s -> %s, %d\n", func_extern_name, func.get_string("argsoriginal")!!, func.get_string("args")!!, func_name, func_ret, udt_val);
      //(void)io::fprintf(output, "extern fn %s %s(%s) @extern(\"%s\");\n", func_ret, func_name, func_params, func_extern_name);

      {
        Object* first_param = func.get("argsT")!!.get_at(0);
        String name = first_param.get_string("name")!!;
        assert(name == "pOut");
        usz ptr_count = 0;
        DString type_buffer;
        type_buffer.temp_init();
        String type = clean_type(&type_buffer, clean_ptr(first_param.get_string("type")!!, &ptr_count));
        assert(ptr_count == 1);
        DString full_params;
        full_params.temp_init();
        (void)io::fprintf(output, "extern fn %s %s(%s) @extern(\"%s\");\n", func_ret, func_extern_name, clean_params_list(&full_params, func, null, func_name, true), func_extern_name);
        (void)io::fprintf(output, "fn %s %s(%s) @inline {\n", type, func_name, func_params);
        (void)io::fprintf(output, "  %s %s;\n", type, name);
        if (func.get_string("call_args")!! == "()") {
          (void)io::fprintf(output, "  %s(&%s);\n", func_extern_name, name);
        } else {
          (void)io::fprintf(output, "  %s(&%s, %s);\n", func_extern_name, name, func.get_string("call_args")!!.trim("()"));
        }
        (void)io::fprintf(output, "  return %s;\n", name);
        (void)io::fprintf(output, "}\n");
        
        io::printfn("// HERE{%s}", *first_param);
      }
    } else {
      (void)io::fprintf(output, "//%s%s %s -> %s\n", func_extern_name, func.get_string("argsoriginal")!!, func_name, func_ret);
      (void)io::fprintf(output, "extern fn %s %s(%s) @extern(\"%s\");\n", func_ret, func_name, func_params, func_extern_name);
    }
    foreach (cb : callbacks) {
      (void)io::fprintf(output, "%s\n", cb);
    }
    (void)io::fprintf(output, "\n");
  }
}

fn void output_struct_func(List(<Object*>) funcs) {
  HashMap(<String, List(<Object*>)>) struct_funcs;

  foreach (func : funcs) {
    io::printfn("%s", func.get_string("cimguiname")!!);
  }
}

fn String clean_params_list(DString* buffer, Object* func, List(<String>)* callbacks, String func_name, bool full = false) {
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
      buffer.append_chars(", ");
    }

    if (try ret = param.get_string("ret")) {
      DString param_buffer;
      param_buffer.temp_init();
      DString ret_buffer;
      ret_buffer.temp_init();
      DString cb_buffer;
      cb_buffer.temp_init();
      DString cb_name_buffer;
      cb_name_buffer.temp_init();

      String ret_type = clean_type(&ret_buffer, ret);
      String params = clean_params(&param_buffer, param.get_string("signature")!!.trim("()"));
      cb_buffer.appendf("fn %s%s", ret_type, params);

      to_pascal_case(&cb_name_buffer, func_name);
      cb_name_buffer.append_chars("Callback");

      if (callbacks != null) {
        callbacks.push(string::new_format("def %s = %s;", cb_name_buffer.str_view(), cb_buffer.str_view()));
      }
      buffer.appendf("%s %s", cb_name_buffer.str_view(), param.get_string("name")!!);
    } else {
      DString type_buffer;
      type_buffer.temp_init();

      if (param.get_string("type")!! == "...") {
        buffer.appendf("...");
      } else {
        buffer.appendf("%s %s", clean_type(&type_buffer, param.get_string("type")!!), param.get_string("name")!!);
        if (try default_value = func.get("defaults")!!.get(param.get_string("name")!!)) {
          clean_value(buffer, default_value.s);
        }
      }
    }
  }
  return buffer.str_view();
}

// TODO: redesign this function and clean_constant()
fn void clean_value(DString* buffer, String s) {
  DString value_buffer;
  value_buffer.temp_init();
  // TODO: move this to string_utils?
  if (s == "NULL") {
    value_buffer.append_chars(" = null");
  } else if (s == "true" || s == "false") {
    value_buffer.appendf(" = %s", s);
  } else if (s.starts_with("sizeof")) {
    value_buffer.appendf(" = %s.sizeof", s[s.index_of_char('(')!!+1..s.index_of_char(')')!!-1]);
  } else if (s.starts_with("ImVec")) {
    value_buffer.appendf(" = {");
    foreach (idx, v : s[s.index_of_char('(')!!+1..s.index_of_char(')')!!-1].split(",")) {
      if (idx != 0) {
        value_buffer.appendf(", ");
      }
      value_buffer.appendf("%s", v);
    }
    value_buffer.appendf("}");
  } else if (s.starts_with("%")) {
    value_buffer.appendf(" = \"%s\"", s);
  } else if (s.ends_with("f")) {
    value_buffer.appendf(" = %s", s);
  } else if (try value = s.to_long()) { // TODO: is long is enough?. make sure it doesn't convert floating point
    value_buffer.appendf(" = %d", value);
  } else if (try value = s.to_double()) {
    value_buffer.appendf(" = %f", value);
  } else {
    value_buffer.appendf(" = %s", s);
  }

  value_buffer.replace("FLT_MIN", "float.min");
  value_buffer.replace("FLT_MAX", "float.max");
  buffer.append_string(value_buffer);
}

