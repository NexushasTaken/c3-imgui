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

const IMGUI_MODULE_NAME = "imgui";

const STRUCTS_AND_ENUMS_JSON = "./cimgui/generator/output/structs_and_enums.json";
const DEFINITIONS_JSON = "./cimgui/generator/output/definitions.json";
const TYPEDEFS_JSON = "./cimgui/generator/output/typedefs_dict.json";

fn Object* get_file_json(String file_path) {
  io::File handle = file::open(file_path, "r")!!;
  defer (void)handle.close();

  Object* obj = json::parse(&handle)!!;
  return obj;
}

fn int main(String[] args) {
  Object* types_json = get_file_json(STRUCTS_AND_ENUMS_JSON);
  Object* typedefs_json = get_file_json(TYPEDEFS_JSON);
  //Object* functions_json = get_file_json(DEFINITIONS_JSON);

  assert(types_json.is_map());
  digest_types(types_json);
  output_enums(types_json, "enums.c3");
  output_structs(types_json, "structs.c3");
  output_templated_structs(types_json, "templated_structs.c3");
  output_typedefs(typedefs_json, "typedefs.c3");

  return 0;
}

fn void digest_types(Object* json_obj) {
  json_obj.get("structs")!!.map.@each(; String name, Object* members) {
    if (!struct_map.has_key(name)) {
      struct_map.set(name, clean_imgui(name));
    }
  };
  json_obj.get("enums")!!.map.@each(; String name, Object* members) {
    enum_map.set(name, clean_enum(name));
  };
  json_obj.get("enums")!!.map.@each(; String name, Object* values) {
    foreach (value : values.array) {
      DString value_name;
      to_constant_case(&value_name, clean_imgui(value.get_string("name")!!));
      assert(value_name.str_view());
      enum_value_map.set(value.get_string("name")!!, value_name.copy_str());
    }
  };
}

fn void output_enums(Object* json_obj, String output_path) {
  //io::printf("Outputting enums...\n");
  File output = file::open(output_path, "w")!!;
  //defer (void)output.close();
  output = *io::stdout();

  DString buffer;
  buffer.temp_init();

  (void)io::fprintf(&output, "module %s;\n", IMGUI_MODULE_NAME);

  json_obj.get("enums")!!.map.@each(; String name, Object* values) {
    (void)io::fprintf(&output, "// %s\n", name);

    if (try ctype = json_obj.get("enumtypes")!!.get_string(name)) { // typed enum
      if (try type = type_map.get(ctype)) { // convert ctype
        (void)io::fprintf(&output, "distinct %s = %s;\n", enum_map.get(name)!!, type);
      } else {
        unreachable("[output_enums] unknown type: %s", ctype);
      }
    } else {
      (void)io::fprintf(&output, "distinct %s = int;\n", enum_map.get(name)!!);
    }

    List(<Tuple(<String, DString>)>) cleaned_values;

    assert(values.is_array());
    { // Gather
      foreach (value : values.array) {
        DString value_value;

        if (try value.get_string("value")!!.index_of_char('|')) {
          foreach (i, v : value.get_string("value")!!.split("|")) {
            if (i != 0) {
              value_value.appendf(" | ");
            }
            value_value.appendf("%s", enum_value_map.get(v.trim())!!);
          }
        } else {
          if (try value.get_string("value")!!.to_uint()) {
            value_value.appendf("%s", value.get_string("value")!!);
          } else if (value.get_string("value")!!.contains("<<")) { // TODO: remove this branch duplication
            value_value.appendf("%s", value.get_string("value")!!);
          } else if (value.get_string("value")!!.contains("-")) {
            value_value.appendf("%d", value.get_long("calc_value")!!);
          } else {
            value_value.appendf("%s", to_constant_case(&buffer, clean_imgui(value.get_string("value")!!)));
          }
        }

        cleaned_values.push({ enum_value_map.get(value.get_string("name")!!)!!, value_value });
        distinct_enum_map.set(name.strip_end("_"), clean_enum(name));
      }
    }

    { // Output
      usz max_len = cleaned_values[0].first.len;
      foreach (entry : cleaned_values) {
        max_len = math::max(entry.first.len, max_len);
      }
      foreach (entry : cleaned_values) {
        (void)io::fprintf(&output, "const %s %s", clean_enum(name), entry.first);
        (void)fpad(&output, " ", max_len - entry.first.len);
        (void)io::fprintf(&output, " = %s;\n", entry.second);

        entry.second.free();
      }
      (void)io::fprintf(&output, "\n");
    }
  };
}

fn void output_templated_structs(Object* json_obj, String output_path) {
  //io::printf("Outputting templated structs...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();

  DString buffer;
  buffer.temp_init();

  json_obj.get("templated_structs")!!.map.@each(; String name, Object* members) {
    if (catch blacklist_structs.get(name)) {
      String typename = json_obj.get("typenames")!!.get_string(name)!!;
      assert(typename == "T");

      (void)io::printf("module %s::%s(<Type>);\n", IMGUI_MODULE_NAME, to_snake_case(&buffer, clean_imgui(name)));
      (void)io::printf("// %s\n", name);
      (void)io::printf("struct %s {\n", clean_imgui(name));

      assert(members.is_array());
      foreach (member : members.array) {
        if (member.get_string("type")!!.starts_with(typename)) {
          (void)io::printf("  Type%s %s;\n", member.get_string("type")!!.strip(typename), to_snake_case(&buffer, member.get_string("name")!!));
        } else {
          (void)io::printf("  %s %s;\n", member.get_string("type")!!, to_snake_case(&buffer, member.get_string("name")!!));
        }
      }
      (void)io::printf("}\n\n");
    }
  };
}

