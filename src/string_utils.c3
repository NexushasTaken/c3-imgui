module generator;
import std::io;
import std::ascii;
import std::collections::map;
import std::collections::list;
import std::collections::object;
import std::io::file;

HashMap(<String, String>) type_map;
HashMap(<String, int>) blacklist_structs;
HashMap(<String, int>) blacklist_typedefs;

HashMap(<String, String>) distinct_enum_map;

HashMap(<String, String>) typedef_names_map;

HashMap(<String, String>) struct_map;
HashMap(<String, String>) enum_map;
HashMap(<String, String>) enum_value_map; // 'value' is allocated

macro String! find_enum_starts_with(String needle) {
  enum_map.@each(; String type, String alt) {
    if (needle.starts_with(type)) {
      return type;
    }
  };
  return SearchResult.MISSING?;
}

macro String! find_struct_starts_with(String needle, bool use_alt = false) {
  struct_map.@each(; String type, String alt) {
    if (needle.starts_with(use_alt ? alt : type)) {
      return type;
    }
  };
  return SearchResult.MISSING?;
}

macro String! find_type_starts_with(String needle) {
  type_map.@each(; String type, String alt) {
    if (needle.starts_with(type)) {
      return type;
    }
  };
  return SearchResult.MISSING?;
}

fn void init_type_map() @init {
  type_map.set("void"          , "void");
  type_map.set("char"          , "char"); // TODO: C char as C3 char?
  type_map.set("signed char"   , "ichar"); 
  type_map.set("unsigned char" , "char"); 
  type_map.set("unsigned short", "ushort"); 
  type_map.set("short"         , "short"); 
  type_map.set("signed short"  , "short"); 
  type_map.set("unsigned int"  , "uint"); 
  type_map.set("signed int"    , "int"); 
  type_map.set("int"           , "int"); 
  type_map.set("float"         , "float"); 
  type_map.set("size_t"        , "usz"); 
  type_map.set("bool"          , "bool"); 
  type_map.set("long long"     , "long");
  type_map.set("unsigned long long", "ulong");
  type_map.set("signed long long", "long");

  //type_map.set("float&", "float*"); // TODO: is reference type is pointer equivalent?

  //type_map.set("ImS8", "ichar");
  //type_map.set("ImU8", "char");
  //type_map.set("ImS16", "short");
  //type_map.set("ImU16", "ushort");
  //type_map.set("ImS32", "int");
  //type_map.set("ImU32", "uint");
  //type_map.set("ImS64", "long");
  //type_map.set("ImU64", "ulong");

  type_map.set("ImS8" , "ImU8");
  type_map.set("ImU8" , "ImU8");
  type_map.set("ImS16", "ImU16");
  type_map.set("ImU16", "ImU16");
  type_map.set("ImS32", "ImU32");
  type_map.set("ImU32", "ImU32");
  type_map.set("ImS64", "ImU64");
  type_map.set("ImU64", "ImU64");

  type_map.set("ImChunkStream_ImGuiWindowSettings", "ImChunkStream(<WindowSettings>)"); 

  type_map.set("ImPool_ImGuiTabBar", "ImPool(<TabBar>)"); 

  //type_map.set("ImVector_ImGuiWindowPtr"       , "ImVector(<ImWindow*>)"); 
  //type_map.set("ImVector_ImGuiPtrOrIndex"      , "ImVector(<PtrOrIndex>)"); 
  type_map.set("ImVector_ImGuiSettingsHandler" , "vector::Vector(<SettingsHandler>)"); 
  type_map.set("ImVector_ImGuiID"              , "vector::Vector(<ImID>)"); 
  type_map.set("ImVector_ImGuiItemFlags"       , "vector::Vector(<ItemFlags>)"); 
  type_map.set("ImVector_ImDrawListPtr"        , "vector::Vector(<DrawList*>)"); 
  type_map.set("ImVector_ImTextureID"          , "vector::Vector(<TextureID>)"); 
  type_map.set("ImVector_ImWchar"              , "vector::Vector(<Wchar>)"); 
  type_map.set("ImVector_ImVec2"               , "vector::Vector(<Vec2>)"); 
  type_map.set("ImVector_ImVec4"               , "vector::Vector(<Vec4>)"); 
  type_map.set("ImVector_ImGuiTextRange"       , "vector::Vector(<TextRange>)"); 
  type_map.set("ImVector_ImGuiStoragePair"     , "vector::Vector(<StoragePair>)"); 
  type_map.set("ImVector_ImFontConfig"         , "vector::Vector(<FontConfig>)"); 
  type_map.set("ImVector_ImFontAtlasCustomRect", "vector::Vector(<FontAtlasCustomRect>)"); 
  type_map.set("ImVector_ImFontPtr"            , "vector::Vector(<Font*>)"); 
  type_map.set("ImVector_ImFontGlyph"          , "vector::Vector(<FontGlyph>)"); 
  type_map.set("ImVector_ImDrawChannel"        , "vector::Vector(<DrawChannel>)"); 
  type_map.set("ImVector_ImDrawCmd"            , "vector::Vector(<DrawCmd>)"); 
  type_map.set("ImVector_ImDrawIdx"            , "vector::Vector(<DrawIdx>)"); 
  type_map.set("ImVector_ImDrawVert"           , "vector::Vector(<DrawVert>)"); 
  type_map.set("ImVector_ImGuiViewportPtr"     , "vector::Vector(<Viewport*>)"); 
  type_map.set("ImVector_ImGuiPlatformMonitor" , "vector::Vector(<PlatformMonitor>)"); 
  type_map.set("ImVector_ImGuiSelectionRequest", "vector::Vector(<SelectionRequest>)"); 
  type_map.set("ImVector_ImU32"                , "vector::Vector(<uint>)"); 
  type_map.set("ImVector_float"                , "vector::Vector(<float>)"); 
  type_map.set("ImVector_char"                 , "vector::Vector(<char>)"); 
  type_map.set("ImVector_unsigned_char"        , "vector::Vector(<char>)"); 

  type_map.set("ImGuiIO", "ImIO");
  type_map.set("ImGuiID", "ImID");

  // Opaque Structs
  type_map.set("ImGuiContext*", "void*");
  type_map.set("ImFontBuilderIO*", "void*");
  type_map.set("ImDrawListSharedData*", "void*");
}

