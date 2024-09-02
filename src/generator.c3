module generator;
import std::io;
import std::io::file;
import std::encoding::json;
import std::collections::object @public;
import std::collections::map;
import std::collections::list;

const IMGUI_MODULE_NAME = "imgui";

const STRUCTS_AND_ENUMS_JSON = "./cimgui/generator/output/structs_and_enums.json";
const DEFINITIONS_JSON = "./cimgui/generator/output/definitions.json";

fn Object* get_file_json(String file_path) {
  io::File handle = file::open(file_path, "r")!!;
  defer (void)handle.close();

  Object* obj = json::parse(&handle)!!;
  return obj;
}

fn int main(String[] args) {
  Object* types_json = get_file_json(STRUCTS_AND_ENUMS_JSON);
  //Object* functions_json = get_file_json(DEFINITIONS_JSON);

  assert(types_json.is_map());
  output_enums(types_json, "enums.c3");
  output_structs(types_json, "structs.c3");

  return 0;
}

fn void output_enums(Object* json_obj, String output_path) {
  io::printf("Outputting enums...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();

  DString buffer;
  buffer.temp_init();

  json_obj.get("enums")!!.map.@each(; String name, Object* values) {
    if (try loc = json_obj.get("locations")!!.get(name) && !loc.s.starts_with("imgui_internal")) {
      (void)io::fprintf(&output, "// %s\n", name);
      (void)io::fprintf(&output, "module %s::", IMGUI_MODULE_NAME);
      (void)io::fprintf(&output, "%s;\n", to_snake_case(&buffer, clean_imgui(name).strip_end("_")));
      if (try type = enum_types.get(name)) {
        (void)io::fprintf(&output, "distinct %s = %s;\n", clean_imgui(name).strip_end("_"), type);
      } else if (try ctype = json_obj.get("enumtypes")!!.get_string(name)) {
        if (try type = type_map.get(ctype)) {
          (void)io::fprintf(&output, "distinct %s = %s;\n", clean_imgui(name).strip_end("_"), type);
        } else {
          unreachable("[output_enums] unknown type: %s", ctype);
        }
      } else {
        (void)io::fprintf(&output, "distinct %s = uint;\n", clean_imgui(name).strip_end("_"));
      }

      assert(values.is_array());
      foreach (value : values.array) {
        (void)io::fprintf(&output, "const %s ", clean_imgui(name).strip_end("_"));
        DString value_name;
        value_name.temp_init();
        if (!is_valid_constant(to_constant_case(&buffer, clean_field(value.get_string("name")!!, name)))) {
          value_name.appendf("%s_", to_constant_case(&buffer, clean_imgui(name).strip_end("_")));
        }
        value_name.appendf("%s", to_constant_case(&buffer, clean_field(value.get_string("name")!!, name)));
        (void)io::fprintf(&output, "%s = ", value_name);

        if (try value.get_string("value")!!.index_of_char('|')) {
          foreach (i, v : value.get_string("value")!!.split("|")) {
            if (i != 0) {
              (void)io::fprintf(&output, " | ");
            }
            String val = to_constant_case(&buffer, clean_field(v, name));
            (void)io::fprintf(&output, "%s", val);
            if (!is_valid_constant(val)) {
              (void)io::fprintf(&output, val);
              unreachable(val);
            }
          }
          (void)io::fprintf(&output, ";\n");
        } else {
          if (try value.get_string("value")!!.to_uint()) {
            (void)io::fprintf(&output, "%s;\n", value.get_string("value")!!);
          } else if (value.get_string("value")!!.contains("<<")) { // TODO: fix this branch duplication
            (void)io::fprintf(&output, "%s;\n", value.get_string("value")!!);
          } else if (value.get_string("value")!!.contains("-")) {
            (void)io::fprintf(&output, "%d;\n", value.get_long("calc_value")!!);
          } else {
            (void)io::fprintf(&output, "%s;\n", to_constant_case(&buffer, clean_field(value.get_string("value")!!, name)));
          }
        }

        {
          DString enum_name_buf;
          enum_name_buf.temp_init();
          enum_name_buf.appendf("%s::%s", to_snake_case(&buffer, clean_imgui(name).strip_end("_")), value_name.str_view());
          enum_values_map.set(value.get_string("name")!!, enum_name_buf.copy_str());
        }
      }
      (void)io::fprintf(&output, "\n");
    }
  };
}

fn void output_templated_structs(Object* json_obj, String output_path) {
  io::printf("Outputting templated structs...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();

  DString buffer;
  buffer.temp_init();

  json_obj.get("templated_structs")!!.map.@each(; String name, Object* members) {
    if (catch blacklist_structs.get(name)) {
      String typename = json_obj.get("typenames")!!.get_string(name)!!;
      assert(typename == "T");

      (void)io::printf("module %s(<Type>);\n", IMGUI_MODULE_NAME);
      (void)io::printf("// %s\n", name);
      (void)io::printf("struct %s {\n", name);

      assert(members.is_array());
      foreach (member : members.array) {
        if (member.get_string("type")!!.starts_with(typename)) {
          (void)io::printf("  Type %s;\n", to_snake_case(&buffer, member.get_string("name")!!));
        } else {
          (void)io::printf("  %s %s;\n", member.get_string("type")!!, to_snake_case(&buffer, member.get_string("name")!!));
        }
      }
      (void)io::printf("}\n\n");
    }
  };
}

fn void output_structs(Object* json_obj, String output_path) {
  io::printf("Outputting structs...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();

  DString buffer;
  buffer.temp_init();

  io::printf("module %s;\n", IMGUI_MODULE_NAME);
  json_obj.get("structs")!!.map.@each(; String name, Object* members) {
    if (try loc = json_obj.get("locations")!!.get(name) && !loc.s.starts_with("imgui_internal") && !loc.s.starts_with("imstb_textedit")) {
      io::printf("// %s\n", name);
      if (try alt = struct_name_map.get(name)) {
        io::printf("struct %s {\n", alt);
      } else {
        io::printf("struct %s {\n", clean_imgui(name));
        struct_name_map.set(name, clean_imgui(name));
      }

      List(<DString>) callbacks;
      assert(members.is_array());
      foreach (member : members.array) {
        DString member_type_buffer;
        member_type_buffer.temp_init();
        String member_type = clean_type(&member_type_buffer, member.get_string("type")!!);

        if (try s = member.get_string("name")!!.index_of_char('[') && try e = member.get_string("name")!!.index_of_char(']')) {
          String key = member.get_string("name")!![s+1..e-1];
          if (try value = enum_values_map.get(key)) {
            io::printf("  %s[%s] %s;\n", member_type, value, to_snake_case(&buffer, member.get_string("name")!![..s-1]));
          } else {
            io::printf("  %s[%s] %s;\n", member_type, key, to_snake_case(&buffer, member.get_string("name")!![..s-1]));
          }
        } else {
          if (member_type.starts_with("fn")) {
            DString fn_buffer;
            fn_buffer.temp_init();
            String type = to_pascal_case(&fn_buffer, to_snake_case(&buffer, member.get_string("name")!!));
            io::printf("  %sCallback %s;\n", type, to_snake_case(&buffer, member.get_string("name")!!));

            DString func_def_buffer;
            func_def_buffer.appendf("def %s = %s;", type, member_type);
            callbacks.push(func_def_buffer);
          } else if (member_type.starts_with("union")) {
            io::printf("  %s\n", member_type);
          } else {
            io::printf("  %s %s;\n", member_type, to_snake_case(&buffer, member.get_string("name")!!));
          }
        }
      }
      io::printf("}\n\n");
      if (callbacks.len() > 0) {
        foreach (func_def : callbacks) {
          io::printf("%s\n", func_def);
        }
        io::printf("\n");
      }
    }
  };
}

fn String clean_type(DString* buffer, String orig_type) {
  if (try s = orig_type.index_of("(*)")) {
    DString fn_buffer;
    fn_buffer.temp_init();
    fn_buffer.append_chars("fn ");
    String type = clean_type(&fn_buffer, orig_type[..s-1]);
    fn_buffer.append_chars("(");
    String args = orig_type[s+4..^2];
    foreach (idx, arg : args.split(",")) {
      if (idx != 0) {
        fn_buffer.appendf(", ");
      }
      DString type_buffer;
      type_buffer.temp_init();
      fn_buffer.appendf("%s %s", clean_type(&type_buffer, arg[..arg.rindex_of_char(' ')!!-1]), arg[arg.rindex_of_char(' ')!!+1..]);
    }
    fn_buffer.appendf(")");
    buffer.appendf("%s", fn_buffer);
  } else {
    orig_type = orig_type.trim();
    if (orig_type.starts_with("const char*")) {
      buffer.append_chars("ZString");
    } else {
      orig_type = orig_type.strip("const ");

      if (try type = type_map.get(orig_type)) {
        buffer.append_chars(type);
      } else if (try type = find_type_starts_with(orig_type)) {
        String after = orig_type[type.len..];
        String before = type_map.get(type)!!;
        buffer.appendf("%s%s", before, after);
      } else {
        buffer.append_chars(clean_imgui(orig_type));
      }
    }
  }
  return buffer.str_view();
}

fn void test_clean_type() @test {
  io::printn();
  DString buffer;
  buffer.temp_init();
  buffer.clear();
  io::printfn("%s", clean_type(&buffer, "ImHello"));
  buffer.clear();
  io::printfn("%s", clean_type(&buffer, "ImGuiHello"));
  buffer.clear();
  io::printfn("%s", clean_type(&buffer, "Hello"));
}

fn String clean_imgui(String str) {
  if (str.starts_with("Im")/*  && !str.starts_with("Image") */) {
      String result = str[2..];
      if (result.starts_with("Gui")) {
          result = result[3..];
      }
      return result;
  }

  return str;
}

fn String clean_field(String field, String enum_name) {
  field = field.trim();
  field = field.strip_end("_");
  if (field.starts_with(enum_name)) {
    field = field[enum_name.len + (enum_name[^1] != '_' ? 1 : 0)..];
  }
  return clean_imgui(field);
}


