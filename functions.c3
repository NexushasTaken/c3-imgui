module imgui;
//igTableGetColumnName(int column_n=-1) table_get_column_name -> ZString
extern fn ZString table_get_column_name(int column_n = -1) @extern("igTableGetColumnName");

//igGetMousePos()(ImVec2 *pOut) get_mouse_pos -> void, 1
extern fn void igGetMousePos(Vec2* pOut) @extern("igGetMousePos");
fn Vec2 get_mouse_pos() @inline {
  Vec2 pOut;
  igGetMousePos(&pOut);
  return pOut;
}

//igLoadIniSettingsFromMemory(const char* ini_data,size_t ini_size=0) load_ini_settings_from_memory -> void
extern fn void load_ini_settings_from_memory(ZString ini_data, usz ini_size = 0) @extern("igLoadIniSettingsFromMemory");

//igGetTime() get_time -> double
extern fn double get_time() @extern("igGetTime");

//igSetTabItemClosed(const char* tab_or_docked_window_label) set_tab_item_closed -> void
extern fn void set_tab_item_closed(ZString tab_or_docked_window_label) @extern("igSetTabItemClosed");

//igEndTabBar() end_tab_bar -> void
extern fn void end_tab_bar() @extern("igEndTabBar");

//igIsWindowDocked() is_window_docked -> bool
extern fn bool is_window_docked() @extern("igIsWindowDocked");

//igEndFrame() end_frame -> void
extern fn void end_frame() @extern("igEndFrame");

//igShortcut(ImGuiKeyChord key_chord,ImGuiInputFlags flags=0) shortcut -> bool
extern fn bool shortcut(KeyChord key_chord, InputFlags flags = 0) @extern("igShortcut");

//igGetItemRectMax()(ImVec2 *pOut) get_item_rect_max -> void, 1
extern fn void igGetItemRectMax(Vec2* pOut) @extern("igGetItemRectMax");
fn Vec2 get_item_rect_max() @inline {
  Vec2 pOut;
  igGetItemRectMax(&pOut);
  return pOut;
}

//igGetTextLineHeight() get_text_line_height -> float
extern fn float get_text_line_height() @extern("igGetTextLineHeight");

//igGetWindowDockID() get_window_dock_id -> ImID
extern fn ImID get_window_dock_id() @extern("igGetWindowDockID");

//igIsMouseDoubleClicked(ImGuiMouseButton button) is_mouse_double_clicked -> bool
extern fn bool is_mouse_double_clicked(MouseButton button) @extern("igIsMouseDoubleClicked");

//igPopItemWidth() pop_item_width -> void
extern fn void pop_item_width() @extern("igPopItemWidth");

//igEndTabItem() end_tab_item -> void
extern fn void end_tab_item() @extern("igEndTabItem");

//igBeginDragDropSource(ImGuiDragDropFlags flags=0) begin_drag_drop_source -> bool
extern fn bool begin_drag_drop_source(DragDropFlags flags = 0) @extern("igBeginDragDropSource");

//igShowMetricsWindow(bool* p_open=((void*)0)) show_metrics_window -> void
extern fn void show_metrics_window(bool* p_open = null) @extern("igShowMetricsWindow");

//igSetAllocatorFunctions(ImGuiMemAllocFunc alloc_func,ImGuiMemFreeFunc free_func,void* user_data=((void*)0)) set_allocator_functions -> void
extern fn void set_allocator_functions(MemAllocFunc alloc_func, MemFreeFunc free_func, void* user_data = null) @extern("igSetAllocatorFunctions");

//igInputFloat3(const char* label,float v[3],const char* format=%.3f,ImGuiInputTextFlags flags=0) input_float3 -> bool
extern fn bool input_float3(ZString label, float[3] v, ZString format = "%.3f", InputTextFlags flags = 0) @extern("igInputFloat3");

//igInputFloat2(const char* label,float v[2],const char* format=%.3f,ImGuiInputTextFlags flags=0) input_float2 -> bool
extern fn bool input_float2(ZString label, float[2] v, ZString format = "%.3f", InputTextFlags flags = 0) @extern("igInputFloat2");

//igInputFloat4(const char* label,float v[4],const char* format=%.3f,ImGuiInputTextFlags flags=0) input_float4 -> bool
extern fn bool input_float4(ZString label, float[4] v, ZString format = "%.3f", InputTextFlags flags = 0) @extern("igInputFloat4");

//igGetKeyName(ImGuiKey key) get_key_name -> ZString
extern fn ZString get_key_name(Key key) @extern("igGetKeyName");

//igBeginMultiSelect(ImGuiMultiSelectFlags flags,int selection_size=-1,int items_count=-1) begin_multi_select -> MultiSelectIO*
extern fn MultiSelectIO* begin_multi_select(MultiSelectFlags flags, int selection_size = -1, int items_count = -1) @extern("igBeginMultiSelect");

//igTabItemButton(const char* label,ImGuiTabItemFlags flags=0) tab_item_button -> bool
extern fn bool tab_item_button(ZString label, TabItemFlags flags = 0) @extern("igTabItemButton");

//igIsAnyItemFocused() is_any_item_focused -> bool
extern fn bool is_any_item_focused() @extern("igIsAnyItemFocused");

//igSliderInt3(const char* label,int v[3],int v_min,int v_max,const char* format=%d,ImGuiSliderFlags flags=0) slider_int3 -> bool
extern fn bool slider_int3(ZString label, int[3] v, int v_min, int v_max, ZString format = "%d", SliderFlags flags = 0) @extern("igSliderInt3");

//igSliderInt2(const char* label,int v[2],int v_min,int v_max,const char* format=%d,ImGuiSliderFlags flags=0) slider_int2 -> bool
extern fn bool slider_int2(ZString label, int[2] v, int v_min, int v_max, ZString format = "%d", SliderFlags flags = 0) @extern("igSliderInt2");

//igEndListBox() end_list_box -> void
extern fn void end_list_box() @extern("igEndListBox");

//igGetFont() get_font -> Font*
extern fn Font* get_font() @extern("igGetFont");

//igBeginTable(const char* str_id,int columns,ImGuiTableFlags flags=0,const ImVec2& outer_size=ImVec2(0.0f,0.0f),float inner_width=0.0f) begin_table -> bool
extern fn bool begin_table(ZString str_id, int columns, TableFlags flags = 0, Vec2 outer_size = {0.0f, 0.0f}, float inner_width = 0.0f) @extern("igBeginTable");

//igSliderInt4(const char* label,int v[4],int v_min,int v_max,const char* format=%d,ImGuiSliderFlags flags=0) slider_int4 -> bool
extern fn bool slider_int4(ZString label, int[4] v, int v_min, int v_max, ZString format = "%d", SliderFlags flags = 0) @extern("igSliderInt4");

//igGetTextLineHeightWithSpacing() get_text_line_height_with_spacing -> float
extern fn float get_text_line_height_with_spacing() @extern("igGetTextLineHeightWithSpacing");

//igEnd() end -> void
extern fn void end() @extern("igEnd");

//igIsRectVisible_Nil(const ImVec2& size) is_rect_visible_nil -> bool
extern fn bool is_rect_visible_nil(Vec2 size) @extern("igIsRectVisible_Nil");

//igIsRectVisible_Vec2(const ImVec2& rect_min,const ImVec2& rect_max) is_rect_visible_vec2 -> bool
extern fn bool is_rect_visible_vec2(Vec2 rect_min, Vec2 rect_max) @extern("igIsRectVisible_Vec2");

//igIsItemToggledSelection() is_item_toggled_selection -> bool
extern fn bool is_item_toggled_selection() @extern("igIsItemToggledSelection");

//igInputTextMultiline(const char* label,char* buf,size_t buf_size,const ImVec2& size=ImVec2(0,0),ImGuiInputTextFlags flags=0,ImGuiInputTextCallback callback=((void*)0),void* user_data=((void*)0)) input_text_multiline -> bool
extern fn bool input_text_multiline(ZString label, char* buf, usz buf_size, Vec2 size = {0, 0}, InputTextFlags flags = 0, InputTextCallback callback = null, void* user_data = null) @extern("igInputTextMultiline");

//igEndMenu() end_menu -> void
extern fn void end_menu() @extern("igEndMenu");

//igEndMultiSelect() end_multi_select -> MultiSelectIO*
extern fn MultiSelectIO* end_multi_select() @extern("igEndMultiSelect");

//igTreeNodeEx_Str(const char* label,ImGuiTreeNodeFlags flags=0) tree_node_ex_str -> bool
extern fn bool tree_node_ex_str(ZString label, TreeNodeFlags flags = 0) @extern("igTreeNodeEx_Str");

//igTreeNodeEx_StrStr(const char* str_id,ImGuiTreeNodeFlags flags,const char* fmt,...) tree_node_ex_str_str -> bool
extern fn bool tree_node_ex_str_str(ZString str_id, TreeNodeFlags flags, ZString fmt, ...) @extern("igTreeNodeEx_StrStr");

//igTreeNodeEx_Ptr(const void* ptr_id,ImGuiTreeNodeFlags flags,const char* fmt,...) tree_node_ex_ptr -> bool
extern fn bool tree_node_ex_ptr(void* ptr_id, TreeNodeFlags flags, ZString fmt, ...) @extern("igTreeNodeEx_Ptr");

//igTableSetupColumn(const char* label,ImGuiTableColumnFlags flags=0,float init_width_or_weight=0.0f,ImGuiID user_id=0) table_setup_column -> void
extern fn void table_setup_column(ZString label, TableColumnFlags flags = 0, float init_width_or_weight = 0.0f, ImID user_id = 0) @extern("igTableSetupColumn");

//igSetColorEditOptions(ImGuiColorEditFlags flags) set_color_edit_options -> void
extern fn void set_color_edit_options(ColorEditFlags flags) @extern("igSetColorEditOptions");

//igShowStyleSelector(const char* label) show_style_selector -> bool
extern fn bool show_style_selector(ZString label) @extern("igShowStyleSelector");

//igSpacing() spacing -> void
extern fn void spacing() @extern("igSpacing");

//igPushItemFlag(ImGuiItemFlags option,bool enabled) push_item_flag -> void
extern fn void push_item_flag(ItemFlags option, bool enabled) @extern("igPushItemFlag");

//igBegin(const char* name,bool* p_open=((void*)0),ImGuiWindowFlags flags=0) begin -> bool
extern fn bool begin(ZString name, bool* p_open = null, WindowFlags flags = 0) @extern("igBegin");

//igColorConvertHSVtoRGB(float h,float s,float v,float& out_r,float& out_g,float& out_b) color_convert_hs_vto_rgb -> void
extern fn void color_convert_hs_vto_rgb(float h, float s, float v, float* out_r, float* out_g, float* out_b) @extern("igColorConvertHSVtoRGB");

//igIsItemToggledOpen() is_item_toggled_open -> bool
extern fn bool is_item_toggled_open() @extern("igIsItemToggledOpen");

