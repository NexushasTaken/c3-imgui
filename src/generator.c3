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
  Object* functions_json = get_file_json(DEFINITIONS_JSON);

  assert(types_json.is_map());
  digest_types(types_json);
  output_enums(types_json, "enums.c3");
  output_structs(types_json, "structs.c3");
  //output_templated_structs(types_json, "templated_structs.c3");
  output_typedefs(typedefs_json, "typedefs.c3");
  output_functions(functions_json, "wrappers.c3", "imgui.c3i");

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
      enum_value_map.set(value.get_string("name")!!, value_name.copy_str());
    }
  };
}

def TupleDString = Tuple(<String, DString>);

fn void output_enums(Object* json_obj, String output_path) {
  io::printf("Outputting enums...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();

  output_header(&output);

  json_obj.get("enums")!!.map.@each(; String name, Object* values) {
    @start_string_builder(&output; DString* sb) {
      sb.appendf("// %s\n", name);

      // distinct enum declaration
      sb.appendf("def %s = ", enum_map.get(name)!!);
      if (try ctype = json_obj.get("enumtypes")!!.get_string(name)) { // typed enum
        sb.appendf("%s", type_map.get(ctype)!!);
      } else {
        sb.appendf("int");
      }
      sb.appendf(";\n");
    };

    List(<TupleDString>) cleaned_values;

    assert(values.is_array());
    { // Gather
      foreach (type : values.array) {
        DString type_value;

        if (try type.get_string("value")!!.index_of_char('|')) {
          foreach (i, v : type.get_string("value")!!.split("|")) {
            if (i != 0) {
              type_value.appendf(" | ");
            }
            type_value.appendf("%s", enum_value_map.get(v.trim())!!);
          }
        } else {
          if (try type.get_string("value")!!.to_uint()) {
            type_value.appendf("%s", type.get_string("value")!!);
          } else if (type.get_string("value")!!.contains("<<")) { // TODO: remove this branch duplication
            type_value.appendf("%s", type.get_string("value")!!);
          } else if (type.get_string("value")!!.contains("-")) {
            type_value.appendf("%d", type.get_long("calc_value")!!);
          } else {
            to_constant_case(&type_value, clean_imgui(type.get_string("value")!!));
          }
        }

        cleaned_values.push({ enum_value_map.get(type.get_string("name")!!)!!, type_value });
        distinct_enum_map.set(name.strip_end("_"), clean_enum(name));
      }
    }

    // Output
    @start_string_builder(&output, 516; DString* sb) {
      usz max_len = cleaned_values[0].first.len;
      foreach (entry : cleaned_values) {
        max_len = math::max(entry.first.len, max_len);
      }
      foreach (entry : cleaned_values) {
        sb.appendf("const %s %s", clean_enum(name), entry.first);
        sb.append_repeat(' ', max_len - entry.first.len);
        sb.appendf(" = %s;\n", entry.second);

        entry.second.free();
      }
      sb.appendf("\n");
    };
  };
}

// ISSUE: bitfields MUST be handled
fn void output_templated_structs(Object* json_obj, String output_path) {
  io::printf("Outputting templated structs...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();

  output_header(&output);
  json_obj.get("templated_structs")!!.map.@each(; String name, Object* members) {
    if (catch blacklist_structs.get(name)) {
      @start_string_builder(&output; DString* sb) {
        String typename = json_obj.get("typenames")!!.get_string(name)!!;
        assert(typename == "T");

        sb.appendf("module %s::", IMGUI_MODULE_NAME);
        to_snake_case(sb, clean_imgui(name));
        sb.appendf("(<Type>);\n");
        sb.appendf("// %s\n", name);
        sb.appendf("struct %s {\n", clean_imgui(name));

        assert(members.is_array());
        foreach (member : members.array) {
          sb.appendf("\t");
          if (member.get_string("type")!!.starts_with(typename)) {
            sb.appendf("Type%s", member.get_string("type")!!.strip(typename));
          } else {
            sb.appendf("%s", member.get_string("type")!!);
          }
          sb.appendf(" ");
          to_snake_case(sb, member.get_string("name")!!);
          sb.appendf(";\n");
        }
        sb.appendf("}\n\n");
      };
    }
  };
}

fn void output_structs(Object* json_obj, String output_path) {
  io::printf("Outputting structs...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();

  output_header(&output);

  json_obj.get("structs")!!.map.@each(; String name, Object* members) {
    if (try loc = json_obj.get("locations")!!.get(name) && !loc.s.starts_with("imgui_internal") && !loc.s.starts_with("imstb_textedit")) {
      @start_string_builder(&output, 516; DString* sb) {
        sb.appendf("// %s\n", name);
        sb.appendf("struct %s {\n", struct_map.get(name)!!);

        DString callbacks;
        callbacks.temp_init();

        usz bitfield_count = 0;
        assert(members.is_array());
        foreach (member : members.array) {
          String member_name = member.get_string("name")!!;

          // WARNING: for now, lets stick with this implementation
          if (try size = member.get("bitfield")) {
            assert(name == "ImFontGlyph");
            assert(member.get_string("type")!! == "unsigned int");
            if (bitfield_count < 2) {
              bitfield_count += 1;
              continue;
            }
            sb.appendf("\tbitstruct : uint {\n");
            sb.appendf("\t\tuint colored : 0..0;\n");
            sb.appendf("\t\tuint visible : 1..1;\n");
            sb.appendf("\t\tuint codepoint : 2..31;\n");
            sb.appendf("\t}\n");
            continue;
          }

          sb.appendf("\t");
          if (try s = member_name.index_of_char('[') && try e = member_name.index_of_char(']')) {
            String key = member_name[s+1..e-1];

            clean_type(sb, member.get_string("type")!!);
            sb.appendf("[(usz)(%s)] ", enum_value_map.get(key) ?? key);
            if (member_name.starts_with("_")) {
              sb.appendf("_");
            }
            to_snake_case(sb, member_name[..s-1]);
            sb.appendf(";\n");
          } else {
            if (member.get_string("type")!!.contains("(*)")) {
              // member
              make_member_callback_name(sb, member);
              sb.appendf(" ");
              if (member_name.starts_with("_")) {
                sb.appendf("_");
              }
              to_snake_case(sb, member_name);
              sb.appendf(";\n");

              // function pointer
              callbacks.appendf("def ");
              make_member_callback_name(&callbacks, member);
              callbacks.appendf(" = ");
              clean_type(&callbacks, member.get_string("type")!!);
              callbacks.appendf(";\n");
            } else if (member.get_string("type")!!.starts_with("union")) {
              clean_type(sb, member.get_string("type")!!); // member union
              sb.appendf("\n");
            } else {
              clean_type(sb, member.get_string("type")!!);
              sb.appendf(" ");
              if (member_name.starts_with("_")) {
                sb.appendf("_");
              }
              to_snake_case(sb, member_name);
              sb.appendf(";\n");
            }
          }
        }
        sb.appendf("}\n\n");
        if (callbacks.len() > 0) {
          sb.appendf("%s\n", callbacks);
        }
      };
    }
  };
}

def TupleString = Tuple(<String, String>);

fn void output_typedefs(Object* json_obj, String output_path) {
  io::printf("Outputting typedefs...\n");
  File output = file::open(output_path, "w")!!;
  defer (void)output.close();

  List(<TupleString>) typedefs;

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

  output_header(&output);

  foreach (typedef : typedefs) {
    @start_string_builder(&output; DString* sb) {
      sb.appendf("def ");
      if (try typedef.second.index_of("(*)")) {
        sb.appendf("%s = ", clean_imgui(typedef.first));
        clean_callback(sb, typedef.second);
      } else {
        if (try type = distinct_enum_map.get(typedef.first)) {
          sb.appendf("%s = %s", typedef.first, type);
        } else {
          sb.appendf("%s = ", typedef_names_map.get(typedef.first) ?? clean_imgui(typedef.first)); // type name
          if (try value = typedef_names_map.get(typedef.second)) {
            sb.appendf("%s", value);
          } else if (try def_type = type_map.get(typedef.second)) {
            sb.appendf("%s", def_type);
          } else {
            sb.appendf("%s", clean_imgui(typedef.second));
          }
        }
      }
      sb.appendf(";\n");
    };
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