fn void init_blacklist_typedefs() @init {
  blacklist_typedefs.set("iterator", 0);
  blacklist_typedefs.set("const_iterator", 0);
  blacklist_typedefs.set("value_type", 0);
}

fn void init_blacklist_structs() @init {
  blacklist_structs.set("ImBitArray", 0);
  blacklist_structs.set("ImChunkStream", 0);
  blacklist_structs.set("ImPool", 0);
  blacklist_structs.set("ImSpan", 0);
  blacklist_structs.set("ImSpanAllocator", 0);
}

fn void init_struct_map() @init {
  struct_map.set("ImGuiIO", "ImIO");
  struct_map.set("ImGuiID", "ImID");
}

fn void init_typedef_names_map() @init {
  typedef_names_map.set("ImGuiID", "ImID");

  typedef_names_map.set("ImS16", "ImS16");
  typedef_names_map.set("ImS8" , "ImS8");
  typedef_names_map.set("ImS32", "ImS32");
  typedef_names_map.set("ImU32", "ImU32");
  typedef_names_map.set("ImU8" , "ImU8");
  typedef_names_map.set("ImU16", "ImU16");
  typedef_names_map.set("ImU64", "ImU64");
  typedef_names_map.set("ImS64", "ImS64");
}

macro void @start_string_builder(File* output, usz capacity = 16; @body(sb_name)) {
  @pool() {
    DString sb;
    sb.temp_init(capacity);
    defer io::fprintf(output, "%s", sb)!!;
    @body(&sb);
  };
}

fn usz String.count_chars(s, char needle) {

  usz count = 0;
  foreach (c : s) {
    if (c == needle) {
      count += 1;
    }
  }
  return count;
}

