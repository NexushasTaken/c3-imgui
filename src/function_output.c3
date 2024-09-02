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
  //io::printf("Outputting functions...\n");
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

      String stname = func.get_string("stname")!!.trim();
      if (stname.len > 0) {
        struct_funcs.push(func);
      } else {
        imgui_funcs.push(func);
      }
    }
  };

  output_imgui_func(imgui_funcs);
  //output_struct_func(struct_funcs);
}

fn void output_imgui_func(List(<Object*>) funcs) {
  foreach (func : funcs) {
    DString func_name_buffer;
    func_name_buffer.temp_init();
    String extern_func_name = func.get_string("ov_cimguiname")!!;
    String func_name = to_snake_case(&func_name_buffer, func.get_string("ov_cimguiname")!!.strip("ig"));
    io::printfn("%s -> %s", func_name, extern_func_name);
  }
}

fn void output_struct_func(List(<Object*>) funcs) {
  HashMap(<String, List(<Object*>)>) struct_funcs;

  foreach (func : funcs) {
    io::printfn("%s", func.get_string("cimguiname")!!);
  }
}