fn void output_structs(Object* json_obj, String output_path) {
  //io::printf("Outputting structs...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();

  DString buffer;
  buffer.temp_init();

  io::printf("module %s;\n", IMGUI_MODULE_NAME);

  json_obj.get("structs")!!.map.@each(; String name, Object* members) {
    if (try loc = json_obj.get("locations")!!.get(name) && !loc.s.starts_with("imgui_internal") && !loc.s.starts_with("imstb_textedit")) {
      io::printf("// %s\n", name);
      io::printf("struct %s {\n", struct_map.get(name)!!);

      List(<DString>) callbacks;
      assert(members.is_array());
      foreach (member : members.array) {
        DString member_type_buffer;
        member_type_buffer.temp_init();
        String member_type = clean_type(&member_type_buffer, member.get_string("type")!!);

        if (try s = member.get_string("name")!!.index_of_char('[') && try e = member.get_string("name")!!.index_of_char(']')) {
          String key = member.get_string("name")!![s+1..e-1];
          if (try value = enum_value_map.get(key)) {
            io::printf("  %s[(usz)%s] %s;\n", member_type, value, to_snake_case(&buffer, member.get_string("name")!![..s-1]));
          } else {
            io::printf("  %s[(usz)(%s)] %s;\n", member_type, key, to_snake_case(&buffer, member.get_string("name")!![..s-1]));
          }
        } else {
          if (member_type.starts_with("fn")) {
            DString fn_buffer;
            fn_buffer.temp_init();
            String type = to_pascal_case(&fn_buffer, to_snake_case(&buffer, member.get_string("name")!!));
            io::printf("  %sCallback %s;\n", type, to_snake_case(&buffer, member.get_string("name")!!));

            DString func_def_buffer;
            func_def_buffer.appendf("def %sCallback = %s;", type, member_type);
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

fn void output_typedefs(Object* json_obj, String output_path) {
  //io::printf("Outputting typedefs...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();

  DString buffer;
  buffer.temp_init();

  List(<Tuple(<String, String>)>) typedefs;

  // Gather
  json_obj.map.@each(; String name, Object* values) {
    if (catch blacklist_typedefs.get(name)) {
      if (!values.s.starts_with("struct")) {
        typedefs.push({name, values.s});
      }
    }
  };

  sort::quicksort(
    typedefs,
    fn int(Tuple(<String, String>) a, Tuple(<String, String>) b) {
      return get_typedef_order(a) - get_typedef_order(b);
    }
  );

  io::printf("module %s;\n", IMGUI_MODULE_NAME);

  foreach (typedef : typedefs) {
    if (try typedef.second.index_of("(*)")) {
      io::printf("def %sCallback = %s;\n", clean_imgui(typedef.first).strip_end("Callback"), clean_callback(&buffer, typedef.second[..^2]));
    } else {
      if (try type = distinct_enum_map.get(typedef.first)) {
        io::printf("def %s = %s;\n", typedef.first, type);
      } else {
        String type_name = typedef_names_map.get(typedef.first) ?? clean_imgui(typedef.first);
        if (try value = typedef_names_map.get(typedef.second)) {
          io::printf("def %s = %s;\n", type_name, value);
        } else if (try def_type = type_map.get(typedef.second)) {
          io::printf("def %s = %s;\n", type_name, def_type);
        } else {
          io::printf("def %s = %s;\n", type_name, clean_imgui(typedef.second));
        }
      }
    }
  };
}

fn int get_typedef_order(Tuple(<String, String>) typedef) {
  if (try typedef.second.index_of("(*)")) {
    return 1;
  } else {
    if (try type = distinct_enum_map.get(typedef.first)) {
      return 2;
    } else {
      if (try value = typedef_names_map.get(typedef.second)) {
        return 3;
      } else if (try def_type = type_map.get(typedef.second)) {
        return 4;
      } else {
        return 5;
      }
    }
  }
}

fn String clean_callback(DString* buffer, String cb) {
  usz s = cb.index_of("(*)")!!;
  buffer.clear();

  buffer.append_chars("fn ");
  String type = clean_type(buffer, cb[..s-1]);
  buffer.append_chars("(");
  String args = cb[s+4..^2];
  foreach (idx, arg : args.split(",")) {
    if (idx != 0) {
      buffer.appendf(", ");
    }
    DString type_buffer;
    type_buffer.temp_init();
    buffer.appendf("%s %s", clean_type(&type_buffer, arg[..arg.rindex_of_char(' ')!!-1]), arg[arg.rindex_of_char(' ')!!+1..]);
  }
  buffer.appendf(")");
  return buffer.str_view();
}

fn String clean_enum(String name) {
  return clean_imgui(name).trim().strip_end("_");
}

fn String clean_type(DString* buffer, String orig_type) {
  if (try orig_type.index_of("(*)")) {
    DString fn_buffer;
    fn_buffer.temp_init();
    buffer.appendf("%s", clean_callback(&fn_buffer, orig_type));
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