fn String clean_ptr(String str, usz* ptr_count = null) {
  if (try i = str.index_of_char('*')) {
    if (ptr_count != null) {
      *ptr_count = str.count_chars('*');
    }
    return str[:i];
  }
  return str;
}

// INFO: add struct name as callback prefix?
fn DString* make_member_callback_name(DString* sb, Object* member) {
  to_pascal_case(sb, member.get_string("name")!!);
  sb.appendf("_Func");
  return sb;
}

// str = type param, type param, ...
fn DString* clean_params(DString* sb, String params) {
  foreach (idx, param : params.split(",")) {
    if (idx != 0) {
      sb.appendf(", ");
    }
    clean_type(sb, param[..param.rindex_of_char(' ')!!-1]);
    sb.appendf(" %s", param[param.rindex_of_char(' ')!!+1..]);
  }
  return sb;
}

fn DString* clean_callback(DString* sb, String cb) {
  usz s = cb.index_of("(*)")!!;

  sb.append_chars("fn ");
  clean_type(sb, cb[..s-1]);
  String params = cb[s+3..cb.rindex_of_char(')')!!].trim("()");
  sb.appendf("(");
  clean_params(sb, params);
  sb.appendf(")");
  return sb;
}

fn String clean_enum(String name) {
  return clean_imgui(name).trim().strip_end("_");
}

// INFO: convert function pointer into function pointer name instead of converting the function pointer itself?, or just remove this operation?
fn DString* clean_type(DString* sb, String orig_type) {
  if (try orig_type.index_of("(*)")) {
    clean_callback(sb, orig_type);
  } else {
    orig_type = orig_type.trim();
    if (orig_type.starts_with("const char*")) {
      sb.append_chars("ZString");
      if (orig_type.ends_with("[]")) {
        sb.append_chars("[]");
      }
    } else {
      assert(!orig_type.contains("[]"));
      orig_type = orig_type.strip("const ");

      if (try type = type_map.get(orig_type)) {
        sb.append_chars(type);
      } else if (try type = find_type_starts_with(orig_type)) {
        String after = orig_type[type.len..];
        String before = type_map.get(type)!!;
        sb.appendf("%s%s", before, after);
      } else {
        sb.append_chars(clean_imgui(orig_type));
      }
    }
  }
  return sb;
}

