module generator;
import std::io;
import std::ascii;
import std::collections::map;

HashMap(<String, String>) type_map;
HashMap(<String, String>) enum_types;
HashMap(<String, int>) blacklist_structs;
HashMap(<String, String>) opaque_structs;

HashMap(<String, String>) struct_name_map;
HashMap(<String, String>) enum_values_map;

macro String! find_type_starts_with(String needle) {
  type_map.@each(; String type, String alt) {
    if (needle.starts_with(type)) {
      return type;
    }
  };
  return SearchResult.MISSING?;
}

fn void init_type_map() @init {
  type_map.set("char"          , "char"); // TODO: C char as C3 char?
  type_map.set("signed char"   , "ichar"); 
  type_map.set("unsigned char" , "char"); 
  type_map.set("unsigned short", "ushort"); 
  type_map.set("short"         , "short"); 
  type_map.set("unsigned int"  , "uint"); 
  type_map.set("int"           , "int"); 
  type_map.set("float"         , "float"); 
  type_map.set("size_t"        , "usz"); 
  type_map.set("bool"          , "bool"); 

  type_map.set("float&", "float*"); // TODO: is reference type is pointer equivalent?

  type_map.set("ImS8", "ichar");
  type_map.set("ImU8", "char");
  type_map.set("ImS16", "short");
  type_map.set("ImU16", "ushort");
  type_map.set("ImS32", "int");
  type_map.set("ImU32", "uint");
  type_map.set("ImS64", "long");
  type_map.set("ImU64", "ulong");

  type_map.set("ImChunkStream_ImGuiWindowSettings", "ImChunkStream(<WindowSettings>)"); 

  type_map.set("ImPool_ImGuiTabBar", "ImPool(<TabBar>)"); 

  type_map.set("ImVector_ImGuiSettingsHandler" , "ImVector(<SettingsHandler>)"); 
  //type_map.set("ImVector_ImGuiWindowPtr"       , "ImVector(<ImWindow*>)"); 
  type_map.set("ImVector_ImGuiID"              , "ImVector(<ImID>)"); 
  //type_map.set("ImVector_ImGuiPtrOrIndex"      , "ImVector(<PtrOrIndex>)"); 
  type_map.set("ImVector_ImGuiItemFlags"       , "ImVector(<ItemFlags>)"); 
  type_map.set("ImVector_ImDrawListPtr"        , "ImVector(<DrawList*>)"); 
  type_map.set("ImVector_ImTextureID"          , "ImVector(<TextureID>)"); 
  type_map.set("ImVector_ImWchar"              , "ImVector(<Wchar>)"); 
  type_map.set("ImVector_ImVec2"               , "ImVector(<Vec2>)"); 
  type_map.set("ImVector_ImVec4"               , "ImVector(<Vec4>)"); 
  type_map.set("ImVector_ImGuiTextRange"       , "ImVector(<TextRange>)"); 
  type_map.set("ImVector_ImGuiStoragePair"     , "ImVector(<StoragePair>)"); 
  type_map.set("ImVector_ImFontConfig"         , "ImVector(<FontConfig>)"); 
  type_map.set("ImVector_ImFontAtlasCustomRect", "ImVector(<FontAtlasCustomRect>)"); 
  type_map.set("ImVector_ImFontPtr"            , "ImVector(<Font*>)"); 
  type_map.set("ImVector_ImFontGlyph"          , "ImVector(<FontGlyph>)"); 
  type_map.set("ImVector_ImDrawChannel"        , "ImVector(<DrawChannel>)"); 
  type_map.set("ImVector_ImDrawCmd"            , "ImVector(<DrawCmd>)"); 
  type_map.set("ImVector_ImDrawIdx"            , "ImVector(<DrawIdx>)"); 
  type_map.set("ImVector_ImDrawVert"           , "ImVector(<DrawVert>)"); 
  type_map.set("ImVector_ImGuiViewportPtr"     , "ImVector(<Viewport*>)"); 
  type_map.set("ImVector_ImGuiPlatformMonitor" , "ImVector(<PlatformMonitor>)"); 
  type_map.set("ImVector_ImGuiSelectionRequest" , "ImVector(<SelectionRequest>)"); 
  type_map.set("ImVector_ImU32"                , "ImVector(<uint>)"); 
  type_map.set("ImVector_float"                , "ImVector(<float>)"); 
  type_map.set("ImVector_char"                 , "ImVector(<char>)"); 
  type_map.set("ImVector_unsigned_char"        , "ImVector(<char>)"); 

  type_map.set("ImGuiIO", "ImIO");
  type_map.set("ImGuiID", "ImID");

  type_map.set("ImGuiContext*", "void*");
}

