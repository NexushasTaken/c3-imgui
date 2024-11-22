module imgui;

// TODO: Handle these constants properly
const IMGUI_VERSION = "1.91.5";
const IMGUI_VERSION_NUM = 19151;
const IMGUI_HAS_TABLE = true;

macro bool check_version() {
  return imgui::debug_check_version_and_data_layout(IMGUI_VERSION, ImGuiIO.sizeof, Style.sizeof, Vec2.sizeof, Vec4.sizeof, DrawVert.sizeof, DrawIdx.sizeof);
}