fn void test_clean_type() @test {
  io::printn();
  DString buffer;
  buffer.temp_init();
  buffer.clear();
  io::printfn("%s", clean_type(&buffer, "ImHello").str_view());
  buffer.clear();
  io::printfn("%s", clean_type(&buffer, "ImGuiHello").str_view());
  buffer.clear();
  io::printfn("%s", clean_type(&buffer, "Hello").str_view());
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

fn DString* clean_arguments(DString* sb, String args, String prefix = "") {
  args = args.trim("()");
  sb.appendf("%s", prefix);
  foreach (idx, arg : args.split(",")) {
    if (idx != 0) {
      sb.appendf(", ");
    }
    sb.appendf("%s", arg);
  }
  return sb;
}

fn void clean_value(DString* sb, String s, String type) {
  if (s == "NULL") {
    sb.append_chars("null");
  } else if (type == "bool") {
    sb.appendf("%s", s);
  } else if (s.starts_with("sizeof")) {
    sb.appendf("%s.sizeof", s[s.index_of_char('(')!!+1..s.index_of_char(')')!!-1]);
  } else if (type.starts_with("Vec")) {
    sb.appendf("{");
    clean_arguments(sb, s[s.index_of_char('(')!!..s.index_of_char(')')!!]);
    sb.appendf("}");
  } else if (type == "ZString") {
    sb.appendf("\"%s\"", s);
  } else if (try s.to_float() && type == "float") {
    sb.appendf("%s", s);
  } else if (type == "float" && s.starts_with("FLT_")) {
    sb.appendf("%s", s == "FLT_MAX" ? "float.max" : "float.min");
  } else if (try s.to_double() && type == "double") {
    sb.appendf("%s", s);
  } else if (try s.to_int128()) {
    sb.appendf("%s", s);
  } else {
    unreachable("[clean_value]: unhandled case %s -> %s", type, s);
  }
}

fn void output_header(File* output) {
  io::fprintf(output, "module %s;\n\n", IMGUI_MODULE_NAME)!!;
}

fn void test_clean_ptr() @test {
  io::printn();
  usz p = 0;
  io::printfn("%s", clean_ptr("void*", &p));
}

fn bool is_valid_constant(String str) {
  if (!ascii::is_alpha(str[0])) {
    return false;
  }
  if (!ascii::is_upper(str[0])) {
    return false;
  }
  foreach (c : str[1..]) {
    if (ascii::is_lower(c)) {
      return false;
    }
  }
  return true;
}

fn void test_is_valid_constant() @test {
  assert(is_valid_constant("HELLO_WORLD") == true);
  assert(is_valid_constant("HELLO_world") == false);
  assert(is_valid_constant("hello_WORLD") == false);
  assert(is_valid_constant("_HELLO_WORLD") == false);
  assert(is_valid_constant("1HELLO_WORLD") == false);
  assert(is_valid_constant("HELLO_123") == true);
  assert(is_valid_constant("8") == false);
}

//------------------------------------------------------------------------------------
// Change case functions

def MatchWord = fn String(String);
def FormatWord = fn void(DString*, String, usz);

macro bool char.is_digit_upper(c) => c.is_digit() || c.is_upper();
macro bool char.is_digit_lower(c) => c.is_digit() || c.is_lower();
macro bool char.is_alpha_digit(c) => c.is_digit() || c.is_alpha();

fn String match_lowercased(String str) @local {
  if (str.len == 0) {
    return str;
  }
  usz i = 0;
  while (i < str.len && str[i].is_digit_lower()) {
    i++;
  }
  return str[:i];
}

fn String match_capitalized(String str) @local {
  if (str.len == 0) {
    return str;
  }
  if (str[0].is_digit_lower() || !str[0].is_alpha()) {
    return str[:0];
  }
  String word = match_lowercased(str[1..]);
  if (word.len == 0) {
    return str[:0];
  }
  return str[..word.len];
}

// HELLO -> HELLO
// HELLo -> 
fn String match_uppercased_whole(String str) @local {
  if (str.len == 0) {
    return str;
  }
  foreach (c : str) {
    if (!c.is_digit_upper()) {
      return str[:0];
    }
  }
  return str;
}

// HELLOWorld -> HELLO
fn String match_uppercased_word(String str) @local {
  if (str.len == 0) {
    return str;
  }
  usz i = 0;
  while (i < str.len && str[i].is_alpha() && match_capitalized(str[i..]).len == 0) {
    i++;
  }
  return str[:i];
}

// HELLOWorld -> HELLOW
fn String match_uppercased(String str) @local {
  if (str.len == 0) {
    return str;
  }
  if (!str[0].is_alpha() || str[0].is_lower()) {
    return str[:0];
  }
  usz i = 0;
  while (i < str.len && (str[i].is_upper() || str[i].is_digit())) {
   i++;
  }
  return str[:i];
}

/*
([a-z]+)
([A-Z][a-z0-9]+)
([A-Z0-9]+$)
([A-Z]+(?=[A-Z][a-z0-9]+))
([A-Z0-9]+)
[^A-Za-z0-9]
*/

fn void fmt_lowercase(DString* buf, String str, usz n) {
  foreach (c : str) {
    buf.append_char(c.to_lower());
  }
}

fn void fmt_uppercase(DString* buf, String str, usz n) {
  foreach (c : str) {
    buf.append_char(c.to_upper());
  }
}

fn void fmt_capitalized(DString* buf, String str, usz n) {
  foreach (i, c : str) {
    if (i != 0) {
      buf.append_char(c.to_lower());
    } else {
      buf.append_char(c.to_upper());
    }
  }
}

fn void fmt_camelized(DString* buf, String str, usz n) {
  foreach (i, c : str) {
    if (n == 0) {
      buf.append_char(c.to_lower());
    } else {
      if (i != 0) {
        buf.append_char(c.to_lower());
      } else {
        buf.append_char(c.to_upper());
      }
    }
  }
}

fn String change_case(DString* buffer, String str, String delimiter, FormatWord fmt_word, bool clear = true) {
  List(<MatchWord>) matchs;
  matchs.push(&match_lowercased);
  matchs.push(&match_capitalized);
  matchs.push(&match_uppercased_whole);
  matchs.push(&match_uppercased_word);
  matchs.push(&match_uppercased);

  if (clear) {
    buffer.clear();
  }
  usz words = 0;
  usz i = 0;
  while (i < str.len) {
    if (!str[i].is_alnum()) {
      i += 1;
      continue;
    }
    foreach (cb : matchs) {
      String word = cb(str[i..]);
      if (word.len > 0) {
        i += word.len;
        if (words != 0) {
          buffer.append_chars(delimiter);
        }
        fmt_word(buffer, word, words);
        words += 1;
        break;
      }
    }
  }
  return buffer.str_view();
}

macro String to_constant_case(DString* buffer, String str, bool clear = false) => change_case(buffer, str, "_", &fmt_uppercase, clear);
macro String to_camel_case(DString* buffer, String str, bool clear = false) => change_case(buffer, str, "", &fmt_camelized, clear);
macro String to_pascal_case(DString* buffer, String str, bool clear = false) => change_case(buffer, str, "", &fmt_capitalized, clear);
macro String to_snake_case(DString* buffer, String str, bool clear = false) => change_case(buffer, str, "_", &fmt_lowercase, clear);

macro @assert_equal(#left, #right) {
  assert((#left) == (#right), "%d : \"%s\" != \"%s\"", ($$LINE), (#left), (#right));
}

fn void test_match_lowercased() @test {
  @assert_equal(match_lowercased("foo"), "foo");
  @assert_equal(match_lowercased("fooBar"), "foo");
  @assert_equal(match_lowercased("foo Bar"), "foo");
  @assert_equal(match_lowercased("foo_Bar"), "foo");
  @assert_equal(match_lowercased("foo1Bar"), "foo1");
  @assert_equal(match_lowercased("foo1bar"), "foo1bar");
  @assert_equal(match_lowercased("Bar"), "");
  @assert_equal(match_lowercased("BAR"), "");
  @assert_equal(match_lowercased("fOO"), "f");
  @assert_equal(match_lowercased("1"), "1");
  @assert_equal(match_lowercased("00"), "00");
  @assert_equal(match_lowercased("f"), "f");
  @assert_equal(match_lowercased("_"), "");
  @assert_equal(match_lowercased(" "), "");
}

fn void test_match_capitalized() @test {
  @assert_equal(match_capitalized("foo"), "");
  @assert_equal(match_capitalized("123"), "");
  @assert_equal(match_capitalized("f00"), "");
  @assert_equal(match_capitalized("Foo Bar"), "Foo");
  @assert_equal(match_capitalized("Foo_Bar"), "Foo");
  @assert_equal(match_capitalized("Foo.Bar"), "Foo");
  @assert_equal(match_capitalized("Foo8Bar"), "Foo8");
  @assert_equal(match_capitalized("FooBar"), "Foo");
  @assert_equal(match_capitalized("FoBar"), "Fo");
  @assert_equal(match_capitalized("FBar"), "");
  @assert_equal(match_capitalized("F00"), "F00");
}

fn void test_match_uppercased_whole() @test {
  @assert_equal(match_uppercased_whole("FOO"), "FOO");
  @assert_equal(match_uppercased_whole("F00"), "F00");
  @assert_equal(match_uppercased_whole("1FOO2"), "1FOO2");
  @assert_equal(match_uppercased_whole("123"), "123");
  @assert_equal(match_uppercased_whole("Foo"), "");
  @assert_equal(match_uppercased_whole(""), "");
  @assert_equal(match_uppercased_whole("F-"), "");
  @assert_equal(match_uppercased_whole("F_"), "");
  @assert_equal(match_uppercased_whole("fOO"), "");
}

fn void test_match_uppercase_word() @test {
  @assert_equal(match_uppercased_word("FOO_"), "FOO");
  @assert_equal(match_uppercased_word("HELLOWorld"), "HELLO");
  @assert_equal(match_uppercased_word("IO_ImGuiIO"), "IO");
  @assert_equal(match_uppercased_word("_ImGuiIO"), "");
}

fn void test_to_snake_case() @test {
  DString buffer;
  buffer.temp_init();
  @assert_equal(to_snake_case(&buffer, "VSlider", true), "v_slider");
  @assert_equal(to_snake_case(&buffer, "HelloWorld", true), "hello_world");
  @assert_equal(to_snake_case(&buffer, "HELLOWorld", true), "hello_world");
  @assert_equal(to_snake_case(&buffer, "DrawFPS", true), "draw_fps");
  @assert_equal(to_snake_case(&buffer, "ITSWorking!", true), "its_working");
  @assert_equal(to_snake_case(&buffer, "hello_world", true), "hello_world");
  @assert_equal(to_snake_case(&buffer, "helloWorld", true), "hello_world");
}

fn void test_to_camel_case() @test {
  DString buffer;
  buffer.temp_init();
  @assert_equal(to_camel_case(&buffer, "VSlider", true), "vSlider");
  @assert_equal(to_camel_case(&buffer, "HelloWorld", true), "helloWorld");
  @assert_equal(to_camel_case(&buffer, "HELLOWorld", true), "helloWorld");
  @assert_equal(to_camel_case(&buffer, "DrawFPS", true), "drawFps");
  @assert_equal(to_camel_case(&buffer, "ITSWorking!", true), "itsWorking");
  @assert_equal(to_camel_case(&buffer, "hello_world", true), "helloWorld");
  @assert_equal(to_camel_case(&buffer, "helloWorld", true), "helloWorld");
}

fn void test_to_constant_case() @test {
  DString buffer;
  buffer.temp_init();
  @assert_equal(to_constant_case(&buffer, "VSlider", true), "V_SLIDER");
  @assert_equal(to_constant_case(&buffer, "HelloWorld", true), "HELLO_WORLD");
  @assert_equal(to_constant_case(&buffer, "HELLOWorld", true), "HELLO_WORLD");
  @assert_equal(to_constant_case(&buffer, "DrawFPS", true), "DRAW_FPS");
  @assert_equal(to_constant_case(&buffer, "ITSWorking!", true), "ITS_WORKING");
  @assert_equal(to_constant_case(&buffer, "hello_world", true), "HELLO_WORLD");
  @assert_equal(to_constant_case(&buffer, "helloWorld", true), "HELLO_WORLD");
}

fn void test_to_pascal_case() @test {
  DString buffer;
  buffer.temp_init();
  @assert_equal(to_pascal_case(&buffer, "VSlider", true), "VSlider");
  @assert_equal(to_pascal_case(&buffer, "HelloWorld", true), "HelloWorld");
  @assert_equal(to_pascal_case(&buffer, "HELLOWorld", true), "HelloWorld");
  @assert_equal(to_pascal_case(&buffer, "DrawFPS", true), "DrawFps");
  @assert_equal(to_pascal_case(&buffer, "ITSWorking!", true), "ItsWorking");
  @assert_equal(to_pascal_case(&buffer, "hello_world", true), "HelloWorld");
  @assert_equal(to_pascal_case(&buffer, "helloWorld", true), "HelloWorld");
}

fn void test_change_case2() @test {
  io::printn();
  DString buffer;
  buffer.temp_init();

  io::printfn("\n// Match uppercased word");
  io::printfn("%s", match_uppercased_word("FOO_"));
  io::printfn("%s", match_uppercased_word("HELLOWorld"));
  io::printfn("%s", match_uppercased_word("IO_ImGuiIO"));
  io::printfn("%s", match_uppercased_word("_ImGuiIO"));
}