fn void init_enum_types() @init {
  enum_types.set("ImGuiMouseCursor_", "int");
}

fn void init_blacklist_structs() @init {
  blacklist_structs.set("ImBitArray", 0);
  blacklist_structs.set("ImChunkStream", 0);
  blacklist_structs.set("ImPool", 0);
  blacklist_structs.set("ImSpan", 0);
  blacklist_structs.set("ImSpanAllocator", 0);
}

fn void init_opaque_structs() @init {
  opaque_structs.set("ImGuiContext*", "void*");
}

fn void init_struct_name_map() @init {
  struct_name_map.set("ImGuiIO", "ImIO");
  struct_name_map.set("ImGuiID", "ImID");
}

fn String to_snake_case(DString* buffer, String str) {
  assert(buffer != null);

  buffer.clear();

  usz idx = 0;
  while (idx < str.len && str[idx] == '_') {
    idx += 1;
  }

  while (idx < str.len) {
    // assuming boundary was found
    if (idx != 0) {
      buffer.append('_');
    }

    bool isupper = false;
    bool pack = false;
    usz word_start = idx;
    usz word_end = idx;

    isupper = ascii::is_upper(str[word_start]);
    if (isupper && word_end + 1 < str.len) {
      pack = ascii::is_upper(str[word_end + 1]);
      word_end += 1;
    }

    // find the word end boundary
    usz jdx;
    for (jdx = word_end + 1; jdx < str.len; jdx++) {
      if (pack) {
        if (ascii::is_lower(str[jdx]) || str[jdx] == '_') {
          break;
        }
      } else {
        if (ascii::is_upper(str[jdx]) || str[jdx] == '_') {
          break;
        }
      }
    }
    word_end = jdx - 1;
    idx = word_end + 1;

    while (idx < str.len && str[idx] == '_') {
      idx += 1;
    }

    foreach (char c : str[word_start..word_end]) {
      buffer.append(ascii::to_lower(c));
    }
  }
  return buffer.str_view();
}

// WARNING: only used for callbacks, param 'str' must be valid snakecased
fn String to_pascal_case(DString* buffer, String str) {
  assert(buffer != null);

  buffer.clear();

  foreach (word : str.split("_")) {
    foreach (i, c : word) {
      if (i == 0) {
        buffer.append_char(ascii::to_upper(c));
      } else {
        buffer.append_char(c);
      }
    }
  }
  return buffer.str_view();
}

fn String to_constant_case(DString* buffer, String str) {
  assert(buffer != null);
  // TODO: do something about this
  DString temp;
  temp.temp_init();
  foreach (c : str) {
    if (c != '_') {
      temp.append_char(c);
    }
  }
  str = temp.str_view();

  buffer.clear();

  usz idx = 0;
  while (idx < str.len) {
    // assuming boundary was found
    if (idx != 0) {
      buffer.append('_');
    }
    while (str[idx] == '_') {
      idx += 1;
    }

    bool isupper = false;
    bool pack = false;
    usz word_start = idx;
    usz word_end = idx;

    isupper = ascii::is_upper(str[word_start]);
    if (isupper && word_end + 1 < str.len) {
      pack = ascii::is_upper(str[word_end + 1]);
      word_end += 1;
    }

    // find the word end boundary
    usz jdx;
    for (jdx = word_end + 1; jdx < str.len; jdx++) {
      if (pack) {
        if (ascii::is_lower(str[jdx])) {
          break;
        }
      } else {
        if (ascii::is_upper(str[jdx])) {
          break;
        }
      }
    }
    word_end = jdx - 1;
    idx = word_end + 1;

    foreach (char c : str[word_start..word_end]) {
      buffer.append(ascii::to_upper(c));
    }
  }
  return buffer.str_view();
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

fn void test_to_snake_case() @test {
  io::printn();
  DString buffer;
  buffer.temp_init();
  io::printfn("%s", to_snake_case(&buffer, "Platform_CreateWindow"));
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

fn void test_to_constant_case() @test {
  io::printn();
  DString buffer;
  buffer.temp_init();
  io::printfn(to_constant_case(&buffer, "ImGuiKey_NamedKey_BEGIN"));
}
