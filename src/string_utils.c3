module generator;
import std::io;
import std::ascii;
import std::collections::map;
import std::collections::list;

HashMap(<String, String>) type_map;
HashMap(<String, int>) blacklist_structs;
HashMap(<String, int>) blacklist_typedefs;
HashMap(<String, String>) opaque_structs;

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

fn void init_opaque_structs() @init {
  //opaque_structs.set("ImGuiContext*", "void*");
  //opaque_structs.set("DrawListSharedData*", "void*");
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

macro void @create_string_builder(File* output; @body(sb_name)) {
  DString sb;
  sb.temp_init();
  defer io::fprintf(output, "%s", sb)!!;
  @body(&sb);
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

fn void test_clean_ptr() @test {
  io::printn();
  usz p = 0;
  io::printfn("%s", clean_ptr("void*", &p));
}

fn usz! fpad(io::OutStream stream, String str, usz len) {
  usz written = 0;
  for (; len > 0; len--) {
    written += io::fprintf(stream, "%s", str)!;
  }
  return written;
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

def MatchWord = fn String(String);
def FormatWord = fn void(DString*, String, usz);

fn String match_lowercased(String str) @local {
  if (str.len == 0) {
    return str;
  }
  if (str[0].is_upper()) {
    return str[:0];
  }
  usz i = 0;
  while (i < str.len-1 && (str[i+1].is_lower() || str[i+1].is_digit())) {
    i++;
  }
  return str[..i];
}

fn String match_capitalized(String str) @local {
  if (str.len == 0) {
    return str;
  }
  if (str[0].is_lower()) {
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
    if (!c.is_digit() && !c.is_upper()) {
      return str[:0];
    }
  }
  return str;
}

// HELLOWorld -> HELLO
fn String match_uppercased(String str) @local {
  if (str.len == 0) {
    return str;
  }
  if (match_capitalized(str).len > 0) {
    return str[:0];
  }
  usz i = 0;
  while (i < str.len && match_capitalized(str[i..]).len == 0) {
    i++;
  }
  return str[..i-1];
}

/*
([a-z]+)
([A-Z][a-z0-9]+)
([A-Z0-9]+$)
([A-Z]+(?=[A-Z][a-z0-9]+))
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

macro String to_constant_case(DString* buffer, String str, bool clear = true) => change_case(buffer, str, "_", &fmt_uppercase, clear);
macro String to_camel_case(DString* buffer, String str, bool clear = true) => change_case(buffer, str, "", &fmt_camelized, clear);
macro String to_pascal_case(DString* buffer, String str, bool clear = true) => change_case(buffer, str, "", &fmt_capitalized, clear);
macro String to_snake_case(DString* buffer, String str, bool clear = true) => change_case(buffer, str, "_", &fmt_lowercase, clear);

fn void test_change_case() @test {
  io::printn();
  DString buffer;
  buffer.temp_init();

  io::printfn("\n// Pascal Case");
  io::printfn("%s", to_pascal_case(&buffer, "VSlider"));
  io::printfn("%s", to_pascal_case(&buffer, "HelloWorld"));
  io::printfn("%s", to_pascal_case(&buffer, "HELLOWorld"));
  io::printfn("%s", to_pascal_case(&buffer, "DrawFPS"));
  io::printfn("%s", to_pascal_case(&buffer, "ITSWorking!"));
  io::printfn("%s", to_pascal_case(&buffer, "hello_world"));
  io::printfn("%s", to_pascal_case(&buffer, "helloWorld"));

  io::printfn("\n// Camel Case");
  io::printfn("%s", to_camel_case(&buffer, "VSlider"));
  io::printfn("%s", to_camel_case(&buffer, "HelloWorld"));
  io::printfn("%s", to_camel_case(&buffer, "HELLOWorld"));
  io::printfn("%s", to_camel_case(&buffer, "DrawFPS"));
  io::printfn("%s", to_camel_case(&buffer, "ITSWorking!"));
  io::printfn("%s", to_camel_case(&buffer, "hello_world"));
  io::printfn("%s", to_camel_case(&buffer, "helloWorld"));

  io::printfn("\n// Constant Case");
  io::printfn("%s", to_constant_case(&buffer, "VSlider"));
  io::printfn("%s", to_constant_case(&buffer, "HelloWorld"));
  io::printfn("%s", to_constant_case(&buffer, "HELLOWorld"));
  io::printfn("%s", to_constant_case(&buffer, "DrawFPS"));
  io::printfn("%s", to_constant_case(&buffer, "ITSWorking!"));
  io::printfn("%s", to_constant_case(&buffer, "hello_world"));
  io::printfn("%s", to_constant_case(&buffer, "helloWorld"));
  io::printfn("%s", to_constant_case(&buffer, "hello_World"));
  io::printfn("%s", to_constant_case(&buffer, "Hello_World"));

  io::printfn("\n// Snake Case");
  io::printfn("%s", to_snake_case(&buffer, "VSlider"));
  io::printfn("%s", to_snake_case(&buffer, "HelloWorld"));
  io::printfn("%s", to_snake_case(&buffer, "HELLOWorld"));
  io::printfn("%s", to_snake_case(&buffer, "DrawFPS"));
  io::printfn("%s", to_snake_case(&buffer, "ITSWorking!"));
  io::printfn("%s", to_snake_case(&buffer, "hello_world"));
  io::printfn("%s", to_snake_case(&buffer, "helloWorld"));
  io::printfn("%s", to_snake_case(&buffer, "TexPixelsRGBA32"));
  io::printfn("%s", to_snake_case(&buffer, "TexPixelsRGBA"));

  io::printfn("\n// Match uppercased whole");
  io::printfn("%s", match_uppercased_whole("RGBA"));
  io::printfn("%s", match_uppercased_whole("8RGBA32"));
  io::printfn("%s", match_uppercased_whole("wRGBA32j"));
}