//igBeginDragDropTarget() begin_drag_drop_target -> bool
extern fn bool begin_drag_drop_target() @extern("igBeginDragDropTarget");

//igDragFloat(const char* label,float* v,float v_speed=1.0f,float v_min=0.0f,float v_max=0.0f,const char* format=%.3f,ImGuiSliderFlags flags=0) drag_float -> bool
extern fn bool drag_float(ZString label, float* v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", SliderFlags flags = 0) @extern("igDragFloat");

//igShowAboutWindow(bool* p_open=((void*)0)) show_about_window -> void
extern fn void show_about_window(bool* p_open = null) @extern("igShowAboutWindow");

//igRenderPlatformWindowsDefault(void* platform_render_arg=((void*)0),void* renderer_render_arg=((void*)0)) render_platform_windows_default -> void
extern fn void render_platform_windows_default(void* platform_render_arg = null, void* renderer_render_arg = null) @extern("igRenderPlatformWindowsDefault");

//igPushID_Str(const char* str_id) push_i_d__str -> void
extern fn void push_i_d__str(ZString str_id) @extern("igPushID_Str");

//igPushID_StrStr(const char* str_id_begin,const char* str_id_end) push_i_d__str_str -> void
extern fn void push_i_d__str_str(ZString str_id_begin, ZString str_id_end) @extern("igPushID_StrStr");

//igPushID_Ptr(const void* ptr_id) push_i_d__ptr -> void
extern fn void push_i_d__ptr(void* ptr_id) @extern("igPushID_Ptr");

//igPushID_Int(int int_id) push_i_d__int -> void
extern fn void push_i_d__int(int int_id) @extern("igPushID_Int");

//igGetFontTexUvWhitePixel()(ImVec2 *pOut) get_font_tex_uv_white_pixel -> void, 1
extern fn void igGetFontTexUvWhitePixel(Vec2* pOut) @extern("igGetFontTexUvWhitePixel");
fn Vec2 get_font_tex_uv_white_pixel() @inline {
  Vec2 pOut;
  igGetFontTexUvWhitePixel(&pOut);
  return pOut;
}

//igStyleColorsLight(ImGuiStyle* dst=((void*)0)) style_colors_light -> void
extern fn void style_colors_light(Style* dst = null) @extern("igStyleColorsLight");

//igIsAnyItemHovered() is_any_item_hovered -> bool
extern fn bool is_any_item_hovered() @extern("igIsAnyItemHovered");

//igTableGetColumnIndex() table_get_column_index -> int
extern fn int table_get_column_index() @extern("igTableGetColumnIndex");

//igTableGetSortSpecs() table_get_sort_specs -> TableSortSpecs*
extern fn TableSortSpecs* table_get_sort_specs() @extern("igTableGetSortSpecs");

//igGetItemRectMin()(ImVec2 *pOut) get_item_rect_min -> void, 1
extern fn void igGetItemRectMin(Vec2* pOut) @extern("igGetItemRectMin");
fn Vec2 get_item_rect_min() @inline {
  Vec2 pOut;
  igGetItemRectMin(&pOut);
  return pOut;
}

//igShowFontSelector(const char* label) show_font_selector -> void
extern fn void show_font_selector(ZString label) @extern("igShowFontSelector");

//igFindViewportByID(ImGuiID id) find_viewport_by_id -> Viewport*
extern fn Viewport* find_viewport_by_id(ImID id) @extern("igFindViewportByID");

//igIsMouseDown(ImGuiMouseButton button) is_mouse_down -> bool
extern fn bool is_mouse_down(MouseButton button) @extern("igIsMouseDown");

//igIsItemFocused() is_item_focused -> bool
extern fn bool is_item_focused() @extern("igIsItemFocused");

//igGetMouseClickedCount(ImGuiMouseButton button) get_mouse_clicked_count -> int
extern fn int get_mouse_clicked_count(MouseButton button) @extern("igGetMouseClickedCount");

//igBeginMenuBar() begin_menu_bar -> bool
extern fn bool begin_menu_bar() @extern("igBeginMenuBar");

//igTableSetBgColor(ImGuiTableBgTarget target,ImU32 color,int column_n=-1) table_set_bg_color -> void
extern fn void table_set_bg_color(TableBgTarget target, ImU32 color, int column_n = -1) @extern("igTableSetBgColor");

//igEndTable() end_table -> void
extern fn void end_table() @extern("igEndTable");

//igSetNextFrameWantCaptureMouse(bool want_capture_mouse) set_next_frame_want_capture_mouse -> void
extern fn void set_next_frame_want_capture_mouse(bool want_capture_mouse) @extern("igSetNextFrameWantCaptureMouse");

//igSetNextFrameWantCaptureKeyboard(bool want_capture_keyboard) set_next_frame_want_capture_keyboard -> void
extern fn void set_next_frame_want_capture_keyboard(bool want_capture_keyboard) @extern("igSetNextFrameWantCaptureKeyboard");

//igSetWindowPos_Vec2(const ImVec2& pos,ImGuiCond cond=0) set_window_pos_vec2 -> void
extern fn void set_window_pos_vec2(Vec2 pos, Cond cond = 0) @extern("igSetWindowPos_Vec2");

//igSetWindowPos_Str(const char* name,const ImVec2& pos,ImGuiCond cond=0) set_window_pos_str -> void
extern fn void set_window_pos_str(ZString name, Vec2 pos, Cond cond = 0) @extern("igSetWindowPos_Str");

//igShowIDStackToolWindow(bool* p_open=((void*)0)) show_id_stack_tool_window -> void
extern fn void show_id_stack_tool_window(bool* p_open = null) @extern("igShowIDStackToolWindow");

//igTableSetupScrollFreeze(int cols,int rows) table_setup_scroll_freeze -> void
extern fn void table_setup_scroll_freeze(int cols, int rows) @extern("igTableSetupScrollFreeze");

//igPlotLines_FloatPtr(const char* label,const float* values,int values_count,int values_offset=0,const char* overlay_text=((void*)0),float scale_min=3.40282346638528859811704183484516925e+38F,float scale_max=3.40282346638528859811704183484516925e+38F,ImVec2 graph_size=ImVec2(0,0),int stride=sizeof(float)) plot_lines_float_ptr -> void
extern fn void plot_lines_float_ptr(ZString label, float* values, int values_count, int values_offset = 0, ZString overlay_text = null, float scale_min = float.max, float scale_max = float.max, Vec2 graph_size = {0, 0}, int stride = float.sizeof) @extern("igPlotLines_FloatPtr");

//igPlotLines_FnFloatPtr(const char* label,float(*values_getter)(void* data,int idx),void* data,int values_count,int values_offset=0,const char* overlay_text=((void*)0),float scale_min=3.40282346638528859811704183484516925e+38F,float scale_max=3.40282346638528859811704183484516925e+38F,ImVec2 graph_size=ImVec2(0,0)) plot_lines_fn_float_ptr -> void
extern fn void plot_lines_fn_float_ptr(ZString label, PlotLinesFnFloatPtrCallback values_getter, void* data, int values_count, int values_offset = 0, ZString overlay_text = null, float scale_min = float.max, float scale_max = float.max, Vec2 graph_size = {0, 0}) @extern("igPlotLines_FnFloatPtr");
def PlotLinesFnFloatPtrCallback = fn float(void* data, int idx);

//igSetNextWindowSizeConstraints(const ImVec2& size_min,const ImVec2& size_max,ImGuiSizeCallback custom_callback=((void*)0),void* custom_callback_data=((void*)0)) set_next_window_size_constraints -> void
extern fn void set_next_window_size_constraints(Vec2 size_min, Vec2 size_max, SizeCallback custom_callback = null, void* custom_callback_data = null) @extern("igSetNextWindowSizeConstraints");

//igBulletText(const char* fmt,...) bullet_text -> void
extern fn void bullet_text(ZString fmt, ...) @extern("igBulletText");

//igIsKeyChordPressed(ImGuiKeyChord key_chord) is_key_chord_pressed -> bool
extern fn bool is_key_chord_pressed(KeyChord key_chord) @extern("igIsKeyChordPressed");

//igSaveIniSettingsToMemory(size_t* out_ini_size=((void*)0)) save_ini_settings_to_memory -> ZString
extern fn ZString save_ini_settings_to_memory(usz* out_ini_size = null) @extern("igSaveIniSettingsToMemory");

//igIsKeyReleased(ImGuiKey key) is_key_released -> bool
extern fn bool is_key_released(Key key) @extern("igIsKeyReleased");

//igPushItemWidth(float item_width) push_item_width -> void
extern fn void push_item_width(float item_width) @extern("igPushItemWidth");

//igFindViewportByPlatformHandle(void* platform_handle) find_viewport_by_platform_handle -> Viewport*
extern fn Viewport* find_viewport_by_platform_handle(void* platform_handle) @extern("igFindViewportByPlatformHandle");

//igShowDemoWindow(bool* p_open=((void*)0)) show_demo_window -> void
extern fn void show_demo_window(bool* p_open = null) @extern("igShowDemoWindow");

//igGetStyleColorVec4(ImGuiCol idx) get_style_color_vec4 -> Vec4*
extern fn Vec4* get_style_color_vec4(Col idx) @extern("igGetStyleColorVec4");

//igListBox_Str_arr(const char* label,int* current_item,const char* const items[],int items_count,int height_in_items=-1) list_box_str_arr -> bool
extern fn bool list_box_str_arr(ZString label, int* current_item, ZString[] items, int items_count, int height_in_items = -1) @extern("igListBox_Str_arr");

//igListBox_FnStrPtr(const char* label,int* current_item,const char*(*getter)(void* user_data,int idx),void* user_data,int items_count,int height_in_items=-1) list_box_fn_str_ptr -> bool
extern fn bool list_box_fn_str_ptr(ZString label, int* current_item, ListBoxFnStrPtrCallback getter, void* user_data, int items_count, int height_in_items = -1) @extern("igListBox_FnStrPtr");
def ListBoxFnStrPtrCallback = fn ZString(void* user_data, int idx);

//igInvisibleButton(const char* str_id,const ImVec2& size,ImGuiButtonFlags flags=0) invisible_button -> bool
extern fn bool invisible_button(ZString str_id, Vec2 size, ButtonFlags flags = 0) @extern("igInvisibleButton");

//igArrowButton(const char* str_id,ImGuiDir dir) arrow_button -> bool
extern fn bool arrow_button(ZString str_id, Dir dir) @extern("igArrowButton");

//igGetWindowDrawList() get_window_draw_list -> DrawList*
extern fn DrawList* get_window_draw_list() @extern("igGetWindowDrawList");

//igSetNextItemStorageID(ImGuiID storage_id) set_next_item_storage_id -> void
extern fn void set_next_item_storage_id(ImID storage_id) @extern("igSetNextItemStorageID");

//igIsMousePosValid(const ImVec2* mouse_pos=((void*)0)) is_mouse_pos_valid -> bool
extern fn bool is_mouse_pos_valid(Vec2* mouse_pos = null) @extern("igIsMousePosValid");

//igDockSpace(ImGuiID dockspace_id,const ImVec2& size=ImVec2(0,0),ImGuiDockNodeFlags flags=0,const ImGuiWindowClass* window_class=((void*)0)) dock_space -> ImID
extern fn ImID dock_space(ImID dockspace_id, Vec2 size = {0, 0}, DockNodeFlags flags = 0, WindowClass* window_class = null) @extern("igDockSpace");

//igTextLinkOpenURL(const char* label,const char* url=((void*)0)) text_link_open_url -> void
extern fn void text_link_open_url(ZString label, ZString url = null) @extern("igTextLinkOpenURL");

//igSetColumnOffset(int column_index,float offset_x) set_column_offset -> void
extern fn void set_column_offset(int column_index, float offset_x) @extern("igSetColumnOffset");

//igDummy(const ImVec2& size) dummy -> void
extern fn void dummy(Vec2 size) @extern("igDummy");

//igIsItemDeactivated() is_item_deactivated -> bool
extern fn bool is_item_deactivated() @extern("igIsItemDeactivated");

//igInputText(const char* label,char* buf,size_t buf_size,ImGuiInputTextFlags flags=0,ImGuiInputTextCallback callback=((void*)0),void* user_data=((void*)0)) input_text -> bool
extern fn bool input_text(ZString label, char* buf, usz buf_size, InputTextFlags flags = 0, InputTextCallback callback = null, void* user_data = null) @extern("igInputText");

//igGetWindowDpiScale() get_window_dpi_scale -> float
extern fn float get_window_dpi_scale() @extern("igGetWindowDpiScale");

//igBeginDisabled(bool disabled=true) begin_disabled -> void
extern fn void begin_disabled(bool disabled = true) @extern("igBeginDisabled");

//igSeparator() separator -> void
extern fn void separator() @extern("igSeparator");

//igAcceptDragDropPayload(const char* type,ImGuiDragDropFlags flags=0) accept_drag_drop_payload -> Payload*
extern fn Payload* accept_drag_drop_payload(ZString type, DragDropFlags flags = 0) @extern("igAcceptDragDropPayload");

//igSetNextWindowViewport(ImGuiID viewport_id) set_next_window_viewport -> void
extern fn void set_next_window_viewport(ImID viewport_id) @extern("igSetNextWindowViewport");

//igGetColorU32_Col(ImGuiCol idx,float alpha_mul=1.0f) get_color_u32_col -> ImU32
extern fn ImU32 get_color_u32_col(Col idx, float alpha_mul = 1.0f) @extern("igGetColorU32_Col");

//igGetColorU32_Vec4(const ImVec4& col) get_color_u32_vec4 -> ImU32
extern fn ImU32 get_color_u32_vec4(Vec4 col) @extern("igGetColorU32_Vec4");

//igGetColorU32_U32(ImU32 col,float alpha_mul=1.0f) get_color_u32_u32 -> ImU32
extern fn ImU32 get_color_u32_u32(ImU32 col, float alpha_mul = 1.0f) @extern("igGetColorU32_U32");

//igCheckboxFlags_IntPtr(const char* label,int* flags,int flags_value) checkbox_flags_int_ptr -> bool
extern fn bool checkbox_flags_int_ptr(ZString label, int* flags, int flags_value) @extern("igCheckboxFlags_IntPtr");

//igCheckboxFlags_UintPtr(const char* label,unsigned int* flags,unsigned int flags_value) checkbox_flags_uint_ptr -> bool
extern fn bool checkbox_flags_uint_ptr(ZString label, uint* flags, uint flags_value) @extern("igCheckboxFlags_UintPtr");

//igPopFont() pop_font -> void
extern fn void pop_font() @extern("igPopFont");

//igSliderFloat4(const char* label,float v[4],float v_min,float v_max,const char* format=%.3f,ImGuiSliderFlags flags=0) slider_float4 -> bool
extern fn bool slider_float4(ZString label, float[4] v, float v_min, float v_max, ZString format = "%.3f", SliderFlags flags = 0) @extern("igSliderFloat4");

//igGetTreeNodeToLabelSpacing() get_tree_node_to_label_spacing -> float
extern fn float get_tree_node_to_label_spacing() @extern("igGetTreeNodeToLabelSpacing");

//igTreeNode_Str(const char* label) tree_node_str -> bool
extern fn bool tree_node_str(ZString label) @extern("igTreeNode_Str");

//igTreeNode_StrStr(const char* str_id,const char* fmt,...) tree_node_str_str -> bool
extern fn bool tree_node_str_str(ZString str_id, ZString fmt, ...) @extern("igTreeNode_StrStr");

//igTreeNode_Ptr(const void* ptr_id,const char* fmt,...) tree_node_ptr -> bool
extern fn bool tree_node_ptr(void* ptr_id, ZString fmt, ...) @extern("igTreeNode_Ptr");

//igTableSetColumnIndex(int column_n) table_set_column_index -> bool
extern fn bool table_set_column_index(int column_n) @extern("igTableSetColumnIndex");

//igSetScrollY(float scroll_y) set_scroll_y -> void
extern fn void set_scroll_y(float scroll_y) @extern("igSetScrollY");

//igGetIO() get_io -> ImIO*
extern fn ImIO* get_io() @extern("igGetIO");

//igSetScrollX(float scroll_x) set_scroll_x -> void
extern fn void set_scroll_x(float scroll_x) @extern("igSetScrollX");

//igTableGetHoveredColumn() table_get_hovered_column -> int
extern fn int table_get_hovered_column() @extern("igTableGetHoveredColumn");

//igSliderFloat3(const char* label,float v[3],float v_min,float v_max,const char* format=%.3f,ImGuiSliderFlags flags=0) slider_float3 -> bool
extern fn bool slider_float3(ZString label, float[3] v, float v_min, float v_max, ZString format = "%.3f", SliderFlags flags = 0) @extern("igSliderFloat3");

//igSetItemKeyOwner(ImGuiKey key) set_item_key_owner -> void
extern fn void set_item_key_owner(Key key) @extern("igSetItemKeyOwner");

//igSliderFloat2(const char* label,float v[2],float v_min,float v_max,const char* format=%.3f,ImGuiSliderFlags flags=0) slider_float2 -> bool
extern fn bool slider_float2(ZString label, float[2] v, float v_min, float v_max, ZString format = "%.3f", SliderFlags flags = 0) @extern("igSliderFloat2");

//igIsWindowFocused(ImGuiFocusedFlags flags=0) is_window_focused -> bool
extern fn bool is_window_focused(FocusedFlags flags = 0) @extern("igIsWindowFocused");

//igSetNextItemAllowOverlap() set_next_item_allow_overlap -> void
extern fn void set_next_item_allow_overlap() @extern("igSetNextItemAllowOverlap");

//igImageButton(const char* str_id,ImTextureID user_texture_id,const ImVec2& image_size,const ImVec2& uv0=ImVec2(0,0),const ImVec2& uv1=ImVec2(1,1),const ImVec4& bg_col=ImVec4(0,0,0,0),const ImVec4& tint_col=ImVec4(1,1,1,1)) image_button -> bool
extern fn bool image_button(ZString str_id, TextureID user_texture_id, Vec2 image_size, Vec2 uv0 = {0, 0}, Vec2 uv1 = {1, 1}, Vec4 bg_col = {0, 0, 0, 0}, Vec4 tint_col = {1, 1, 1, 1}) @extern("igImageButton");

//igGetID_Str(const char* str_id) get_i_d__str -> ImID
extern fn ImID get_i_d__str(ZString str_id) @extern("igGetID_Str");

//igGetID_StrStr(const char* str_id_begin,const char* str_id_end) get_i_d__str_str -> ImID
extern fn ImID get_i_d__str_str(ZString str_id_begin, ZString str_id_end) @extern("igGetID_StrStr");

//igGetID_Ptr(const void* ptr_id) get_i_d__ptr -> ImID
extern fn ImID get_i_d__ptr(void* ptr_id) @extern("igGetID_Ptr");

//igGetID_Int(int int_id) get_i_d__int -> ImID
extern fn ImID get_i_d__int(int int_id) @extern("igGetID_Int");

//igGetScrollY() get_scroll_y -> float
extern fn float get_scroll_y() @extern("igGetScrollY");

//igGetScrollX() get_scroll_x -> float
extern fn float get_scroll_x() @extern("igGetScrollX");

//igColorPicker4(const char* label,float col[4],ImGuiColorEditFlags flags=0,const float* ref_col=((void*)0)) color_picker4 -> bool
extern fn bool color_picker4(ZString label, float[4] col, ColorEditFlags flags = 0, float* ref_col = null) @extern("igColorPicker4");

//igIsItemDeactivatedAfterEdit() is_item_deactivated_after_edit -> bool
extern fn bool is_item_deactivated_after_edit() @extern("igIsItemDeactivatedAfterEdit");

//igColorPicker3(const char* label,float col[3],ImGuiColorEditFlags flags=0) color_picker3 -> bool
extern fn bool color_picker3(ZString label, float[3] col, ColorEditFlags flags = 0) @extern("igColorPicker3");

//igDragFloatRange2(const char* label,float* v_current_min,float* v_current_max,float v_speed=1.0f,float v_min=0.0f,float v_max=0.0f,const char* format=%.3f,const char* format_max=((void*)0),ImGuiSliderFlags flags=0) drag_float_range2 -> bool
extern fn bool drag_float_range2(ZString label, float* v_current_min, float* v_current_max, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", ZString format_max = null, SliderFlags flags = 0) @extern("igDragFloatRange2");

//igDragFloat3(const char* label,float v[3],float v_speed=1.0f,float v_min=0.0f,float v_max=0.0f,const char* format=%.3f,ImGuiSliderFlags flags=0) drag_float3 -> bool
extern fn bool drag_float3(ZString label, float[3] v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", SliderFlags flags = 0) @extern("igDragFloat3");

//igDragFloat2(const char* label,float v[2],float v_speed=1.0f,float v_min=0.0f,float v_max=0.0f,const char* format=%.3f,ImGuiSliderFlags flags=0) drag_float2 -> bool
extern fn bool drag_float2(ZString label, float[2] v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", SliderFlags flags = 0) @extern("igDragFloat2");

//igDragFloat4(const char* label,float v[4],float v_speed=1.0f,float v_min=0.0f,float v_max=0.0f,const char* format=%.3f,ImGuiSliderFlags flags=0) drag_float4 -> bool
extern fn bool drag_float4(ZString label, float[4] v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", SliderFlags flags = 0) @extern("igDragFloat4");

//igGetVersion() get_version -> ZString
extern fn ZString get_version() @extern("igGetVersion");

//igInputInt4(const char* label,int v[4],ImGuiInputTextFlags flags=0) input_int4 -> bool
extern fn bool input_int4(ZString label, int[4] v, InputTextFlags flags = 0) @extern("igInputInt4");

//igInputInt3(const char* label,int v[3],ImGuiInputTextFlags flags=0) input_int3 -> bool
extern fn bool input_int3(ZString label, int[3] v, InputTextFlags flags = 0) @extern("igInputInt3");

//igInputInt2(const char* label,int v[2],ImGuiInputTextFlags flags=0) input_int2 -> bool
extern fn bool input_int2(ZString label, int[2] v, InputTextFlags flags = 0) @extern("igInputInt2");

//igBeginCombo(const char* label,const char* preview_value,ImGuiComboFlags flags=0) begin_combo -> bool
extern fn bool begin_combo(ZString label, ZString preview_value, ComboFlags flags = 0) @extern("igBeginCombo");

//igBeginPopup(const char* str_id,ImGuiWindowFlags flags=0) begin_popup -> bool
extern fn bool begin_popup(ZString str_id, WindowFlags flags = 0) @extern("igBeginPopup");

//igOpenPopupOnItemClick(const char* str_id=((void*)0),ImGuiPopupFlags popup_flags=1) open_popup_on_item_click -> void
extern fn void open_popup_on_item_click(ZString str_id = null, PopupFlags popup_flags = 1) @extern("igOpenPopupOnItemClick");

//igIsMouseClicked(ImGuiMouseButton button,bool repeat=false) is_mouse_clicked -> bool
extern fn bool is_mouse_clicked(MouseButton button, bool repeat = false) @extern("igIsMouseClicked");

//igSetCursorPosX(float local_x) set_cursor_pos_x -> void
extern fn void set_cursor_pos_x(float local_x) @extern("igSetCursorPosX");

//igSetCursorPosY(float local_y) set_cursor_pos_y -> void
extern fn void set_cursor_pos_y(float local_y) @extern("igSetCursorPosY");

//igLogText(const char* fmt,...) log_text -> void
extern fn void log_text(ZString fmt, ...) @extern("igLogText");

//igPushStyleVar_Float(ImGuiStyleVar idx,float val) push_style_var_float -> void
extern fn void push_style_var_float(StyleVar idx, float val) @extern("igPushStyleVar_Float");

//igPushStyleVar_Vec2(ImGuiStyleVar idx,const ImVec2& val) push_style_var_vec2 -> void
extern fn void push_style_var_vec2(StyleVar idx, Vec2 val) @extern("igPushStyleVar_Vec2");

//igGetDrawData() get_draw_data -> DrawData*
extern fn DrawData* get_draw_data() @extern("igGetDrawData");

//igIsKeyDown(ImGuiKey key) is_key_down -> bool
extern fn bool is_key_down(Key key) @extern("igIsKeyDown");

//igBeginGroup() begin_group -> void
extern fn void begin_group() @extern("igBeginGroup");

//igTableHeader(const char* label) table_header -> void
extern fn void table_header(ZString label) @extern("igTableHeader");

//igLogButtons() log_buttons -> void
extern fn void log_buttons() @extern("igLogButtons");

//igGetWindowViewport() get_window_viewport -> Viewport*
extern fn Viewport* get_window_viewport() @extern("igGetWindowViewport");

//igLogToFile(int auto_open_depth=-1,const char* filename=((void*)0)) log_to_file -> void
extern fn void log_to_file(int auto_open_depth = -1, ZString filename = null) @extern("igLogToFile");

//igSetNextWindowSize(const ImVec2& size,ImGuiCond cond=0) set_next_window_size -> void
extern fn void set_next_window_size(Vec2 size, Cond cond = 0) @extern("igSetNextWindowSize");

//igSetNextWindowPos(const ImVec2& pos,ImGuiCond cond=0,const ImVec2& pivot=ImVec2(0,0)) set_next_window_pos -> void
extern fn void set_next_window_pos(Vec2 pos, Cond cond = 0, Vec2 pivot = {0, 0}) @extern("igSetNextWindowPos");

//igTreePush_Str(const char* str_id) tree_push_str -> void
extern fn void tree_push_str(ZString str_id) @extern("igTreePush_Str");

//igTreePush_Ptr(const void* ptr_id) tree_push_ptr -> void
extern fn void tree_push_ptr(void* ptr_id) @extern("igTreePush_Ptr");

//igSliderFloat(const char* label,float* v,float v_min,float v_max,const char* format=%.3f,ImGuiSliderFlags flags=0) slider_float -> bool
extern fn bool slider_float(ZString label, float* v, float v_min, float v_max, ZString format = "%.3f", SliderFlags flags = 0) @extern("igSliderFloat");

//igGetColumnsCount() get_columns_count -> int
extern fn int get_columns_count() @extern("igGetColumnsCount");

//igTextUnformatted(const char* text,const char* text_end=((void*)0)) text_unformatted -> void
extern fn void text_unformatted(ZString text, ZString text_end = null) @extern("igTextUnformatted");

//igSetMouseCursor(ImGuiMouseCursor cursor_type) set_mouse_cursor -> void
extern fn void set_mouse_cursor(MouseCursor cursor_type) @extern("igSetMouseCursor");

//igCheckbox(const char* label,bool* v) checkbox -> bool
extern fn bool checkbox(ZString label, bool* v) @extern("igCheckbox");

//igValue_Bool(const char* prefix,bool b) value_bool -> void
extern fn void value_bool(ZString prefix, bool b) @extern("igValue_Bool");

//igValue_Int(const char* prefix,int v) value_int -> void
extern fn void value_int(ZString prefix, int v) @extern("igValue_Int");

//igValue_Uint(const char* prefix,unsigned int v) value_uint -> void
extern fn void value_uint(ZString prefix, uint v) @extern("igValue_Uint");

//igValue_Float(const char* prefix,float v,const char* float_format=((void*)0)) value_float -> void
extern fn void value_float(ZString prefix, float v, ZString float_format = null) @extern("igValue_Float");

//igIsWindowAppearing() is_window_appearing -> bool
extern fn bool is_window_appearing() @extern("igIsWindowAppearing");

//igIsMouseDragging(ImGuiMouseButton button,float lock_threshold=-1.0f) is_mouse_dragging -> bool
extern fn bool is_mouse_dragging(MouseButton button, float lock_threshold = -1.0f) @extern("igIsMouseDragging");

//igDragScalar(const char* label,ImGuiDataType data_type,void* p_data,float v_speed=1.0f,const void* p_min=((void*)0),const void* p_max=((void*)0),const char* format=((void*)0),ImGuiSliderFlags flags=0) drag_scalar -> bool
extern fn bool drag_scalar(ZString label, DataType data_type, void* p_data, float v_speed = 1.0f, void* p_min = null, void* p_max = null, ZString format = null, SliderFlags flags = 0) @extern("igDragScalar");

//igSetWindowFocus_Nil() set_window_focus_nil -> void
extern fn void set_window_focus_nil() @extern("igSetWindowFocus_Nil");

//igSetWindowFocus_Str(const char* name) set_window_focus_str -> void
extern fn void set_window_focus_str(ZString name) @extern("igSetWindowFocus_Str");

//igStyleColorsClassic(ImGuiStyle* dst=((void*)0)) style_colors_classic -> void
extern fn void style_colors_classic(Style* dst = null) @extern("igStyleColorsClassic");

//igGetForegroundDrawList(ImGuiViewport* viewport=((void*)0)) get_foreground_draw_list -> DrawList*
extern fn DrawList* get_foreground_draw_list(Viewport* viewport = null) @extern("igGetForegroundDrawList");

//igDebugTextEncoding(const char* text) debug_text_encoding -> void
extern fn void debug_text_encoding(ZString text) @extern("igDebugTextEncoding");

//igColorConvertU32ToFloat4(ImU32 in)(ImVec4 *pOut,ImU32 in) color_convert_u32_to_float4 -> void, 1
extern fn void igColorConvertU32ToFloat4(Vec4* pOut, ImU32 in) @extern("igColorConvertU32ToFloat4");
fn Vec4 color_convert_u32_to_float4(ImU32 in) @inline {
  Vec4 pOut;
  igColorConvertU32ToFloat4(&pOut, in);
  return pOut;
}

//igSetStateStorage(ImGuiStorage* storage) set_state_storage -> void
extern fn void set_state_storage(Storage* storage) @extern("igSetStateStorage");

//igTextColored(const ImVec4& col,const char* fmt,...) text_colored -> void
extern fn void text_colored(Vec4 col, ZString fmt, ...) @extern("igTextColored");

//igBeginItemTooltip() begin_item_tooltip -> bool
extern fn bool begin_item_tooltip() @extern("igBeginItemTooltip");

//igDragIntRange2(const char* label,int* v_current_min,int* v_current_max,float v_speed=1.0f,int v_min=0,int v_max=0,const char* format=%d,const char* format_max=((void*)0),ImGuiSliderFlags flags=0) drag_int_range2 -> bool
extern fn bool drag_int_range2(ZString label, int* v_current_min, int* v_current_max, float v_speed = 1.0f, int v_min = 0, int v_max = 0, ZString format = "%d", ZString format_max = null, SliderFlags flags = 0) @extern("igDragIntRange2");

//igTableAngledHeadersRow() table_angled_headers_row -> void
extern fn void table_angled_headers_row() @extern("igTableAngledHeadersRow");

//igPushTextWrapPos(float wrap_local_pos_x=0.0f) push_text_wrap_pos -> void
extern fn void push_text_wrap_pos(float wrap_local_pos_x = 0.0f) @extern("igPushTextWrapPos");

//igSetCursorPos(const ImVec2& local_pos) set_cursor_pos -> void
extern fn void set_cursor_pos(Vec2 local_pos) @extern("igSetCursorPos");

//igGetScrollMaxX() get_scroll_max_x -> float
extern fn float get_scroll_max_x() @extern("igGetScrollMaxX");

//igGetCursorPosX() get_cursor_pos_x -> float
extern fn float get_cursor_pos_x() @extern("igGetCursorPosX");

//igGetScrollMaxY() get_scroll_max_y -> float
extern fn float get_scroll_max_y() @extern("igGetScrollMaxY");

//igGetCursorPosY() get_cursor_pos_y -> float
extern fn float get_cursor_pos_y() @extern("igGetCursorPosY");

//igGetCursorStartPos()(ImVec2 *pOut) get_cursor_start_pos -> void, 1
extern fn void igGetCursorStartPos(Vec2* pOut) @extern("igGetCursorStartPos");
fn Vec2 get_cursor_start_pos() @inline {
  Vec2 pOut;
  igGetCursorStartPos(&pOut);
  return pOut;
}

//igOpenPopup_Str(const char* str_id,ImGuiPopupFlags popup_flags=0) open_popup_str -> void
extern fn void open_popup_str(ZString str_id, PopupFlags popup_flags = 0) @extern("igOpenPopup_Str");

//igOpenPopup_ID(ImGuiID id,ImGuiPopupFlags popup_flags=0) open_popup_id -> void
extern fn void open_popup_id(ImID id, PopupFlags popup_flags = 0) @extern("igOpenPopup_ID");

//igGetDrawListSharedData() get_draw_list_shared_data -> void*
extern fn void* get_draw_list_shared_data() @extern("igGetDrawListSharedData");

//igGetMainViewport() get_main_viewport -> Viewport*
extern fn Viewport* get_main_viewport() @extern("igGetMainViewport");

//igSetScrollFromPosX(float local_x,float center_x_ratio=0.5f) set_scroll_from_pos_x -> void
extern fn void set_scroll_from_pos_x(float local_x, float center_x_ratio = 0.5f) @extern("igSetScrollFromPosX");

//igSetScrollFromPosY(float local_y,float center_y_ratio=0.5f) set_scroll_from_pos_y -> void
extern fn void set_scroll_from_pos_y(float local_y, float center_y_ratio = 0.5f) @extern("igSetScrollFromPosY");

//igCalcTextSize(const char* text,const char* text_end=((void*)0),bool hide_text_after_double_hash=false,float wrap_width=-1.0f)(ImVec2 *pOut,const char* text,const char* text_end,bool hide_text_after_double_hash,float wrap_width) calc_text_size -> void, 1
extern fn void igCalcTextSize(Vec2* pOut, ZString text, ZString text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f) @extern("igCalcTextSize");
fn Vec2 calc_text_size(ZString text, ZString text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f) @inline {
  Vec2 pOut;
  igCalcTextSize(&pOut, text,text_end,hide_text_after_double_hash,wrap_width);
  return pOut;
}

//igEndDisabled() end_disabled -> void
extern fn void end_disabled() @extern("igEndDisabled");

//igInputInt(const char* label,int* v,int step=1,int step_fast=100,ImGuiInputTextFlags flags=0) input_int -> bool
extern fn bool input_int(ZString label, int* v, int step = 1, int step_fast = 100, InputTextFlags flags = 0) @extern("igInputInt");

//igGetCurrentContext() get_current_context -> void*
extern fn void* get_current_context() @extern("igGetCurrentContext");

//igButton(const char* label,const ImVec2& size=ImVec2(0,0)) button -> bool
extern fn bool button(ZString label, Vec2 size = {0, 0}) @extern("igButton");

//igGetFrameHeight() get_frame_height -> float
extern fn float get_frame_height() @extern("igGetFrameHeight");

//igEndMainMenuBar() end_main_menu_bar -> void
extern fn void end_main_menu_bar() @extern("igEndMainMenuBar");

//igGetItemID() get_item_id -> ImID
extern fn ImID get_item_id() @extern("igGetItemID");

//igSliderScalarN(const char* label,ImGuiDataType data_type,void* p_data,int components,const void* p_min,const void* p_max,const char* format=((void*)0),ImGuiSliderFlags flags=0) slider_scalar_n -> bool
extern fn bool slider_scalar_n(ZString label, DataType data_type, void* p_data, int components, void* p_min, void* p_max, ZString format = null, SliderFlags flags = 0) @extern("igSliderScalarN");

//igUnindent(float indent_w=0.0f) unindent -> void
extern fn void unindent(float indent_w = 0.0f) @extern("igUnindent");

//igIsPopupOpen(const char* str_id,ImGuiPopupFlags flags=0) is_popup_open -> bool
extern fn bool is_popup_open(ZString str_id, PopupFlags flags = 0) @extern("igIsPopupOpen");

//igSetWindowSize_Vec2(const ImVec2& size,ImGuiCond cond=0) set_window_size_vec2 -> void
extern fn void set_window_size_vec2(Vec2 size, Cond cond = 0) @extern("igSetWindowSize_Vec2");

//igSetWindowSize_Str(const char* name,const ImVec2& size,ImGuiCond cond=0) set_window_size_str -> void
extern fn void set_window_size_str(ZString name, Vec2 size, Cond cond = 0) @extern("igSetWindowSize_Str");

//igRadioButton_Bool(const char* label,bool active) radio_button_bool -> bool
extern fn bool radio_button_bool(ZString label, bool active) @extern("igRadioButton_Bool");

//igRadioButton_IntPtr(const char* label,int* v,int v_button) radio_button_int_ptr -> bool
extern fn bool radio_button_int_ptr(ZString label, int* v, int v_button) @extern("igRadioButton_IntPtr");

//igIsItemHovered(ImGuiHoveredFlags flags=0) is_item_hovered -> bool
extern fn bool is_item_hovered(HoveredFlags flags = 0) @extern("igIsItemHovered");

//igGetKeyPressedAmount(ImGuiKey key,float repeat_delay,float rate) get_key_pressed_amount -> int
extern fn int get_key_pressed_amount(Key key, float repeat_delay, float rate) @extern("igGetKeyPressedAmount");

//igGetWindowWidth() get_window_width -> float
extern fn float get_window_width() @extern("igGetWindowWidth");

//igEndCombo() end_combo -> void
extern fn void end_combo() @extern("igEndCombo");

//igGetMouseDragDelta(ImGuiMouseButton button=0,float lock_threshold=-1.0f)(ImVec2 *pOut,ImGuiMouseButton button,float lock_threshold) get_mouse_drag_delta -> void, 1
extern fn void igGetMouseDragDelta(Vec2* pOut, MouseButton button = 0, float lock_threshold = -1.0f) @extern("igGetMouseDragDelta");
fn Vec2 get_mouse_drag_delta(MouseButton button = 0, float lock_threshold = -1.0f) @inline {
  Vec2 pOut;
  igGetMouseDragDelta(&pOut, button,lock_threshold);
  return pOut;
}

//igSetScrollHereY(float center_y_ratio=0.5f) set_scroll_here_y -> void
extern fn void set_scroll_here_y(float center_y_ratio = 0.5f) @extern("igSetScrollHereY");

//igSetScrollHereX(float center_x_ratio=0.5f) set_scroll_here_x -> void
extern fn void set_scroll_here_x(float center_x_ratio = 0.5f) @extern("igSetScrollHereX");

//igGetContentRegionAvail()(ImVec2 *pOut) get_content_region_avail -> void, 1
extern fn void igGetContentRegionAvail(Vec2* pOut) @extern("igGetContentRegionAvail");
fn Vec2 get_content_region_avail() @inline {
  Vec2 pOut;
  igGetContentRegionAvail(&pOut);
  return pOut;
}

//igSliderScalar(const char* label,ImGuiDataType data_type,void* p_data,const void* p_min,const void* p_max,const char* format=((void*)0),ImGuiSliderFlags flags=0) slider_scalar -> bool
extern fn bool slider_scalar(ZString label, DataType data_type, void* p_data, void* p_min, void* p_max, ZString format = null, SliderFlags flags = 0) @extern("igSliderScalar");

//igSetNextWindowCollapsed(bool collapsed,ImGuiCond cond=0) set_next_window_collapsed -> void
extern fn void set_next_window_collapsed(bool collapsed, Cond cond = 0) @extern("igSetNextWindowCollapsed");

//igInputDouble(const char* label,double* v,double step=0.0,double step_fast=0.0,const char* format=%.6f,ImGuiInputTextFlags flags=0) input_double -> bool
extern fn bool input_double(ZString label, double* v, double step = 0.000000, double step_fast = 0.000000, ZString format = "%.6f", InputTextFlags flags = 0) @extern("igInputDouble");

//igIsAnyMouseDown() is_any_mouse_down -> bool
extern fn bool is_any_mouse_down() @extern("igIsAnyMouseDown");

//igBeginTabBar(const char* str_id,ImGuiTabBarFlags flags=0) begin_tab_bar -> bool
extern fn bool begin_tab_bar(ZString str_id, TabBarFlags flags = 0) @extern("igBeginTabBar");

//igGetStyle() get_style -> Style*
extern fn Style* get_style() @extern("igGetStyle");

//igLoadIniSettingsFromDisk(const char* ini_filename) load_ini_settings_from_disk -> void
extern fn void load_ini_settings_from_disk(ZString ini_filename) @extern("igLoadIniSettingsFromDisk");

//igDragScalarN(const char* label,ImGuiDataType data_type,void* p_data,int components,float v_speed=1.0f,const void* p_min=((void*)0),const void* p_max=((void*)0),const char* format=((void*)0),ImGuiSliderFlags flags=0) drag_scalar_n -> bool
extern fn bool drag_scalar_n(ZString label, DataType data_type, void* p_data, int components, float v_speed = 1.0f, void* p_min = null, void* p_max = null, ZString format = null, SliderFlags flags = 0) @extern("igDragScalarN");

//igDragInt4(const char* label,int v[4],float v_speed=1.0f,int v_min=0,int v_max=0,const char* format=%d,ImGuiSliderFlags flags=0) drag_int4 -> bool
extern fn bool drag_int4(ZString label, int[4] v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, ZString format = "%d", SliderFlags flags = 0) @extern("igDragInt4");

//igDragInt3(const char* label,int v[3],float v_speed=1.0f,int v_min=0,int v_max=0,const char* format=%d,ImGuiSliderFlags flags=0) drag_int3 -> bool
extern fn bool drag_int3(ZString label, int[3] v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, ZString format = "%d", SliderFlags flags = 0) @extern("igDragInt3");

//igDragInt2(const char* label,int v[2],float v_speed=1.0f,int v_min=0,int v_max=0,const char* format=%d,ImGuiSliderFlags flags=0) drag_int2 -> bool
extern fn bool drag_int2(ZString label, int[2] v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, ZString format = "%d", SliderFlags flags = 0) @extern("igDragInt2");

//igShowDebugLogWindow(bool* p_open=((void*)0)) show_debug_log_window -> void
extern fn void show_debug_log_window(bool* p_open = null) @extern("igShowDebugLogWindow");

//igGetStateStorage() get_state_storage -> Storage*
extern fn Storage* get_state_storage() @extern("igGetStateStorage");

//igIsKeyPressed(ImGuiKey key,bool repeat=true) is_key_pressed -> bool
extern fn bool is_key_pressed(Key key, bool repeat = true) @extern("igIsKeyPressed");

//igEndMenuBar() end_menu_bar -> void
extern fn void end_menu_bar() @extern("igEndMenuBar");

//igIsItemActive() is_item_active -> bool
extern fn bool is_item_active() @extern("igIsItemActive");

//igGetColumnWidth(int column_index=-1) get_column_width -> float
extern fn float get_column_width(int column_index = -1) @extern("igGetColumnWidth");

//igUpdatePlatformWindows() update_platform_windows -> void
extern fn void update_platform_windows() @extern("igUpdatePlatformWindows");

//igBeginMainMenuBar() begin_main_menu_bar -> bool
extern fn bool begin_main_menu_bar() @extern("igBeginMainMenuBar");

//igGetFrameHeightWithSpacing() get_frame_height_with_spacing -> float
extern fn float get_frame_height_with_spacing() @extern("igGetFrameHeightWithSpacing");

//igGetFontSize() get_font_size -> float
extern fn float get_font_size() @extern("igGetFontSize");

//igTextWrapped(const char* fmt,...) text_wrapped -> void
extern fn void text_wrapped(ZString fmt, ...) @extern("igTextWrapped");

//igGetCursorPos()(ImVec2 *pOut) get_cursor_pos -> void, 1
extern fn void igGetCursorPos(Vec2* pOut) @extern("igGetCursorPos");
fn Vec2 get_cursor_pos() @inline {
  Vec2 pOut;
  igGetCursorPos(&pOut);
  return pOut;
}

//igColorEdit4(const char* label,float col[4],ImGuiColorEditFlags flags=0) color_edit4 -> bool
extern fn bool color_edit4(ZString label, float[4] col, ColorEditFlags flags = 0) @extern("igColorEdit4");

//igColorEdit3(const char* label,float col[3],ImGuiColorEditFlags flags=0) color_edit3 -> bool
extern fn bool color_edit3(ZString label, float[3] col, ColorEditFlags flags = 0) @extern("igColorEdit3");

//igGetWindowSize()(ImVec2 *pOut) get_window_size -> void, 1
extern fn void igGetWindowSize(Vec2* pOut) @extern("igGetWindowSize");
fn Vec2 get_window_size() @inline {
  Vec2 pOut;
  igGetWindowSize(&pOut);
  return pOut;
}

//igGetBackgroundDrawList(ImGuiViewport* viewport=((void*)0)) get_background_draw_list -> DrawList*
extern fn DrawList* get_background_draw_list(Viewport* viewport = null) @extern("igGetBackgroundDrawList");

//igBeginPopupContextWindow(const char* str_id=((void*)0),ImGuiPopupFlags popup_flags=1) begin_popup_context_window -> bool
extern fn bool begin_popup_context_window(ZString str_id = null, PopupFlags popup_flags = 1) @extern("igBeginPopupContextWindow");

//igInputTextWithHint(const char* label,const char* hint,char* buf,size_t buf_size,ImGuiInputTextFlags flags=0,ImGuiInputTextCallback callback=((void*)0),void* user_data=((void*)0)) input_text_with_hint -> bool
extern fn bool input_text_with_hint(ZString label, ZString hint, char* buf, usz buf_size, InputTextFlags flags = 0, InputTextCallback callback = null, void* user_data = null) @extern("igInputTextWithHint");

//igMemAlloc(size_t size) mem_alloc -> void*
extern fn void* mem_alloc(usz size) @extern("igMemAlloc");

//igBeginPopupContextItem(const char* str_id=((void*)0),ImGuiPopupFlags popup_flags=1) begin_popup_context_item -> bool
extern fn bool begin_popup_context_item(ZString str_id = null, PopupFlags popup_flags = 1) @extern("igBeginPopupContextItem");

//igSelectable_Bool(const char* label,bool selected=false,ImGuiSelectableFlags flags=0,const ImVec2& size=ImVec2(0,0)) selectable_bool -> bool
extern fn bool selectable_bool(ZString label, bool selected = false, SelectableFlags flags = 0, Vec2 size = {0, 0}) @extern("igSelectable_Bool");

//igSelectable_BoolPtr(const char* label,bool* p_selected,ImGuiSelectableFlags flags=0,const ImVec2& size=ImVec2(0,0)) selectable_bool_ptr -> bool
extern fn bool selectable_bool_ptr(ZString label, bool* p_selected, SelectableFlags flags = 0, Vec2 size = {0, 0}) @extern("igSelectable_BoolPtr");

//igInputScalarN(const char* label,ImGuiDataType data_type,void* p_data,int components,const void* p_step=((void*)0),const void* p_step_fast=((void*)0),const char* format=((void*)0),ImGuiInputTextFlags flags=0) input_scalar_n -> bool
extern fn bool input_scalar_n(ZString label, DataType data_type, void* p_data, int components, void* p_step = null, void* p_step_fast = null, ZString format = null, InputTextFlags flags = 0) @extern("igInputScalarN");

//igBeginListBox(const char* label,const ImVec2& size=ImVec2(0,0)) begin_list_box -> bool
extern fn bool begin_list_box(ZString label, Vec2 size = {0, 0}) @extern("igBeginListBox");

//igSetNextItemSelectionUserData(ImGuiSelectionUserData selection_user_data) set_next_item_selection_user_data -> void
extern fn void set_next_item_selection_user_data(SelectionUserData selection_user_data) @extern("igSetNextItemSelectionUserData");

//igGetStyleColorName(ImGuiCol idx) get_style_color_name -> ZString
extern fn ZString get_style_color_name(Col idx) @extern("igGetStyleColorName");

//igBeginTabItem(const char* label,bool* p_open=((void*)0),ImGuiTabItemFlags flags=0) begin_tab_item -> bool
extern fn bool begin_tab_item(ZString label, bool* p_open = null, TabItemFlags flags = 0) @extern("igBeginTabItem");

//igMemFree(void* ptr) mem_free -> void
extern fn void mem_free(void* ptr) @extern("igMemFree");

//igSetTooltip(const char* fmt,...) set_tooltip -> void
extern fn void set_tooltip(ZString fmt, ...) @extern("igSetTooltip");

//igSetItemTooltip(const char* fmt,...) set_item_tooltip -> void
extern fn void set_item_tooltip(ZString fmt, ...) @extern("igSetItemTooltip");

//igGetColumnOffset(int column_index=-1) get_column_offset -> float
extern fn float get_column_offset(int column_index = -1) @extern("igGetColumnOffset");

//igSetWindowCollapsed_Bool(bool collapsed,ImGuiCond cond=0) set_window_collapsed_bool -> void
extern fn void set_window_collapsed_bool(bool collapsed, Cond cond = 0) @extern("igSetWindowCollapsed_Bool");

//igSetWindowCollapsed_Str(const char* name,bool collapsed,ImGuiCond cond=0) set_window_collapsed_str -> void
extern fn void set_window_collapsed_str(ZString name, bool collapsed, Cond cond = 0) @extern("igSetWindowCollapsed_Str");

//igSetNextWindowFocus() set_next_window_focus -> void
extern fn void set_next_window_focus() @extern("igSetNextWindowFocus");

//igDebugStartItemPicker() debug_start_item_picker -> void
extern fn void debug_start_item_picker() @extern("igDebugStartItemPicker");

//igDestroyContext(ImGuiContext* ctx=((void*)0)) destroy_context -> void
extern fn void destroy_context(void* ctx = null) @extern("igDestroyContext");

//igShowStyleEditor(ImGuiStyle* ref=((void*)0)) show_style_editor -> void
extern fn void show_style_editor(Style* ref = null) @extern("igShowStyleEditor");

//igEndGroup() end_group -> void
extern fn void end_group() @extern("igEndGroup");

//igIsAnyItemActive() is_any_item_active -> bool
extern fn bool is_any_item_active() @extern("igIsAnyItemActive");

//igEndDragDropTarget() end_drag_drop_target -> void
extern fn void end_drag_drop_target() @extern("igEndDragDropTarget");

//igSetCursorScreenPos(const ImVec2& pos) set_cursor_screen_pos -> void
extern fn void set_cursor_screen_pos(Vec2 pos) @extern("igSetCursorScreenPos");

//igSaveIniSettingsToDisk(const char* ini_filename) save_ini_settings_to_disk -> void
extern fn void save_ini_settings_to_disk(ZString ini_filename) @extern("igSaveIniSettingsToDisk");

//igImage(ImTextureID user_texture_id,const ImVec2& image_size,const ImVec2& uv0=ImVec2(0,0),const ImVec2& uv1=ImVec2(1,1),const ImVec4& tint_col=ImVec4(1,1,1,1),const ImVec4& border_col=ImVec4(0,0,0,0)) image -> void
extern fn void image(TextureID user_texture_id, Vec2 image_size, Vec2 uv0 = {0, 0}, Vec2 uv1 = {1, 1}, Vec4 tint_col = {1, 1, 1, 1}, Vec4 border_col = {0, 0, 0, 0}) @extern("igImage");

//igEndChild() end_child -> void
extern fn void end_child() @extern("igEndChild");

//igIsWindowHovered(ImGuiHoveredFlags flags=0) is_window_hovered -> bool
extern fn bool is_window_hovered(HoveredFlags flags = 0) @extern("igIsWindowHovered");

//igInputFloat(const char* label,float* v,float step=0.0f,float step_fast=0.0f,const char* format=%.3f,ImGuiInputTextFlags flags=0) input_float -> bool
extern fn bool input_float(ZString label, float* v, float step = 0.0f, float step_fast = 0.0f, ZString format = "%.3f", InputTextFlags flags = 0) @extern("igInputFloat");

//igBeginChild_Str(const char* str_id,const ImVec2& size=ImVec2(0,0),ImGuiChildFlags child_flags=0,ImGuiWindowFlags window_flags=0) begin_child_str -> bool
extern fn bool begin_child_str(ZString str_id, Vec2 size = {0, 0}, ChildFlags child_flags = 0, WindowFlags window_flags = 0) @extern("igBeginChild_Str");

//igBeginChild_ID(ImGuiID id,const ImVec2& size=ImVec2(0,0),ImGuiChildFlags child_flags=0,ImGuiWindowFlags window_flags=0) begin_child_id -> bool
extern fn bool begin_child_id(ImID id, Vec2 size = {0, 0}, ChildFlags child_flags = 0, WindowFlags window_flags = 0) @extern("igBeginChild_ID");

//igSliderInt(const char* label,int* v,int v_min,int v_max,const char* format=%d,ImGuiSliderFlags flags=0) slider_int -> bool
extern fn bool slider_int(ZString label, int* v, int v_min, int v_max, ZString format = "%d", SliderFlags flags = 0) @extern("igSliderInt");

//igRender() render -> void
extern fn void render() @extern("igRender");

//igText(const char* fmt,...) text -> void
extern fn void text(ZString fmt, ...) @extern("igText");

//igVSliderScalar(const char* label,const ImVec2& size,ImGuiDataType data_type,void* p_data,const void* p_min,const void* p_max,const char* format=((void*)0),ImGuiSliderFlags flags=0) v_slider_scalar -> bool
extern fn bool v_slider_scalar(ZString label, Vec2 size, DataType data_type, void* p_data, void* p_min, void* p_max, ZString format = null, SliderFlags flags = 0) @extern("igVSliderScalar");

//igResetMouseDragDelta(ImGuiMouseButton button=0) reset_mouse_drag_delta -> void
extern fn void reset_mouse_drag_delta(MouseButton button = 0) @extern("igResetMouseDragDelta");

//igIsMouseReleased(ImGuiMouseButton button) is_mouse_released -> bool
extern fn bool is_mouse_released(MouseButton button) @extern("igIsMouseReleased");

//igSetNextWindowClass(const ImGuiWindowClass* window_class) set_next_window_class -> void
extern fn void set_next_window_class(WindowClass* window_class) @extern("igSetNextWindowClass");

//igStyleColorsDark(ImGuiStyle* dst=((void*)0)) style_colors_dark -> void
extern fn void style_colors_dark(Style* dst = null) @extern("igStyleColorsDark");

//igSetNextItemWidth(float item_width) set_next_item_width -> void
extern fn void set_next_item_width(float item_width) @extern("igSetNextItemWidth");

//igGetMousePosOnOpeningCurrentPopup()(ImVec2 *pOut) get_mouse_pos_on_opening_current_popup -> void, 1
extern fn void igGetMousePosOnOpeningCurrentPopup(Vec2* pOut) @extern("igGetMousePosOnOpeningCurrentPopup");
fn Vec2 get_mouse_pos_on_opening_current_popup() @inline {
  Vec2 pOut;
  igGetMousePosOnOpeningCurrentPopup(&pOut);
  return pOut;
}

//igIsItemEdited() is_item_edited -> bool
extern fn bool is_item_edited() @extern("igIsItemEdited");

//igSetClipboardText(const char* text) set_clipboard_text -> void
extern fn void set_clipboard_text(ZString text) @extern("igSetClipboardText");

//igBeginMenu(const char* label,bool enabled=true) begin_menu -> bool
extern fn bool begin_menu(ZString label, bool enabled = true) @extern("igBeginMenu");

//igCloseCurrentPopup() close_current_popup -> void
extern fn void close_current_popup() @extern("igCloseCurrentPopup");

//igDestroyPlatformWindows() destroy_platform_windows -> void
extern fn void destroy_platform_windows() @extern("igDestroyPlatformWindows");

//igSetKeyboardFocusHere(int offset=0) set_keyboard_focus_here -> void
extern fn void set_keyboard_focus_here(int offset = 0) @extern("igSetKeyboardFocusHere");

//igPushStyleColor_U32(ImGuiCol idx,ImU32 col) push_style_color_u32 -> void
extern fn void push_style_color_u32(Col idx, ImU32 col) @extern("igPushStyleColor_U32");

//igPushStyleColor_Vec4(ImGuiCol idx,const ImVec4& col) push_style_color_vec4 -> void
extern fn void push_style_color_vec4(Col idx, Vec4 col) @extern("igPushStyleColor_Vec4");

//igSetNextWindowScroll(const ImVec2& scroll) set_next_window_scroll -> void
extern fn void set_next_window_scroll(Vec2 scroll) @extern("igSetNextWindowScroll");

//igSetDragDropPayload(const char* type,const void* data,size_t sz,ImGuiCond cond=0) set_drag_drop_payload -> bool
extern fn bool set_drag_drop_payload(ZString type, void* data, usz sz, Cond cond = 0) @extern("igSetDragDropPayload");

//igPopID() pop_id -> void
extern fn void pop_id() @extern("igPopID");

//igGetCursorScreenPos()(ImVec2 *pOut) get_cursor_screen_pos -> void, 1
extern fn void igGetCursorScreenPos(Vec2* pOut) @extern("igGetCursorScreenPos");
fn Vec2 get_cursor_screen_pos() @inline {
  Vec2 pOut;
  igGetCursorScreenPos(&pOut);
  return pOut;
}

//igCollapsingHeader_TreeNodeFlags(const char* label,ImGuiTreeNodeFlags flags=0) collapsing_header_tree_node_flags -> bool
extern fn bool collapsing_header_tree_node_flags(ZString label, TreeNodeFlags flags = 0) @extern("igCollapsingHeader_TreeNodeFlags");

//igCollapsingHeader_BoolPtr(const char* label,bool* p_visible,ImGuiTreeNodeFlags flags=0) collapsing_header_bool_ptr -> bool
extern fn bool collapsing_header_bool_ptr(ZString label, bool* p_visible, TreeNodeFlags flags = 0) @extern("igCollapsingHeader_BoolPtr");

//igEndPopup() end_popup -> void
extern fn void end_popup() @extern("igEndPopup");

//igDebugLog(const char* fmt,...) debug_log -> void
extern fn void debug_log(ZString fmt, ...) @extern("igDebugLog");

//igTextLink(const char* label) text_link -> bool
extern fn bool text_link(ZString label) @extern("igTextLink");

//igDragInt(const char* label,int* v,float v_speed=1.0f,int v_min=0,int v_max=0,const char* format=%d,ImGuiSliderFlags flags=0) drag_int -> bool
extern fn bool drag_int(ZString label, int* v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, ZString format = "%d", SliderFlags flags = 0) @extern("igDragInt");

//igNextColumn() next_column -> void
extern fn void next_column() @extern("igNextColumn");

//igVSliderInt(const char* label,const ImVec2& size,int* v,int v_min,int v_max,const char* format=%d,ImGuiSliderFlags flags=0) v_slider_int -> bool
extern fn bool v_slider_int(ZString label, Vec2 size, int* v, int v_min, int v_max, ZString format = "%d", SliderFlags flags = 0) @extern("igVSliderInt");

//igPushClipRect(const ImVec2& clip_rect_min,const ImVec2& clip_rect_max,bool intersect_with_current_clip_rect) push_clip_rect -> void
extern fn void push_clip_rect(Vec2 clip_rect_min, Vec2 clip_rect_max, bool intersect_with_current_clip_rect) @extern("igPushClipRect");

//igLogToTTY(int auto_open_depth=-1) log_to_tty -> void
extern fn void log_to_tty(int auto_open_depth = -1) @extern("igLogToTTY");

//igBeginTooltip() begin_tooltip -> bool
extern fn bool begin_tooltip() @extern("igBeginTooltip");

//igNewFrame() new_frame -> void
extern fn void new_frame() @extern("igNewFrame");

//igCombo_Str_arr(const char* label,int* current_item,const char* const items[],int items_count,int popup_max_height_in_items=-1) combo_str_arr -> bool
extern fn bool combo_str_arr(ZString label, int* current_item, ZString[] items, int items_count, int popup_max_height_in_items = -1) @extern("igCombo_Str_arr");

//igCombo_Str(const char* label,int* current_item,const char* items_separated_by_zeros,int popup_max_height_in_items=-1) combo_str -> bool
extern fn bool combo_str(ZString label, int* current_item, ZString items_separated_by_zeros, int popup_max_height_in_items = -1) @extern("igCombo_Str");

//igCombo_FnStrPtr(const char* label,int* current_item,const char*(*getter)(void* user_data,int idx),void* user_data,int items_count,int popup_max_height_in_items=-1) combo_fn_str_ptr -> bool
extern fn bool combo_fn_str_ptr(ZString label, int* current_item, ComboFnStrPtrCallback getter, void* user_data, int items_count, int popup_max_height_in_items = -1) @extern("igCombo_FnStrPtr");
def ComboFnStrPtrCallback = fn ZString(void* user_data, int idx);

//igTableHeadersRow() table_headers_row -> void
extern fn void table_headers_row() @extern("igTableHeadersRow");

//igGetWindowHeight() get_window_height -> float
extern fn float get_window_height() @extern("igGetWindowHeight");

//igShowUserGuide() show_user_guide -> void
extern fn void show_user_guide() @extern("igShowUserGuide");

//igSetItemDefaultFocus() set_item_default_focus -> void
extern fn void set_item_default_focus() @extern("igSetItemDefaultFocus");

//igPopItemFlag() pop_item_flag -> void
extern fn void pop_item_flag() @extern("igPopItemFlag");

//igIndent(float indent_w=0.0f) indent -> void
extern fn void indent(float indent_w = 0.0f) @extern("igIndent");

//igIsItemVisible() is_item_visible -> bool
extern fn bool is_item_visible() @extern("igIsItemVisible");

//igGetClipboardText() get_clipboard_text -> ZString
extern fn ZString get_clipboard_text() @extern("igGetClipboardText");

//igEndTooltip() end_tooltip -> void
extern fn void end_tooltip() @extern("igEndTooltip");

//igCreateContext(ImFontAtlas* shared_font_atlas=((void*)0)) create_context -> void*
extern fn void* create_context(FontAtlas* shared_font_atlas = null) @extern("igCreateContext");

//igTableGetRowIndex() table_get_row_index -> int
extern fn int table_get_row_index() @extern("igTableGetRowIndex");

//igSeparatorText(const char* label) separator_text -> void
extern fn void separator_text(ZString label) @extern("igSeparatorText");

//igSetNextItemShortcut(ImGuiKeyChord key_chord,ImGuiInputFlags flags=0) set_next_item_shortcut -> void
extern fn void set_next_item_shortcut(KeyChord key_chord, InputFlags flags = 0) @extern("igSetNextItemShortcut");

//igProgressBar(float fraction,const ImVec2& size_arg=ImVec2(-1.17549435082228750796873653722224568e-38F,0),const char* overlay=((void*)0)) progress_bar -> void
extern fn void progress_bar(float fraction, Vec2 size_arg = {-float.min, 0}, ZString overlay = null) @extern("igProgressBar");

//igPopStyleColor(int count=1) pop_style_color -> void
extern fn void pop_style_color(int count = 1) @extern("igPopStyleColor");

//igColumns(int count=1,const char* id=((void*)0),bool border=true) columns -> void
extern fn void columns(int count = 1, ZString id = null, bool border = true) @extern("igColumns");

//igTreePop() tree_pop -> void
extern fn void tree_pop() @extern("igTreePop");

//igGetFrameCount() get_frame_count -> int
extern fn int get_frame_count() @extern("igGetFrameCount");

//igAlignTextToFramePadding() align_text_to_frame_padding -> void
extern fn void align_text_to_frame_padding() @extern("igAlignTextToFramePadding");

//igGetAllocatorFunctions(ImGuiMemAllocFunc* p_alloc_func,ImGuiMemFreeFunc* p_free_func,void** p_user_data) get_allocator_functions -> void
extern fn void get_allocator_functions(MemAllocFunc* p_alloc_func, MemFreeFunc* p_free_func, void** p_user_data) @extern("igGetAllocatorFunctions");

//igLogToClipboard(int auto_open_depth=-1) log_to_clipboard -> void
extern fn void log_to_clipboard(int auto_open_depth = -1) @extern("igLogToClipboard");

//igIsItemActivated() is_item_activated -> bool
extern fn bool is_item_activated() @extern("igIsItemActivated");

//igEndDragDropSource() end_drag_drop_source -> void
extern fn void end_drag_drop_source() @extern("igEndDragDropSource");

//igBeginPopupContextVoid(const char* str_id=((void*)0),ImGuiPopupFlags popup_flags=1) begin_popup_context_void -> bool
extern fn bool begin_popup_context_void(ZString str_id = null, PopupFlags popup_flags = 1) @extern("igBeginPopupContextVoid");

//igColorButton(const char* desc_id,const ImVec4& col,ImGuiColorEditFlags flags=0,const ImVec2& size=ImVec2(0,0)) color_button -> bool
extern fn bool color_button(ZString desc_id, Vec4 col, ColorEditFlags flags = 0, Vec2 size = {0, 0}) @extern("igColorButton");

//igPlotHistogram_FloatPtr(const char* label,const float* values,int values_count,int values_offset=0,const char* overlay_text=((void*)0),float scale_min=3.40282346638528859811704183484516925e+38F,float scale_max=3.40282346638528859811704183484516925e+38F,ImVec2 graph_size=ImVec2(0,0),int stride=sizeof(float)) plot_histogram_float_ptr -> void
extern fn void plot_histogram_float_ptr(ZString label, float* values, int values_count, int values_offset = 0, ZString overlay_text = null, float scale_min = float.max, float scale_max = float.max, Vec2 graph_size = {0, 0}, int stride = float.sizeof) @extern("igPlotHistogram_FloatPtr");

//igPlotHistogram_FnFloatPtr(const char* label,float(*values_getter)(void* data,int idx),void* data,int values_count,int values_offset=0,const char* overlay_text=((void*)0),float scale_min=3.40282346638528859811704183484516925e+38F,float scale_max=3.40282346638528859811704183484516925e+38F,ImVec2 graph_size=ImVec2(0,0)) plot_histogram_fn_float_ptr -> void
extern fn void plot_histogram_fn_float_ptr(ZString label, PlotHistogramFnFloatPtrCallback values_getter, void* data, int values_count, int values_offset = 0, ZString overlay_text = null, float scale_min = float.max, float scale_max = float.max, Vec2 graph_size = {0, 0}) @extern("igPlotHistogram_FnFloatPtr");
def PlotHistogramFnFloatPtrCallback = fn float(void* data, int idx);

//igIsWindowCollapsed() is_window_collapsed -> bool
extern fn bool is_window_collapsed() @extern("igIsWindowCollapsed");

//igDebugFlashStyleColor(ImGuiCol idx) debug_flash_style_color -> void
extern fn void debug_flash_style_color(Col idx) @extern("igDebugFlashStyleColor");

//igTableNextColumn() table_next_column -> bool
extern fn bool table_next_column() @extern("igTableNextColumn");

//igSetColumnWidth(int column_index,float width) set_column_width -> void
extern fn void set_column_width(int column_index, float width) @extern("igSetColumnWidth");

//igDockSpaceOverViewport(ImGuiID dockspace_id=0,const ImGuiViewport* viewport=((void*)0),ImGuiDockNodeFlags flags=0,const ImGuiWindowClass* window_class=((void*)0)) dock_space_over_viewport -> ImID
extern fn ImID dock_space_over_viewport(ImID dockspace_id = 0, Viewport* viewport = null, DockNodeFlags flags = 0, WindowClass* window_class = null) @extern("igDockSpaceOverViewport");

//igLabelText(const char* label,const char* fmt,...) label_text -> void
extern fn void label_text(ZString label, ZString fmt, ...) @extern("igLabelText");

//igCalcItemWidth() calc_item_width -> float
extern fn float calc_item_width() @extern("igCalcItemWidth");

//igIsItemClicked(ImGuiMouseButton mouse_button=0) is_item_clicked -> bool
extern fn bool is_item_clicked(MouseButton mouse_button = 0) @extern("igIsItemClicked");

//igTableNextRow(ImGuiTableRowFlags row_flags=0,float min_row_height=0.0f) table_next_row -> void
extern fn void table_next_row(TableRowFlags row_flags = 0, float min_row_height = 0.0f) @extern("igTableNextRow");

//igGetPlatformIO() get_platform_io -> PlatformIO*
extern fn PlatformIO* get_platform_io() @extern("igGetPlatformIO");

//igSliderAngle(const char* label,float* v_rad,float v_degrees_min=-360.0f,float v_degrees_max=+360.0f,const char* format=%.0f deg,ImGuiSliderFlags flags=0) slider_angle -> bool
extern fn bool slider_angle(ZString label, float* v_rad, float v_degrees_min = -360.0f, float v_degrees_max = +360.0f, ZString format = "%.0f deg", SliderFlags flags = 0) @extern("igSliderAngle");

//igLogFinish() log_finish -> void
extern fn void log_finish() @extern("igLogFinish");

//igInputScalar(const char* label,ImGuiDataType data_type,void* p_data,const void* p_step=((void*)0),const void* p_step_fast=((void*)0),const char* format=((void*)0),ImGuiInputTextFlags flags=0) input_scalar -> bool
extern fn bool input_scalar(ZString label, DataType data_type, void* p_data, void* p_step = null, void* p_step_fast = null, ZString format = null, InputTextFlags flags = 0) @extern("igInputScalar");

//igColorConvertRGBtoHSV(float r,float g,float b,float& out_h,float& out_s,float& out_v) color_convert_rg_bto_hsv -> void
extern fn void color_convert_rg_bto_hsv(float r, float g, float b, float* out_h, float* out_s, float* out_v) @extern("igColorConvertRGBtoHSV");

//igSmallButton(const char* label) small_button -> bool
extern fn bool small_button(ZString label) @extern("igSmallButton");

//igGetItemRectSize()(ImVec2 *pOut) get_item_rect_size -> void, 1
extern fn void igGetItemRectSize(Vec2* pOut) @extern("igGetItemRectSize");
fn Vec2 get_item_rect_size() @inline {
  Vec2 pOut;
  igGetItemRectSize(&pOut);
  return pOut;
}

//igTableSetColumnEnabled(int column_n,bool v) table_set_column_enabled -> void
extern fn void table_set_column_enabled(int column_n, bool v) @extern("igTableSetColumnEnabled");

//igTableGetColumnCount() table_get_column_count -> int
extern fn int table_get_column_count() @extern("igTableGetColumnCount");

//igVSliderFloat(const char* label,const ImVec2& size,float* v,float v_min,float v_max,const char* format=%.3f,ImGuiSliderFlags flags=0) v_slider_float -> bool
extern fn bool v_slider_float(ZString label, Vec2 size, float* v, float v_min, float v_max, ZString format = "%.3f", SliderFlags flags = 0) @extern("igVSliderFloat");

//igPopClipRect() pop_clip_rect -> void
extern fn void pop_clip_rect() @extern("igPopClipRect");

//igBeginPopupModal(const char* name,bool* p_open=((void*)0),ImGuiWindowFlags flags=0) begin_popup_modal -> bool
extern fn bool begin_popup_modal(ZString name, bool* p_open = null, WindowFlags flags = 0) @extern("igBeginPopupModal");

//igGetDragDropPayload() get_drag_drop_payload -> Payload*
extern fn Payload* get_drag_drop_payload() @extern("igGetDragDropPayload");

//igTextDisabled(const char* fmt,...) text_disabled -> void
extern fn void text_disabled(ZString fmt, ...) @extern("igTextDisabled");

//igGetMouseCursor() get_mouse_cursor -> MouseCursor
extern fn MouseCursor get_mouse_cursor() @extern("igGetMouseCursor");

//igTableGetColumnFlags(int column_n=-1) table_get_column_flags -> TableColumnFlags
extern fn TableColumnFlags table_get_column_flags(int column_n = -1) @extern("igTableGetColumnFlags");

//igSameLine(float offset_from_start_x=0.0f,float spacing=-1.0f) same_line -> void
extern fn void same_line(float offset_from_start_x = 0.0f, float spacing = -1.0f) @extern("igSameLine");

//igIsMouseHoveringRect(const ImVec2& r_min,const ImVec2& r_max,bool clip=true) is_mouse_hovering_rect -> bool
extern fn bool is_mouse_hovering_rect(Vec2 r_min, Vec2 r_max, bool clip = true) @extern("igIsMouseHoveringRect");

//igSetNextWindowDockID(ImGuiID dock_id,ImGuiCond cond=0) set_next_window_dock_id -> void
extern fn void set_next_window_dock_id(ImID dock_id, Cond cond = 0) @extern("igSetNextWindowDockID");

//igSetCurrentContext(ImGuiContext* ctx) set_current_context -> void
extern fn void set_current_context(void* ctx) @extern("igSetCurrentContext");

//igPushFont(ImFont* font) push_font -> void
extern fn void push_font(Font* font) @extern("igPushFont");

//igSetNextWindowContentSize(const ImVec2& size) set_next_window_content_size -> void
extern fn void set_next_window_content_size(Vec2 size) @extern("igSetNextWindowContentSize");

//igPopStyleVar(int count=1) pop_style_var -> void
extern fn void pop_style_var(int count = 1) @extern("igPopStyleVar");

//igNewLine() new_line -> void
extern fn void new_line() @extern("igNewLine");

//igDebugCheckVersionAndDataLayout(const char* version_str,size_t sz_io,size_t sz_style,size_t sz_vec2,size_t sz_vec4,size_t sz_drawvert,size_t sz_drawidx) debug_check_version_and_data_layout -> bool
extern fn bool debug_check_version_and_data_layout(ZString version_str, usz sz_io, usz sz_style, usz sz_vec2, usz sz_vec4, usz sz_drawvert, usz sz_drawidx) @extern("igDebugCheckVersionAndDataLayout");

//igColorConvertFloat4ToU32(const ImVec4& in) color_convert_float4_to_u32 -> ImU32
extern fn ImU32 color_convert_float4_to_u32(Vec4 in) @extern("igColorConvertFloat4ToU32");

//igMenuItem_Bool(const char* label,const char* shortcut=((void*)0),bool selected=false,bool enabled=true) menu_item_bool -> bool
extern fn bool menu_item_bool(ZString label, ZString shortcut = null, bool selected = false, bool enabled = true) @extern("igMenuItem_Bool");

//igMenuItem_BoolPtr(const char* label,const char* shortcut,bool* p_selected,bool enabled=true) menu_item_bool_ptr -> bool
extern fn bool menu_item_bool_ptr(ZString label, ZString shortcut, bool* p_selected, bool enabled = true) @extern("igMenuItem_BoolPtr");

//igSetWindowFontScale(float scale) set_window_font_scale -> void
extern fn void set_window_font_scale(float scale) @extern("igSetWindowFontScale");

//igPopTextWrapPos() pop_text_wrap_pos -> void
extern fn void pop_text_wrap_pos() @extern("igPopTextWrapPos");

//igSetNextItemOpen(bool is_open,ImGuiCond cond=0) set_next_item_open -> void
extern fn void set_next_item_open(bool is_open, Cond cond = 0) @extern("igSetNextItemOpen");

//igGetColumnIndex() get_column_index -> int
extern fn int get_column_index() @extern("igGetColumnIndex");

//igBullet() bullet -> void
extern fn void bullet() @extern("igBullet");

//igGetWindowPos()(ImVec2 *pOut) get_window_pos -> void, 1
extern fn void igGetWindowPos(Vec2* pOut) @extern("igGetWindowPos");
fn Vec2 get_window_pos() @inline {
  Vec2 pOut;
  igGetWindowPos(&pOut);
  return pOut;
}

//igSetNextWindowBgAlpha(float alpha) set_next_window_bg_alpha -> void
extern fn void set_next_window_bg_alpha(float alpha) @extern("igSetNextWindowBgAlpha");

