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

fn void output_functions(Object* json_obj, String output_path, String interface_path) {
  io::printf("Outputting functions...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();
  File output_interface = file::open(interface_path, "w")!!;
  defer (void)output_interface.close();

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

  output_header(&output);
  output_header(&output_interface);
  output_imgui_func(&output, &output_interface, imgui_funcs);
  output_struct_func(&output, &output_interface, struct_funcs);
}

fn void output_imgui_func(File* output, File* output_interface, List(<Object*>) funcs) {
  foreach (func : funcs) {
    if (try udt_val = func.get_int("nonUDT")) {
      @start_string_builder(output; DString* sb) {
        make_non_udt_function(sb, func);
        output_callbacks(sb, func);
        sb.appendf("\n")!!;
      };
    } else {
      @start_string_builder(output_interface; DString* sb) {
        sb.appendf("extern fn ");
        clean_type(sb, func.get_string("ret")!!);
        sb.appendf(" ");
        to_snake_case(sb, func.get_string("ov_cimguiname")!!.strip("ig"));
        sb.appendf("(");
        clean_params_list(sb, func);
        sb.appendf(") @extern(\"%s\");\n", func.get_string("ov_cimguiname")!!)!!;
        output_callbacks(sb, func);
        sb.appendf("\n")!!;
      };
    }
  }
  output.flush()!!;
}

fn void output_struct_func(File* output, File* output_interface, List(<Object*>) funcs) {
  HashMap(<String, List(<Object*>)>) struct_funcs;

  sort::quicksort(funcs);

  foreach (func : funcs) {
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

    @start_string_builder(output_interface; DString* sb) {
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

        output_callbacks(sb, func);
        sb.appendf("\n");
      } else if (try dtor = func.get_bool("destructor")) {
        assert(func.get_string("ret")!! == "void");
        sb.appendf("extern fn void ");
        clean_type(sb, func.get_string("stname")!!);
        sb.appendf(".destroy("); // method name
        clean_params_list(sb, func, true);
        sb.appendf(") @extern(\"%s\");\n", func.get_string("ov_cimguiname")!!);

        output_callbacks(sb, func);
        sb.appendf("\n");
      } else if (try ret = func.get_string("ret")) {
        assert(func.has_key("ret"));
        if (try func.get_int("nonUDT")) {
          @start_string_builder(output; DString* sb_udt) {
            make_non_udt_function(sb_udt, func);

            output_callbacks(sb_udt, func);
            sb_udt.appendf("\n");
          };
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

          output_callbacks(sb, func);
          sb.appendf("\n");
        }
      } else {
        unreachable("HERE: why this '%s' no return type?\n", func.get_string("ov_cimguiname")!!);
      }
    };
  }
}

fn DString* make_non_udt_function(DString* sb, Object* func) {
  assert(func.has_key("argsT"));
  Object* first_param = func.get("argsT")!!.get_at(0);
  bool struct_method = func.get_string("stname")!! != "";
  @pool() { // Check
    if (!struct_method) {
      DString temp;
      temp.temp_init();
      clean_type(&temp, func.get_string("ret")!!);
      assert(temp.str_view() == "void");
    }
    usz ptr_count = 0;
    clean_ptr(first_param.get_string("type")!!, &ptr_count);
    assert(ptr_count == 1);
    assert(first_param.get_string("name")!! == "pOut");
  };

  // extern function
  sb.appendf("extern fn ");
  clean_type(sb, func.get_string("ret")!!); // return type
  sb.appendf(" ");
  to_camel_case(sb, func.get_string("ov_cimguiname")!!); // method name
  sb.appendf("(");
  clean_params_list(sb, func, true); // parameters
  sb.appendf(") @extern(\"%s\") @local;\n", func.get_string("ov_cimguiname")!!); // link name

  // function definition
  sb.appendf("fn ");
  clean_type(sb, clean_ptr(first_param.get_string("type")!!)); // return type
  sb.appendf(" ");
  if (struct_method) {
    if (try func.get_bool("is_static_function")) {
      to_snake_case(sb, clean_imgui(func.get_string("ov_cimguiname")!!));
    } else {
      clean_type(sb, func.get_string("stname")!!);
      sb.appendf("."); // method name
      to_snake_case(sb, func.get_string("ov_cimguiname")!![func.get_string("stname")!!.len..]);
    }
  } else {
    to_snake_case(sb, func.get_string("ov_cimguiname")!!.strip("ig"));
  }
  sb.appendf("(");
  clean_params_list(sb, func);
  sb.appendf(") @inline {\n\t");

  // temporary variable
  clean_type(sb, clean_ptr(first_param.get_string("type")!!));
  sb.appendf(" %s;\n\t", first_param.get_string("name")!!);

  // extern function call
  if (struct_method) {
    to_camel_case(sb, func.get_string("ov_cimguiname")!!);
  } else {
    sb.appendf("%s", func.get_string("ov_cimguiname")!!);
  }
  // function call arguments
  sb.appendf("(&%s", first_param.get_string("name")!!);
  if (struct_method && !func.has_key("is_static_function")) {
    sb.appendf(", self");
  }
  if (func.get_string("call_args")!! != "()") {
    clean_arguments(sb, func.get_string("call_args")!!, ", ");
  }
  sb.appendf(");\n\t");

  // return statement
  sb.appendf("return %s;\n", first_param.get_string("name")!!);
  sb.appendf("}\n");
  return sb;
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
        usz start_idx = sb.len();
        clean_type(sb, param.get_string("type")!!);
        usz end_idx = sb.len()-1;
        sb.appendf(" %s", param.get_string("name")!!);
        if (try default_value = func.get("defaults")!!.get(param.get_string("name")!!)) {
          sb.appendf(" = ");
          clean_value(sb, default_value.s, sb.str_view()[start_idx..end_idx]);
        }
      }
    }
  }
  return sb.str_view();
}

