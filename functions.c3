module imgui;
extern fn ZString table_get_column_name(int column_n = -1) @extern("igTableGetColumnName");

extern fn void igGetMousePos(Vec2* pOut) @extern("igGetMousePos") @local;
fn Vec2 get_mouse_pos() @inline {
	Vec2 pOut;
	igGetMousePos(&pOut);
	return pOut;
}

extern fn void load_ini_settings_from_memory(ZString ini_data, usz ini_size = 0) @extern("igLoadIniSettingsFromMemory");

extern fn double get_time() @extern("igGetTime");

extern fn void set_tab_item_closed(ZString tab_or_docked_window_label) @extern("igSetTabItemClosed");

extern fn void end_tab_bar() @extern("igEndTabBar");

extern fn bool is_window_docked() @extern("igIsWindowDocked");

extern fn void end_frame() @extern("igEndFrame");

extern fn bool shortcut(KeyChord key_chord, InputFlags flags = 0) @extern("igShortcut");

extern fn void igGetItemRectMax(Vec2* pOut) @extern("igGetItemRectMax") @local;
fn Vec2 get_item_rect_max() @inline {
	Vec2 pOut;
	igGetItemRectMax(&pOut);
	return pOut;
}

extern fn float get_text_line_height() @extern("igGetTextLineHeight");

extern fn ImID get_window_dock_id() @extern("igGetWindowDockID");

extern fn bool is_mouse_double_clicked(MouseButton button) @extern("igIsMouseDoubleClicked");

extern fn void pop_item_width() @extern("igPopItemWidth");

extern fn void end_tab_item() @extern("igEndTabItem");

extern fn bool begin_drag_drop_source(DragDropFlags flags = 0) @extern("igBeginDragDropSource");

extern fn void show_metrics_window(bool* p_open = null) @extern("igShowMetricsWindow");

extern fn void set_allocator_functions(MemAllocFunc alloc_func, MemFreeFunc free_func, void* user_data = null) @extern("igSetAllocatorFunctions");

extern fn bool input_float3(ZString label, float[3] v, ZString format = "%.3f", InputTextFlags flags = 0) @extern("igInputFloat3");

extern fn bool input_float2(ZString label, float[2] v, ZString format = "%.3f", InputTextFlags flags = 0) @extern("igInputFloat2");

extern fn bool input_float4(ZString label, float[4] v, ZString format = "%.3f", InputTextFlags flags = 0) @extern("igInputFloat4");

extern fn ZString get_key_name(Key key) @extern("igGetKeyName");

extern fn MultiSelectIO* begin_multi_select(MultiSelectFlags flags, int selection_size = -1, int items_count = -1) @extern("igBeginMultiSelect");

extern fn bool tab_item_button(ZString label, TabItemFlags flags = 0) @extern("igTabItemButton");

extern fn bool is_any_item_focused() @extern("igIsAnyItemFocused");

extern fn bool slider_int3(ZString label, int[3] v, int v_min, int v_max, ZString format = "%d", SliderFlags flags = 0) @extern("igSliderInt3");

extern fn bool slider_int2(ZString label, int[2] v, int v_min, int v_max, ZString format = "%d", SliderFlags flags = 0) @extern("igSliderInt2");

extern fn void end_list_box() @extern("igEndListBox");

extern fn Font* get_font() @extern("igGetFont");

extern fn bool begin_table(ZString str_id, int columns, TableFlags flags = 0, Vec2 outer_size = {0.0f, 0.0f}, float inner_width = 0.0f) @extern("igBeginTable");

extern fn bool slider_int4(ZString label, int[4] v, int v_min, int v_max, ZString format = "%d", SliderFlags flags = 0) @extern("igSliderInt4");

extern fn float get_text_line_height_with_spacing() @extern("igGetTextLineHeightWithSpacing");

extern fn void end() @extern("igEnd");

extern fn bool is_rect_visible_nil(Vec2 size) @extern("igIsRectVisible_Nil");

extern fn bool is_rect_visible_vec2(Vec2 rect_min, Vec2 rect_max) @extern("igIsRectVisible_Vec2");

extern fn bool is_item_toggled_selection() @extern("igIsItemToggledSelection");

extern fn bool input_text_multiline(ZString label, char* buf, usz buf_size, Vec2 size = {0, 0}, InputTextFlags flags = 0, InputTextCallback callback = null, void* user_data = null) @extern("igInputTextMultiline");

extern fn void end_menu() @extern("igEndMenu");

extern fn MultiSelectIO* end_multi_select() @extern("igEndMultiSelect");

extern fn bool tree_node_ex_str(ZString label, TreeNodeFlags flags = 0) @extern("igTreeNodeEx_Str");

extern fn bool tree_node_ex_str_str(ZString str_id, TreeNodeFlags flags, ZString fmt, ...) @extern("igTreeNodeEx_StrStr");

extern fn bool tree_node_ex_ptr(void* ptr_id, TreeNodeFlags flags, ZString fmt, ...) @extern("igTreeNodeEx_Ptr");

extern fn void table_setup_column(ZString label, TableColumnFlags flags = 0, float init_width_or_weight = 0.0f, ImID user_id = 0) @extern("igTableSetupColumn");

extern fn void set_color_edit_options(ColorEditFlags flags) @extern("igSetColorEditOptions");

extern fn bool show_style_selector(ZString label) @extern("igShowStyleSelector");

extern fn void spacing() @extern("igSpacing");

extern fn void push_item_flag(ItemFlags option, bool enabled) @extern("igPushItemFlag");

extern fn bool begin(ZString name, bool* p_open = null, WindowFlags flags = 0) @extern("igBegin");

extern fn void color_convert_hs_vto_rgb(float h, float s, float v, float* out_r, float* out_g, float* out_b) @extern("igColorConvertHSVtoRGB");

extern fn bool is_item_toggled_open() @extern("igIsItemToggledOpen");

extern fn bool begin_drag_drop_target() @extern("igBeginDragDropTarget");

extern fn bool drag_float(ZString label, float* v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", SliderFlags flags = 0) @extern("igDragFloat");

extern fn void show_about_window(bool* p_open = null) @extern("igShowAboutWindow");

extern fn void render_platform_windows_default(void* platform_render_arg = null, void* renderer_render_arg = null) @extern("igRenderPlatformWindowsDefault");

extern fn void push_id_str(ZString str_id) @extern("igPushID_Str");

extern fn void push_id_str_str(ZString str_id_begin, ZString str_id_end) @extern("igPushID_StrStr");

extern fn void push_id_ptr(void* ptr_id) @extern("igPushID_Ptr");

extern fn void push_id_int(int int_id) @extern("igPushID_Int");

extern fn void igGetFontTexUvWhitePixel(Vec2* pOut) @extern("igGetFontTexUvWhitePixel") @local;
fn Vec2 get_font_tex_uv_white_pixel() @inline {
	Vec2 pOut;
	igGetFontTexUvWhitePixel(&pOut);
	return pOut;
}

extern fn void style_colors_light(Style* dst = null) @extern("igStyleColorsLight");

extern fn bool is_any_item_hovered() @extern("igIsAnyItemHovered");

extern fn int table_get_column_index() @extern("igTableGetColumnIndex");

extern fn TableSortSpecs* table_get_sort_specs() @extern("igTableGetSortSpecs");

extern fn void igGetItemRectMin(Vec2* pOut) @extern("igGetItemRectMin") @local;
fn Vec2 get_item_rect_min() @inline {
	Vec2 pOut;
	igGetItemRectMin(&pOut);
	return pOut;
}

extern fn void show_font_selector(ZString label) @extern("igShowFontSelector");

extern fn Viewport* find_viewport_by_id(ImID id) @extern("igFindViewportByID");

extern fn bool is_mouse_down(MouseButton button) @extern("igIsMouseDown");

extern fn bool is_item_focused() @extern("igIsItemFocused");

extern fn int get_mouse_clicked_count(MouseButton button) @extern("igGetMouseClickedCount");

extern fn bool begin_menu_bar() @extern("igBeginMenuBar");

extern fn void table_set_bg_color(TableBgTarget target, ImU32 color, int column_n = -1) @extern("igTableSetBgColor");

extern fn void end_table() @extern("igEndTable");

extern fn void set_next_frame_want_capture_mouse(bool want_capture_mouse) @extern("igSetNextFrameWantCaptureMouse");

extern fn void set_next_frame_want_capture_keyboard(bool want_capture_keyboard) @extern("igSetNextFrameWantCaptureKeyboard");

extern fn void set_window_pos_vec2(Vec2 pos, Cond cond = 0) @extern("igSetWindowPos_Vec2");

extern fn void set_window_pos_str(ZString name, Vec2 pos, Cond cond = 0) @extern("igSetWindowPos_Str");

extern fn void show_id_stack_tool_window(bool* p_open = null) @extern("igShowIDStackToolWindow");

extern fn void table_setup_scroll_freeze(int cols, int rows) @extern("igTableSetupScrollFreeze");

extern fn void plot_lines_float_ptr(ZString label, float* values, int values_count, int values_offset = 0, ZString overlay_text = null, float scale_min = float.max, float scale_max = float.max, Vec2 graph_size = {0, 0}, int stride = float.sizeof) @extern("igPlotLines_FloatPtr");

extern fn void plot_lines_fn_float_ptr(ZString label, PlotLines_ValuesGetter_Func values_getter, void* data, int values_count, int values_offset = 0, ZString overlay_text = null, float scale_min = float.max, float scale_max = float.max, Vec2 graph_size = {0, 0}) @extern("igPlotLines_FnFloatPtr");
def PlotLines_ValuesGetter_Func = fn float(void* data, int idx);

extern fn void set_next_window_size_constraints(Vec2 size_min, Vec2 size_max, SizeCallback custom_callback = null, void* custom_callback_data = null) @extern("igSetNextWindowSizeConstraints");

extern fn void bullet_text(ZString fmt, ...) @extern("igBulletText");

extern fn bool is_key_chord_pressed(KeyChord key_chord) @extern("igIsKeyChordPressed");

extern fn ZString save_ini_settings_to_memory(usz* out_ini_size = null) @extern("igSaveIniSettingsToMemory");

extern fn bool is_key_released(Key key) @extern("igIsKeyReleased");

extern fn void push_item_width(float item_width) @extern("igPushItemWidth");

extern fn Viewport* find_viewport_by_platform_handle(void* platform_handle) @extern("igFindViewportByPlatformHandle");

extern fn void show_demo_window(bool* p_open = null) @extern("igShowDemoWindow");

extern fn Vec4* get_style_color_vec4(Col idx) @extern("igGetStyleColorVec4");

extern fn bool list_box_str_arr(ZString label, int* current_item, ZString[] items, int items_count, int height_in_items = -1) @extern("igListBox_Str_arr");

extern fn bool list_box_fn_str_ptr(ZString label, int* current_item, ListBox_Getter_Func getter, void* user_data, int items_count, int height_in_items = -1) @extern("igListBox_FnStrPtr");
def ListBox_Getter_Func = fn ZString(void* user_data, int idx);

extern fn bool invisible_button(ZString str_id, Vec2 size, ButtonFlags flags = 0) @extern("igInvisibleButton");

extern fn bool arrow_button(ZString str_id, Dir dir) @extern("igArrowButton");

extern fn DrawList* get_window_draw_list() @extern("igGetWindowDrawList");

extern fn void set_next_item_storage_id(ImID storage_id) @extern("igSetNextItemStorageID");

extern fn bool is_mouse_pos_valid(Vec2* mouse_pos = null) @extern("igIsMousePosValid");

extern fn ImID dock_space(ImID dockspace_id, Vec2 size = {0, 0}, DockNodeFlags flags = 0, WindowClass* window_class = null) @extern("igDockSpace");

extern fn void text_link_open_url(ZString label, ZString url = null) @extern("igTextLinkOpenURL");

extern fn void set_column_offset(int column_index, float offset_x) @extern("igSetColumnOffset");

extern fn void dummy(Vec2 size) @extern("igDummy");

extern fn bool is_item_deactivated() @extern("igIsItemDeactivated");

extern fn bool input_text(ZString label, char* buf, usz buf_size, InputTextFlags flags = 0, InputTextCallback callback = null, void* user_data = null) @extern("igInputText");

extern fn float get_window_dpi_scale() @extern("igGetWindowDpiScale");

extern fn void begin_disabled(bool disabled = true) @extern("igBeginDisabled");

extern fn void separator() @extern("igSeparator");

extern fn Payload* accept_drag_drop_payload(ZString type, DragDropFlags flags = 0) @extern("igAcceptDragDropPayload");

extern fn void set_next_window_viewport(ImID viewport_id) @extern("igSetNextWindowViewport");

extern fn ImU32 get_color_u32_col(Col idx, float alpha_mul = 1.0f) @extern("igGetColorU32_Col");

extern fn ImU32 get_color_u32_vec4(Vec4 col) @extern("igGetColorU32_Vec4");

extern fn ImU32 get_color_u32_u32(ImU32 col, float alpha_mul = 1.0f) @extern("igGetColorU32_U32");

extern fn bool checkbox_flags_int_ptr(ZString label, int* flags, int flags_value) @extern("igCheckboxFlags_IntPtr");

extern fn bool checkbox_flags_uint_ptr(ZString label, uint* flags, uint flags_value) @extern("igCheckboxFlags_UintPtr");

extern fn void pop_font() @extern("igPopFont");

extern fn bool slider_float4(ZString label, float[4] v, float v_min, float v_max, ZString format = "%.3f", SliderFlags flags = 0) @extern("igSliderFloat4");

extern fn float get_tree_node_to_label_spacing() @extern("igGetTreeNodeToLabelSpacing");

extern fn bool tree_node_str(ZString label) @extern("igTreeNode_Str");

extern fn bool tree_node_str_str(ZString str_id, ZString fmt, ...) @extern("igTreeNode_StrStr");

extern fn bool tree_node_ptr(void* ptr_id, ZString fmt, ...) @extern("igTreeNode_Ptr");

extern fn bool table_set_column_index(int column_n) @extern("igTableSetColumnIndex");

extern fn void set_scroll_y(float scroll_y) @extern("igSetScrollY");

extern fn ImIO* get_io() @extern("igGetIO");

extern fn void set_scroll_x(float scroll_x) @extern("igSetScrollX");

extern fn int table_get_hovered_column() @extern("igTableGetHoveredColumn");

extern fn bool slider_float3(ZString label, float[3] v, float v_min, float v_max, ZString format = "%.3f", SliderFlags flags = 0) @extern("igSliderFloat3");

extern fn void set_item_key_owner(Key key) @extern("igSetItemKeyOwner");

extern fn bool slider_float2(ZString label, float[2] v, float v_min, float v_max, ZString format = "%.3f", SliderFlags flags = 0) @extern("igSliderFloat2");

extern fn bool is_window_focused(FocusedFlags flags = 0) @extern("igIsWindowFocused");

extern fn void set_next_item_allow_overlap() @extern("igSetNextItemAllowOverlap");

extern fn bool image_button(ZString str_id, TextureID user_texture_id, Vec2 image_size, Vec2 uv0 = {0, 0}, Vec2 uv1 = {1, 1}, Vec4 bg_col = {0, 0, 0, 0}, Vec4 tint_col = {1, 1, 1, 1}) @extern("igImageButton");

extern fn ImID get_id_str(ZString str_id) @extern("igGetID_Str");

extern fn ImID get_id_str_str(ZString str_id_begin, ZString str_id_end) @extern("igGetID_StrStr");

extern fn ImID get_id_ptr(void* ptr_id) @extern("igGetID_Ptr");

extern fn ImID get_id_int(int int_id) @extern("igGetID_Int");

extern fn float get_scroll_y() @extern("igGetScrollY");

extern fn float get_scroll_x() @extern("igGetScrollX");

extern fn bool color_picker4(ZString label, float[4] col, ColorEditFlags flags = 0, float* ref_col = null) @extern("igColorPicker4");

extern fn bool is_item_deactivated_after_edit() @extern("igIsItemDeactivatedAfterEdit");

extern fn bool color_picker3(ZString label, float[3] col, ColorEditFlags flags = 0) @extern("igColorPicker3");

extern fn bool drag_float_range2(ZString label, float* v_current_min, float* v_current_max, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", ZString format_max = null, SliderFlags flags = 0) @extern("igDragFloatRange2");

extern fn bool drag_float3(ZString label, float[3] v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", SliderFlags flags = 0) @extern("igDragFloat3");

extern fn bool drag_float2(ZString label, float[2] v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", SliderFlags flags = 0) @extern("igDragFloat2");

extern fn bool drag_float4(ZString label, float[4] v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", SliderFlags flags = 0) @extern("igDragFloat4");

extern fn ZString get_version() @extern("igGetVersion");

extern fn bool input_int4(ZString label, int[4] v, InputTextFlags flags = 0) @extern("igInputInt4");

extern fn bool input_int3(ZString label, int[3] v, InputTextFlags flags = 0) @extern("igInputInt3");

extern fn bool input_int2(ZString label, int[2] v, InputTextFlags flags = 0) @extern("igInputInt2");

extern fn bool begin_combo(ZString label, ZString preview_value, ComboFlags flags = 0) @extern("igBeginCombo");

extern fn bool begin_popup(ZString str_id, WindowFlags flags = 0) @extern("igBeginPopup");

extern fn void open_popup_on_item_click(ZString str_id = null, PopupFlags popup_flags = 1) @extern("igOpenPopupOnItemClick");

extern fn bool is_mouse_clicked(MouseButton button, bool repeat = false) @extern("igIsMouseClicked");

extern fn void set_cursor_pos_x(float local_x) @extern("igSetCursorPosX");

extern fn void set_cursor_pos_y(float local_y) @extern("igSetCursorPosY");

extern fn void log_text(ZString fmt, ...) @extern("igLogText");

extern fn void push_style_var_float(StyleVar idx, float val) @extern("igPushStyleVar_Float");

extern fn void push_style_var_vec2(StyleVar idx, Vec2 val) @extern("igPushStyleVar_Vec2");

extern fn DrawData* get_draw_data() @extern("igGetDrawData");

extern fn bool is_key_down(Key key) @extern("igIsKeyDown");

extern fn void begin_group() @extern("igBeginGroup");

extern fn void table_header(ZString label) @extern("igTableHeader");

extern fn void log_buttons() @extern("igLogButtons");

extern fn Viewport* get_window_viewport() @extern("igGetWindowViewport");

extern fn void log_to_file(int auto_open_depth = -1, ZString filename = null) @extern("igLogToFile");

extern fn void set_next_window_size(Vec2 size, Cond cond = 0) @extern("igSetNextWindowSize");

extern fn void set_next_window_pos(Vec2 pos, Cond cond = 0, Vec2 pivot = {0, 0}) @extern("igSetNextWindowPos");

extern fn void tree_push_str(ZString str_id) @extern("igTreePush_Str");

extern fn void tree_push_ptr(void* ptr_id) @extern("igTreePush_Ptr");

extern fn bool slider_float(ZString label, float* v, float v_min, float v_max, ZString format = "%.3f", SliderFlags flags = 0) @extern("igSliderFloat");

extern fn int get_columns_count() @extern("igGetColumnsCount");

extern fn void text_unformatted(ZString text, ZString text_end = null) @extern("igTextUnformatted");

extern fn void set_mouse_cursor(MouseCursor cursor_type) @extern("igSetMouseCursor");

extern fn bool checkbox(ZString label, bool* v) @extern("igCheckbox");

extern fn void value_bool(ZString prefix, bool b) @extern("igValue_Bool");

extern fn void value_int(ZString prefix, int v) @extern("igValue_Int");

extern fn void value_uint(ZString prefix, uint v) @extern("igValue_Uint");

extern fn void value_float(ZString prefix, float v, ZString float_format = null) @extern("igValue_Float");

extern fn bool is_window_appearing() @extern("igIsWindowAppearing");

extern fn bool is_mouse_dragging(MouseButton button, float lock_threshold = -1.0f) @extern("igIsMouseDragging");

extern fn bool drag_scalar(ZString label, DataType data_type, void* p_data, float v_speed = 1.0f, void* p_min = null, void* p_max = null, ZString format = null, SliderFlags flags = 0) @extern("igDragScalar");

extern fn void set_window_focus_nil() @extern("igSetWindowFocus_Nil");

extern fn void set_window_focus_str(ZString name) @extern("igSetWindowFocus_Str");

extern fn void style_colors_classic(Style* dst = null) @extern("igStyleColorsClassic");

extern fn DrawList* get_foreground_draw_list(Viewport* viewport = null) @extern("igGetForegroundDrawList");

extern fn void debug_text_encoding(ZString text) @extern("igDebugTextEncoding");

extern fn void igColorConvertU32ToFloat4(Vec4* pOut, ImU32 in) @extern("igColorConvertU32ToFloat4") @local;
fn Vec4 color_convert_u32_to_float4(ImU32 in) @inline {
	Vec4 pOut;
	igColorConvertU32ToFloat4(&pOut, in);
	return pOut;
}

extern fn void set_state_storage(Storage* storage) @extern("igSetStateStorage");

extern fn void text_colored(Vec4 col, ZString fmt, ...) @extern("igTextColored");

extern fn bool begin_item_tooltip() @extern("igBeginItemTooltip");

extern fn bool drag_int_range2(ZString label, int* v_current_min, int* v_current_max, float v_speed = 1.0f, int v_min = 0, int v_max = 0, ZString format = "%d", ZString format_max = null, SliderFlags flags = 0) @extern("igDragIntRange2");

extern fn void table_angled_headers_row() @extern("igTableAngledHeadersRow");

extern fn void push_text_wrap_pos(float wrap_local_pos_x = 0.0f) @extern("igPushTextWrapPos");

extern fn void set_cursor_pos(Vec2 local_pos) @extern("igSetCursorPos");

extern fn float get_scroll_max_x() @extern("igGetScrollMaxX");

extern fn float get_cursor_pos_x() @extern("igGetCursorPosX");

extern fn float get_scroll_max_y() @extern("igGetScrollMaxY");

extern fn float get_cursor_pos_y() @extern("igGetCursorPosY");

extern fn void igGetCursorStartPos(Vec2* pOut) @extern("igGetCursorStartPos") @local;
fn Vec2 get_cursor_start_pos() @inline {
	Vec2 pOut;
	igGetCursorStartPos(&pOut);
	return pOut;
}

extern fn void open_popup_str(ZString str_id, PopupFlags popup_flags = 0) @extern("igOpenPopup_Str");

extern fn void open_popup_id(ImID id, PopupFlags popup_flags = 0) @extern("igOpenPopup_ID");

extern fn void* get_draw_list_shared_data() @extern("igGetDrawListSharedData");

extern fn Viewport* get_main_viewport() @extern("igGetMainViewport");

extern fn void set_scroll_from_pos_x(float local_x, float center_x_ratio = 0.5f) @extern("igSetScrollFromPosX");

extern fn void set_scroll_from_pos_y(float local_y, float center_y_ratio = 0.5f) @extern("igSetScrollFromPosY");

extern fn void igCalcTextSize(Vec2* pOut, ZString text, ZString text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f) @extern("igCalcTextSize") @local;
fn Vec2 calc_text_size(ZString text, ZString text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f) @inline {
	Vec2 pOut;
	igCalcTextSize(&pOut, text, text_end, hide_text_after_double_hash, wrap_width);
	return pOut;
}

extern fn void end_disabled() @extern("igEndDisabled");

extern fn bool input_int(ZString label, int* v, int step = 1, int step_fast = 100, InputTextFlags flags = 0) @extern("igInputInt");

extern fn void* get_current_context() @extern("igGetCurrentContext");

extern fn bool button(ZString label, Vec2 size = {0, 0}) @extern("igButton");

extern fn float get_frame_height() @extern("igGetFrameHeight");

extern fn void end_main_menu_bar() @extern("igEndMainMenuBar");

extern fn ImID get_item_id() @extern("igGetItemID");

extern fn bool slider_scalar_n(ZString label, DataType data_type, void* p_data, int components, void* p_min, void* p_max, ZString format = null, SliderFlags flags = 0) @extern("igSliderScalarN");

extern fn void unindent(float indent_w = 0.0f) @extern("igUnindent");

extern fn bool is_popup_open(ZString str_id, PopupFlags flags = 0) @extern("igIsPopupOpen");

extern fn void set_window_size_vec2(Vec2 size, Cond cond = 0) @extern("igSetWindowSize_Vec2");

extern fn void set_window_size_str(ZString name, Vec2 size, Cond cond = 0) @extern("igSetWindowSize_Str");

extern fn bool radio_button_bool(ZString label, bool active) @extern("igRadioButton_Bool");

extern fn bool radio_button_int_ptr(ZString label, int* v, int v_button) @extern("igRadioButton_IntPtr");

extern fn bool is_item_hovered(HoveredFlags flags = 0) @extern("igIsItemHovered");

extern fn int get_key_pressed_amount(Key key, float repeat_delay, float rate) @extern("igGetKeyPressedAmount");

extern fn float get_window_width() @extern("igGetWindowWidth");

extern fn void end_combo() @extern("igEndCombo");

extern fn void igGetMouseDragDelta(Vec2* pOut, MouseButton button = 0, float lock_threshold = -1.0f) @extern("igGetMouseDragDelta") @local;
fn Vec2 get_mouse_drag_delta(MouseButton button = 0, float lock_threshold = -1.0f) @inline {
	Vec2 pOut;
	igGetMouseDragDelta(&pOut, button, lock_threshold);
	return pOut;
}

extern fn void set_scroll_here_y(float center_y_ratio = 0.5f) @extern("igSetScrollHereY");

extern fn void set_scroll_here_x(float center_x_ratio = 0.5f) @extern("igSetScrollHereX");

extern fn void igGetContentRegionAvail(Vec2* pOut) @extern("igGetContentRegionAvail") @local;
fn Vec2 get_content_region_avail() @inline {
	Vec2 pOut;
	igGetContentRegionAvail(&pOut);
	return pOut;
}

extern fn bool slider_scalar(ZString label, DataType data_type, void* p_data, void* p_min, void* p_max, ZString format = null, SliderFlags flags = 0) @extern("igSliderScalar");

extern fn void set_next_window_collapsed(bool collapsed, Cond cond = 0) @extern("igSetNextWindowCollapsed");

extern fn bool input_double(ZString label, double* v, double step = 0.0, double step_fast = 0.0, ZString format = "%.6f", InputTextFlags flags = 0) @extern("igInputDouble");

extern fn bool is_any_mouse_down() @extern("igIsAnyMouseDown");

extern fn bool begin_tab_bar(ZString str_id, TabBarFlags flags = 0) @extern("igBeginTabBar");

extern fn Style* get_style() @extern("igGetStyle");

extern fn void load_ini_settings_from_disk(ZString ini_filename) @extern("igLoadIniSettingsFromDisk");

extern fn bool drag_scalar_n(ZString label, DataType data_type, void* p_data, int components, float v_speed = 1.0f, void* p_min = null, void* p_max = null, ZString format = null, SliderFlags flags = 0) @extern("igDragScalarN");

extern fn bool drag_int4(ZString label, int[4] v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, ZString format = "%d", SliderFlags flags = 0) @extern("igDragInt4");

extern fn bool drag_int3(ZString label, int[3] v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, ZString format = "%d", SliderFlags flags = 0) @extern("igDragInt3");

extern fn bool drag_int2(ZString label, int[2] v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, ZString format = "%d", SliderFlags flags = 0) @extern("igDragInt2");

extern fn void show_debug_log_window(bool* p_open = null) @extern("igShowDebugLogWindow");

extern fn Storage* get_state_storage() @extern("igGetStateStorage");

extern fn bool is_key_pressed(Key key, bool repeat = true) @extern("igIsKeyPressed");

extern fn void end_menu_bar() @extern("igEndMenuBar");

extern fn bool is_item_active() @extern("igIsItemActive");

extern fn float get_column_width(int column_index = -1) @extern("igGetColumnWidth");

extern fn void update_platform_windows() @extern("igUpdatePlatformWindows");

extern fn bool begin_main_menu_bar() @extern("igBeginMainMenuBar");

extern fn float get_frame_height_with_spacing() @extern("igGetFrameHeightWithSpacing");

extern fn float get_font_size() @extern("igGetFontSize");

extern fn void text_wrapped(ZString fmt, ...) @extern("igTextWrapped");

extern fn void igGetCursorPos(Vec2* pOut) @extern("igGetCursorPos") @local;
fn Vec2 get_cursor_pos() @inline {
	Vec2 pOut;
	igGetCursorPos(&pOut);
	return pOut;
}

extern fn bool color_edit4(ZString label, float[4] col, ColorEditFlags flags = 0) @extern("igColorEdit4");

extern fn bool color_edit3(ZString label, float[3] col, ColorEditFlags flags = 0) @extern("igColorEdit3");

extern fn void igGetWindowSize(Vec2* pOut) @extern("igGetWindowSize") @local;
fn Vec2 get_window_size() @inline {
	Vec2 pOut;
	igGetWindowSize(&pOut);
	return pOut;
}

extern fn DrawList* get_background_draw_list(Viewport* viewport = null) @extern("igGetBackgroundDrawList");

extern fn bool begin_popup_context_window(ZString str_id = null, PopupFlags popup_flags = 1) @extern("igBeginPopupContextWindow");

extern fn bool input_text_with_hint(ZString label, ZString hint, char* buf, usz buf_size, InputTextFlags flags = 0, InputTextCallback callback = null, void* user_data = null) @extern("igInputTextWithHint");

extern fn void* mem_alloc(usz size) @extern("igMemAlloc");

extern fn bool begin_popup_context_item(ZString str_id = null, PopupFlags popup_flags = 1) @extern("igBeginPopupContextItem");

extern fn bool selectable_bool(ZString label, bool selected = false, SelectableFlags flags = 0, Vec2 size = {0, 0}) @extern("igSelectable_Bool");

extern fn bool selectable_bool_ptr(ZString label, bool* p_selected, SelectableFlags flags = 0, Vec2 size = {0, 0}) @extern("igSelectable_BoolPtr");

extern fn bool input_scalar_n(ZString label, DataType data_type, void* p_data, int components, void* p_step = null, void* p_step_fast = null, ZString format = null, InputTextFlags flags = 0) @extern("igInputScalarN");

extern fn bool begin_list_box(ZString label, Vec2 size = {0, 0}) @extern("igBeginListBox");

extern fn void set_next_item_selection_user_data(SelectionUserData selection_user_data) @extern("igSetNextItemSelectionUserData");

extern fn ZString get_style_color_name(Col idx) @extern("igGetStyleColorName");

extern fn bool begin_tab_item(ZString label, bool* p_open = null, TabItemFlags flags = 0) @extern("igBeginTabItem");

extern fn void mem_free(void* ptr) @extern("igMemFree");

extern fn void set_tooltip(ZString fmt, ...) @extern("igSetTooltip");

extern fn void set_item_tooltip(ZString fmt, ...) @extern("igSetItemTooltip");

extern fn float get_column_offset(int column_index = -1) @extern("igGetColumnOffset");

extern fn void set_window_collapsed_bool(bool collapsed, Cond cond = 0) @extern("igSetWindowCollapsed_Bool");

extern fn void set_window_collapsed_str(ZString name, bool collapsed, Cond cond = 0) @extern("igSetWindowCollapsed_Str");

extern fn void set_next_window_focus() @extern("igSetNextWindowFocus");

extern fn void debug_start_item_picker() @extern("igDebugStartItemPicker");

extern fn void destroy_context(void* ctx = null) @extern("igDestroyContext");

extern fn void show_style_editor(Style* ref = null) @extern("igShowStyleEditor");

extern fn void end_group() @extern("igEndGroup");

extern fn bool is_any_item_active() @extern("igIsAnyItemActive");

extern fn void end_drag_drop_target() @extern("igEndDragDropTarget");

extern fn void set_cursor_screen_pos(Vec2 pos) @extern("igSetCursorScreenPos");

extern fn void save_ini_settings_to_disk(ZString ini_filename) @extern("igSaveIniSettingsToDisk");

extern fn void image(TextureID user_texture_id, Vec2 image_size, Vec2 uv0 = {0, 0}, Vec2 uv1 = {1, 1}, Vec4 tint_col = {1, 1, 1, 1}, Vec4 border_col = {0, 0, 0, 0}) @extern("igImage");

extern fn void end_child() @extern("igEndChild");

extern fn bool is_window_hovered(HoveredFlags flags = 0) @extern("igIsWindowHovered");

extern fn bool input_float(ZString label, float* v, float step = 0.0f, float step_fast = 0.0f, ZString format = "%.3f", InputTextFlags flags = 0) @extern("igInputFloat");

extern fn bool begin_child_str(ZString str_id, Vec2 size = {0, 0}, ChildFlags child_flags = 0, WindowFlags window_flags = 0) @extern("igBeginChild_Str");

extern fn bool begin_child_id(ImID id, Vec2 size = {0, 0}, ChildFlags child_flags = 0, WindowFlags window_flags = 0) @extern("igBeginChild_ID");

extern fn bool slider_int(ZString label, int* v, int v_min, int v_max, ZString format = "%d", SliderFlags flags = 0) @extern("igSliderInt");

extern fn void render() @extern("igRender");

extern fn void text(ZString fmt, ...) @extern("igText");

extern fn bool v_slider_scalar(ZString label, Vec2 size, DataType data_type, void* p_data, void* p_min, void* p_max, ZString format = null, SliderFlags flags = 0) @extern("igVSliderScalar");

extern fn void reset_mouse_drag_delta(MouseButton button = 0) @extern("igResetMouseDragDelta");

extern fn bool is_mouse_released(MouseButton button) @extern("igIsMouseReleased");

extern fn void set_next_window_class(WindowClass* window_class) @extern("igSetNextWindowClass");

extern fn void style_colors_dark(Style* dst = null) @extern("igStyleColorsDark");

extern fn void set_next_item_width(float item_width) @extern("igSetNextItemWidth");

extern fn void igGetMousePosOnOpeningCurrentPopup(Vec2* pOut) @extern("igGetMousePosOnOpeningCurrentPopup") @local;
fn Vec2 get_mouse_pos_on_opening_current_popup() @inline {
	Vec2 pOut;
	igGetMousePosOnOpeningCurrentPopup(&pOut);
	return pOut;
}

extern fn bool is_item_edited() @extern("igIsItemEdited");

extern fn void set_clipboard_text(ZString text) @extern("igSetClipboardText");

extern fn bool begin_menu(ZString label, bool enabled = true) @extern("igBeginMenu");

extern fn void close_current_popup() @extern("igCloseCurrentPopup");

extern fn void destroy_platform_windows() @extern("igDestroyPlatformWindows");

extern fn void set_keyboard_focus_here(int offset = 0) @extern("igSetKeyboardFocusHere");

extern fn void push_style_color_u32(Col idx, ImU32 col) @extern("igPushStyleColor_U32");

extern fn void push_style_color_vec4(Col idx, Vec4 col) @extern("igPushStyleColor_Vec4");

extern fn void set_next_window_scroll(Vec2 scroll) @extern("igSetNextWindowScroll");

extern fn bool set_drag_drop_payload(ZString type, void* data, usz sz, Cond cond = 0) @extern("igSetDragDropPayload");

extern fn void pop_id() @extern("igPopID");

extern fn void igGetCursorScreenPos(Vec2* pOut) @extern("igGetCursorScreenPos") @local;
fn Vec2 get_cursor_screen_pos() @inline {
	Vec2 pOut;
	igGetCursorScreenPos(&pOut);
	return pOut;
}

extern fn bool collapsing_header_tree_node_flags(ZString label, TreeNodeFlags flags = 0) @extern("igCollapsingHeader_TreeNodeFlags");

extern fn bool collapsing_header_bool_ptr(ZString label, bool* p_visible, TreeNodeFlags flags = 0) @extern("igCollapsingHeader_BoolPtr");

extern fn void end_popup() @extern("igEndPopup");

extern fn void debug_log(ZString fmt, ...) @extern("igDebugLog");

extern fn bool text_link(ZString label) @extern("igTextLink");

extern fn bool drag_int(ZString label, int* v, float v_speed = 1.0f, int v_min = 0, int v_max = 0, ZString format = "%d", SliderFlags flags = 0) @extern("igDragInt");

extern fn void next_column() @extern("igNextColumn");

extern fn bool v_slider_int(ZString label, Vec2 size, int* v, int v_min, int v_max, ZString format = "%d", SliderFlags flags = 0) @extern("igVSliderInt");

extern fn void push_clip_rect(Vec2 clip_rect_min, Vec2 clip_rect_max, bool intersect_with_current_clip_rect) @extern("igPushClipRect");

extern fn void log_to_tty(int auto_open_depth = -1) @extern("igLogToTTY");

extern fn bool begin_tooltip() @extern("igBeginTooltip");

extern fn void new_frame() @extern("igNewFrame");

extern fn bool combo_str_arr(ZString label, int* current_item, ZString[] items, int items_count, int popup_max_height_in_items = -1) @extern("igCombo_Str_arr");

extern fn bool combo_str(ZString label, int* current_item, ZString items_separated_by_zeros, int popup_max_height_in_items = -1) @extern("igCombo_Str");

extern fn bool combo_fn_str_ptr(ZString label, int* current_item, Combo_Getter_Func getter, void* user_data, int items_count, int popup_max_height_in_items = -1) @extern("igCombo_FnStrPtr");
def Combo_Getter_Func = fn ZString(void* user_data, int idx);

extern fn void table_headers_row() @extern("igTableHeadersRow");

extern fn float get_window_height() @extern("igGetWindowHeight");

extern fn void show_user_guide() @extern("igShowUserGuide");

extern fn void set_item_default_focus() @extern("igSetItemDefaultFocus");

extern fn void pop_item_flag() @extern("igPopItemFlag");

extern fn void indent(float indent_w = 0.0f) @extern("igIndent");

extern fn bool is_item_visible() @extern("igIsItemVisible");

extern fn ZString get_clipboard_text() @extern("igGetClipboardText");

extern fn void end_tooltip() @extern("igEndTooltip");

extern fn void* create_context(FontAtlas* shared_font_atlas = null) @extern("igCreateContext");

extern fn int table_get_row_index() @extern("igTableGetRowIndex");

extern fn void separator_text(ZString label) @extern("igSeparatorText");

extern fn void set_next_item_shortcut(KeyChord key_chord, InputFlags flags = 0) @extern("igSetNextItemShortcut");

extern fn void progress_bar(float fraction, Vec2 size_arg = {-FLT_MIN, 0}, ZString overlay = null) @extern("igProgressBar");

extern fn void pop_style_color(int count = 1) @extern("igPopStyleColor");

extern fn void columns(int count = 1, ZString id = null, bool border = true) @extern("igColumns");

extern fn void tree_pop() @extern("igTreePop");

extern fn int get_frame_count() @extern("igGetFrameCount");

extern fn void align_text_to_frame_padding() @extern("igAlignTextToFramePadding");

extern fn void get_allocator_functions(MemAllocFunc* p_alloc_func, MemFreeFunc* p_free_func, void** p_user_data) @extern("igGetAllocatorFunctions");

extern fn void log_to_clipboard(int auto_open_depth = -1) @extern("igLogToClipboard");

extern fn bool is_item_activated() @extern("igIsItemActivated");

extern fn void end_drag_drop_source() @extern("igEndDragDropSource");

extern fn bool begin_popup_context_void(ZString str_id = null, PopupFlags popup_flags = 1) @extern("igBeginPopupContextVoid");

extern fn bool color_button(ZString desc_id, Vec4 col, ColorEditFlags flags = 0, Vec2 size = {0, 0}) @extern("igColorButton");

extern fn void plot_histogram_float_ptr(ZString label, float* values, int values_count, int values_offset = 0, ZString overlay_text = null, float scale_min = float.max, float scale_max = float.max, Vec2 graph_size = {0, 0}, int stride = float.sizeof) @extern("igPlotHistogram_FloatPtr");

extern fn void plot_histogram_fn_float_ptr(ZString label, PlotHistogram_ValuesGetter_Func values_getter, void* data, int values_count, int values_offset = 0, ZString overlay_text = null, float scale_min = float.max, float scale_max = float.max, Vec2 graph_size = {0, 0}) @extern("igPlotHistogram_FnFloatPtr");
def PlotHistogram_ValuesGetter_Func = fn float(void* data, int idx);

extern fn bool is_window_collapsed() @extern("igIsWindowCollapsed");

extern fn void debug_flash_style_color(Col idx) @extern("igDebugFlashStyleColor");

extern fn bool table_next_column() @extern("igTableNextColumn");

extern fn void set_column_width(int column_index, float width) @extern("igSetColumnWidth");

extern fn ImID dock_space_over_viewport(ImID dockspace_id = 0, Viewport* viewport = null, DockNodeFlags flags = 0, WindowClass* window_class = null) @extern("igDockSpaceOverViewport");

extern fn void label_text(ZString label, ZString fmt, ...) @extern("igLabelText");

extern fn float calc_item_width() @extern("igCalcItemWidth");

extern fn bool is_item_clicked(MouseButton mouse_button = 0) @extern("igIsItemClicked");

extern fn void table_next_row(TableRowFlags row_flags = 0, float min_row_height = 0.0f) @extern("igTableNextRow");

extern fn PlatformIO* get_platform_io() @extern("igGetPlatformIO");

extern fn bool slider_angle(ZString label, float* v_rad, float v_degrees_min = -360.0f, float v_degrees_max = +360.0f, ZString format = "%.0f deg", SliderFlags flags = 0) @extern("igSliderAngle");

extern fn void log_finish() @extern("igLogFinish");

extern fn bool input_scalar(ZString label, DataType data_type, void* p_data, void* p_step = null, void* p_step_fast = null, ZString format = null, InputTextFlags flags = 0) @extern("igInputScalar");

extern fn void color_convert_rg_bto_hsv(float r, float g, float b, float* out_h, float* out_s, float* out_v) @extern("igColorConvertRGBtoHSV");

extern fn bool small_button(ZString label) @extern("igSmallButton");

extern fn void igGetItemRectSize(Vec2* pOut) @extern("igGetItemRectSize") @local;
fn Vec2 get_item_rect_size() @inline {
	Vec2 pOut;
	igGetItemRectSize(&pOut);
	return pOut;
}

extern fn void table_set_column_enabled(int column_n, bool v) @extern("igTableSetColumnEnabled");

extern fn int table_get_column_count() @extern("igTableGetColumnCount");

extern fn bool v_slider_float(ZString label, Vec2 size, float* v, float v_min, float v_max, ZString format = "%.3f", SliderFlags flags = 0) @extern("igVSliderFloat");

extern fn void pop_clip_rect() @extern("igPopClipRect");

extern fn bool begin_popup_modal(ZString name, bool* p_open = null, WindowFlags flags = 0) @extern("igBeginPopupModal");

extern fn Payload* get_drag_drop_payload() @extern("igGetDragDropPayload");

extern fn void text_disabled(ZString fmt, ...) @extern("igTextDisabled");

extern fn MouseCursor get_mouse_cursor() @extern("igGetMouseCursor");

extern fn TableColumnFlags table_get_column_flags(int column_n = -1) @extern("igTableGetColumnFlags");

extern fn void same_line(float offset_from_start_x = 0.0f, float spacing = -1.0f) @extern("igSameLine");

extern fn bool is_mouse_hovering_rect(Vec2 r_min, Vec2 r_max, bool clip = true) @extern("igIsMouseHoveringRect");

extern fn void set_next_window_dock_id(ImID dock_id, Cond cond = 0) @extern("igSetNextWindowDockID");

extern fn void set_current_context(void* ctx) @extern("igSetCurrentContext");

extern fn void push_font(Font* font) @extern("igPushFont");

extern fn void set_next_window_content_size(Vec2 size) @extern("igSetNextWindowContentSize");

extern fn void pop_style_var(int count = 1) @extern("igPopStyleVar");

extern fn void new_line() @extern("igNewLine");

extern fn bool debug_check_version_and_data_layout(ZString version_str, usz sz_io, usz sz_style, usz sz_vec2, usz sz_vec4, usz sz_drawvert, usz sz_drawidx) @extern("igDebugCheckVersionAndDataLayout");

extern fn ImU32 color_convert_float4_to_u32(Vec4 in) @extern("igColorConvertFloat4ToU32");

extern fn bool menu_item_bool(ZString label, ZString shortcut = null, bool selected = false, bool enabled = true) @extern("igMenuItem_Bool");

extern fn bool menu_item_bool_ptr(ZString label, ZString shortcut, bool* p_selected, bool enabled = true) @extern("igMenuItem_BoolPtr");

extern fn void set_window_font_scale(float scale) @extern("igSetWindowFontScale");

extern fn void pop_text_wrap_pos() @extern("igPopTextWrapPos");

extern fn void set_next_item_open(bool is_open, Cond cond = 0) @extern("igSetNextItemOpen");

extern fn int get_column_index() @extern("igGetColumnIndex");

extern fn void bullet() @extern("igBullet");

extern fn void igGetWindowPos(Vec2* pOut) @extern("igGetWindowPos") @local;
fn Vec2 get_window_pos() @inline {
	Vec2 pOut;
	igGetWindowPos(&pOut);
	return pOut;
}

extern fn void set_next_window_bg_alpha(float alpha) @extern("igSetNextWindowBgAlpha");

extern fn void imColorHsv(Color* pOut, float h, float s, float v, float a = 1.0f) @extern("ImColor_HSV") @local;
fn Color color_hsv(float h, float s, float v, float a = 1.0f) @inline {
	Color pOut;
	imColorHsv(&pOut, h, s, v, a);
	return pOut;
}

extern fn Color* new_color() @extern("ImColor_ImColor_Nil");

extern fn Color* new_color_float(float r, float g, float b, float a = 1.0f) @extern("ImColor_ImColor_Float");

extern fn Color* new_color_vec4(Vec4 col) @extern("ImColor_ImColor_Vec4");

extern fn Color* new_color_int(int r, int g, int b, int a = 255) @extern("ImColor_ImColor_Int");

extern fn Color* new_color_u32(ImU32 rgba) @extern("ImColor_ImColor_U32");

extern fn void Color.set_hsv(Color* self, float h, float s, float v, float a = 1.0f) @extern("ImColor_SetHSV");

extern fn void Color.destroy(Color* self) @extern("ImColor_destroy");

extern fn TextureID DrawCmd.get_tex_id(DrawCmd* self) @extern("ImDrawCmd_GetTexID");

extern fn DrawCmd* new_draw_cmd() @extern("ImDrawCmd_ImDrawCmd");

extern fn void DrawCmd.destroy(DrawCmd* self) @extern("ImDrawCmd_destroy");

extern fn void DrawData.add_draw_list(DrawData* self, DrawList* draw_list) @extern("ImDrawData_AddDrawList");

extern fn void DrawData.clear(DrawData* self) @extern("ImDrawData_Clear");

extern fn void DrawData.de_index_all_buffers(DrawData* self) @extern("ImDrawData_DeIndexAllBuffers");

extern fn DrawData* new_draw_data() @extern("ImDrawData_ImDrawData");

extern fn void DrawData.scale_clip_rects(DrawData* self, Vec2 fb_scale) @extern("ImDrawData_ScaleClipRects");

extern fn void DrawData.destroy(DrawData* self) @extern("ImDrawData_destroy");

extern fn void DrawList.add_concave_poly_filled(DrawList* self, Vec2* points, int num_points, ImU32 col) @extern("ImDrawList_AddConcavePolyFilled");

extern fn void DrawListSplitter.clear(DrawListSplitter* self) @extern("ImDrawListSplitter_Clear");

extern fn void DrawListSplitter.clear_free_memory(DrawListSplitter* self) @extern("ImDrawListSplitter_ClearFreeMemory");

extern fn DrawListSplitter* new_draw_list_splitter() @extern("ImDrawListSplitter_ImDrawListSplitter");

extern fn void DrawListSplitter.merge(DrawListSplitter* self, DrawList* draw_list) @extern("ImDrawListSplitter_Merge");

extern fn void DrawListSplitter.set_current_channel(DrawListSplitter* self, DrawList* draw_list, int channel_idx) @extern("ImDrawListSplitter_SetCurrentChannel");

extern fn void DrawListSplitter.split(DrawListSplitter* self, DrawList* draw_list, int count) @extern("ImDrawListSplitter_Split");

extern fn void DrawListSplitter.destroy(DrawListSplitter* self) @extern("ImDrawListSplitter_destroy");

extern fn void DrawList.add_bezier_cubic(DrawList* self, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, ImU32 col, float thickness, int num_segments = 0) @extern("ImDrawList_AddBezierCubic");

extern fn void DrawList.add_bezier_quadratic(DrawList* self, Vec2 p1, Vec2 p2, Vec2 p3, ImU32 col, float thickness, int num_segments = 0) @extern("ImDrawList_AddBezierQuadratic");

extern fn void DrawList.add_callback(DrawList* self, DrawCallback callback, void* callback_data) @extern("ImDrawList_AddCallback");

extern fn void DrawList.add_circle(DrawList* self, Vec2 center, float radius, ImU32 col, int num_segments = 0, float thickness = 1.0f) @extern("ImDrawList_AddCircle");

extern fn void DrawList.add_circle_filled(DrawList* self, Vec2 center, float radius, ImU32 col, int num_segments = 0) @extern("ImDrawList_AddCircleFilled");

extern fn void DrawList.add_convex_poly_filled(DrawList* self, Vec2* points, int num_points, ImU32 col) @extern("ImDrawList_AddConvexPolyFilled");

extern fn void DrawList.add_draw_cmd(DrawList* self) @extern("ImDrawList_AddDrawCmd");

extern fn void DrawList.add_ellipse(DrawList* self, Vec2 center, Vec2 radius, ImU32 col, float rot = 0.0f, int num_segments = 0, float thickness = 1.0f) @extern("ImDrawList_AddEllipse");

extern fn void DrawList.add_ellipse_filled(DrawList* self, Vec2 center, Vec2 radius, ImU32 col, float rot = 0.0f, int num_segments = 0) @extern("ImDrawList_AddEllipseFilled");

extern fn void DrawList.add_image(DrawList* self, TextureID user_texture_id, Vec2 p_min, Vec2 p_max, Vec2 uv_min = {0, 0}, Vec2 uv_max = {1, 1}, ImU32 col = 4294967295) @extern("ImDrawList_AddImage");

extern fn void DrawList.add_image_quad(DrawList* self, TextureID user_texture_id, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 uv1 = {0, 0}, Vec2 uv2 = {1, 0}, Vec2 uv3 = {1, 1}, Vec2 uv4 = {0, 1}, ImU32 col = 4294967295) @extern("ImDrawList_AddImageQuad");

extern fn void DrawList.add_image_rounded(DrawList* self, TextureID user_texture_id, Vec2 p_min, Vec2 p_max, Vec2 uv_min, Vec2 uv_max, ImU32 col, float rounding, DrawFlags flags = 0) @extern("ImDrawList_AddImageRounded");

extern fn void DrawList.add_line(DrawList* self, Vec2 p1, Vec2 p2, ImU32 col, float thickness = 1.0f) @extern("ImDrawList_AddLine");

extern fn void DrawList.add_ngon(DrawList* self, Vec2 center, float radius, ImU32 col, int num_segments, float thickness = 1.0f) @extern("ImDrawList_AddNgon");

extern fn void DrawList.add_ngon_filled(DrawList* self, Vec2 center, float radius, ImU32 col, int num_segments) @extern("ImDrawList_AddNgonFilled");

extern fn void DrawList.add_polyline(DrawList* self, Vec2* points, int num_points, ImU32 col, DrawFlags flags, float thickness) @extern("ImDrawList_AddPolyline");

extern fn void DrawList.add_quad(DrawList* self, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, ImU32 col, float thickness = 1.0f) @extern("ImDrawList_AddQuad");

extern fn void DrawList.add_quad_filled(DrawList* self, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, ImU32 col) @extern("ImDrawList_AddQuadFilled");

extern fn void DrawList.add_rect(DrawList* self, Vec2 p_min, Vec2 p_max, ImU32 col, float rounding = 0.0f, DrawFlags flags = 0, float thickness = 1.0f) @extern("ImDrawList_AddRect");

extern fn void DrawList.add_rect_filled(DrawList* self, Vec2 p_min, Vec2 p_max, ImU32 col, float rounding = 0.0f, DrawFlags flags = 0) @extern("ImDrawList_AddRectFilled");

extern fn void DrawList.add_rect_filled_multi_color(DrawList* self, Vec2 p_min, Vec2 p_max, ImU32 col_upr_left, ImU32 col_upr_right, ImU32 col_bot_right, ImU32 col_bot_left) @extern("ImDrawList_AddRectFilledMultiColor");

extern fn void DrawList.add_text_vec2(DrawList* self, Vec2 pos, ImU32 col, ZString text_begin, ZString text_end = null) @extern("ImDrawList_AddText_Vec2");

extern fn void DrawList.add_text_font_ptr(DrawList* self, Font* font, float font_size, Vec2 pos, ImU32 col, ZString text_begin, ZString text_end = null, float wrap_width = 0.0f, Vec4* cpu_fine_clip_rect = null) @extern("ImDrawList_AddText_FontPtr");

extern fn void DrawList.add_triangle(DrawList* self, Vec2 p1, Vec2 p2, Vec2 p3, ImU32 col, float thickness = 1.0f) @extern("ImDrawList_AddTriangle");

extern fn void DrawList.add_triangle_filled(DrawList* self, Vec2 p1, Vec2 p2, Vec2 p3, ImU32 col) @extern("ImDrawList_AddTriangleFilled");

extern fn void DrawList.channels_merge(DrawList* self) @extern("ImDrawList_ChannelsMerge");

extern fn void DrawList.channels_set_current(DrawList* self, int n) @extern("ImDrawList_ChannelsSetCurrent");

extern fn void DrawList.channels_split(DrawList* self, int count) @extern("ImDrawList_ChannelsSplit");

extern fn DrawList* DrawList.clone_output(DrawList* self) @extern("ImDrawList_CloneOutput");

extern fn void imDrawListGetClipRectMax(Vec2* pOut, DrawList* self) @extern("ImDrawList_GetClipRectMax") @local;
fn Vec2 DrawList.get_clip_rect_max(DrawList* self) @inline {
	Vec2 pOut;
	imDrawListGetClipRectMax(&pOut, self);
	return pOut;
}

extern fn void imDrawListGetClipRectMin(Vec2* pOut, DrawList* self) @extern("ImDrawList_GetClipRectMin") @local;
fn Vec2 DrawList.get_clip_rect_min(DrawList* self) @inline {
	Vec2 pOut;
	imDrawListGetClipRectMin(&pOut, self);
	return pOut;
}

extern fn DrawList* new_draw_list(void* shared_data) @extern("ImDrawList_ImDrawList");

extern fn void DrawList.path_arc_to(DrawList* self, Vec2 center, float radius, float a_min, float a_max, int num_segments = 0) @extern("ImDrawList_PathArcTo");

extern fn void DrawList.path_arc_to_fast(DrawList* self, Vec2 center, float radius, int a_min_of_12, int a_max_of_12) @extern("ImDrawList_PathArcToFast");

extern fn void DrawList.path_bezier_cubic_curve_to(DrawList* self, Vec2 p2, Vec2 p3, Vec2 p4, int num_segments = 0) @extern("ImDrawList_PathBezierCubicCurveTo");

extern fn void DrawList.path_bezier_quadratic_curve_to(DrawList* self, Vec2 p2, Vec2 p3, int num_segments = 0) @extern("ImDrawList_PathBezierQuadraticCurveTo");

extern fn void DrawList.path_clear(DrawList* self) @extern("ImDrawList_PathClear");

extern fn void DrawList.path_elliptical_arc_to(DrawList* self, Vec2 center, Vec2 radius, float rot, float a_min, float a_max, int num_segments = 0) @extern("ImDrawList_PathEllipticalArcTo");

extern fn void DrawList.path_fill_concave(DrawList* self, ImU32 col) @extern("ImDrawList_PathFillConcave");

extern fn void DrawList.path_fill_convex(DrawList* self, ImU32 col) @extern("ImDrawList_PathFillConvex");

extern fn void DrawList.path_line_to(DrawList* self, Vec2 pos) @extern("ImDrawList_PathLineTo");

extern fn void DrawList.path_line_to_merge_duplicate(DrawList* self, Vec2 pos) @extern("ImDrawList_PathLineToMergeDuplicate");

extern fn void DrawList.path_rect(DrawList* self, Vec2 rect_min, Vec2 rect_max, float rounding = 0.0f, DrawFlags flags = 0) @extern("ImDrawList_PathRect");

extern fn void DrawList.path_stroke(DrawList* self, ImU32 col, DrawFlags flags = 0, float thickness = 1.0f) @extern("ImDrawList_PathStroke");

extern fn void DrawList.pop_clip_rect(DrawList* self) @extern("ImDrawList_PopClipRect");

extern fn void DrawList.pop_texture_id(DrawList* self) @extern("ImDrawList_PopTextureID");

extern fn void DrawList.prim_quad_uv(DrawList* self, Vec2 a, Vec2 b, Vec2 c, Vec2 d, Vec2 uv_a, Vec2 uv_b, Vec2 uv_c, Vec2 uv_d, ImU32 col) @extern("ImDrawList_PrimQuadUV");

extern fn void DrawList.prim_rect(DrawList* self, Vec2 a, Vec2 b, ImU32 col) @extern("ImDrawList_PrimRect");

extern fn void DrawList.prim_rect_uv(DrawList* self, Vec2 a, Vec2 b, Vec2 uv_a, Vec2 uv_b, ImU32 col) @extern("ImDrawList_PrimRectUV");

extern fn void DrawList.prim_reserve(DrawList* self, int idx_count, int vtx_count) @extern("ImDrawList_PrimReserve");

extern fn void DrawList.prim_unreserve(DrawList* self, int idx_count, int vtx_count) @extern("ImDrawList_PrimUnreserve");

extern fn void DrawList.prim_vtx(DrawList* self, Vec2 pos, Vec2 uv, ImU32 col) @extern("ImDrawList_PrimVtx");

extern fn void DrawList.prim_write_idx(DrawList* self, DrawIdx idx) @extern("ImDrawList_PrimWriteIdx");

extern fn void DrawList.prim_write_vtx(DrawList* self, Vec2 pos, Vec2 uv, ImU32 col) @extern("ImDrawList_PrimWriteVtx");

extern fn void DrawList.push_clip_rect(DrawList* self, Vec2 clip_rect_min, Vec2 clip_rect_max, bool intersect_with_current_clip_rect = false) @extern("ImDrawList_PushClipRect");

extern fn void DrawList.push_clip_rect_full_screen(DrawList* self) @extern("ImDrawList_PushClipRectFullScreen");

extern fn void DrawList.push_texture_id(DrawList* self, TextureID texture_id) @extern("ImDrawList_PushTextureID");

extern fn int DrawList.calc_circle_auto_segment_count(DrawList* self, float radius) @extern("ImDrawList__CalcCircleAutoSegmentCount");

extern fn void DrawList.clear_free_memory(DrawList* self) @extern("ImDrawList__ClearFreeMemory");

extern fn void DrawList.on_changed_clip_rect(DrawList* self) @extern("ImDrawList__OnChangedClipRect");

extern fn void DrawList.on_changed_texture_id(DrawList* self) @extern("ImDrawList__OnChangedTextureID");

extern fn void DrawList.on_changed_vtx_offset(DrawList* self) @extern("ImDrawList__OnChangedVtxOffset");

extern fn void DrawList.path_arc_to_fast_ex(DrawList* self, Vec2 center, float radius, int a_min_sample, int a_max_sample, int a_step) @extern("ImDrawList__PathArcToFastEx");

extern fn void DrawList.path_arc_to_n(DrawList* self, Vec2 center, float radius, float a_min, float a_max, int num_segments) @extern("ImDrawList__PathArcToN");

extern fn void DrawList.pop_unused_draw_cmd(DrawList* self) @extern("ImDrawList__PopUnusedDrawCmd");

extern fn void DrawList.reset_for_new_frame(DrawList* self) @extern("ImDrawList__ResetForNewFrame");

extern fn void DrawList.try_merge_draw_cmds(DrawList* self) @extern("ImDrawList__TryMergeDrawCmds");

extern fn void DrawList.destroy(DrawList* self) @extern("ImDrawList_destroy");

extern fn FontAtlasCustomRect* new_font_atlas_custom_rect() @extern("ImFontAtlasCustomRect_ImFontAtlasCustomRect");

extern fn bool FontAtlasCustomRect.is_packed(FontAtlasCustomRect* self) @extern("ImFontAtlasCustomRect_IsPacked");

extern fn void FontAtlasCustomRect.destroy(FontAtlasCustomRect* self) @extern("ImFontAtlasCustomRect_destroy");

extern fn int FontAtlas.add_custom_rect_font_glyph(FontAtlas* self, Font* font, Wchar id, int width, int height, float advance_x, Vec2 offset = {0, 0}) @extern("ImFontAtlas_AddCustomRectFontGlyph");

extern fn int FontAtlas.add_custom_rect_regular(FontAtlas* self, int width, int height) @extern("ImFontAtlas_AddCustomRectRegular");

extern fn Font* FontAtlas.add_font(FontAtlas* self, FontConfig* font_cfg) @extern("ImFontAtlas_AddFont");

extern fn Font* FontAtlas.add_font_default(FontAtlas* self, FontConfig* font_cfg = null) @extern("ImFontAtlas_AddFontDefault");

extern fn Font* FontAtlas.add_font_from_file_ttf(FontAtlas* self, ZString filename, float size_pixels, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) @extern("ImFontAtlas_AddFontFromFileTTF");

extern fn Font* FontAtlas.add_font_from_memory_compressed_base85_ttf(FontAtlas* self, ZString compressed_font_data_base85, float size_pixels, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) @extern("ImFontAtlas_AddFontFromMemoryCompressedBase85TTF");

extern fn void PlatformIO.destroy(PlatformIO* self) @extern("ImGuiPlatformIO_destroy");

extern fn Font* FontAtlas.add_font_from_memory_compressed_ttf(FontAtlas* self, void* compressed_font_data, int compressed_font_data_size, float size_pixels, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) @extern("ImFontAtlas_AddFontFromMemoryCompressedTTF");

extern fn Font* FontAtlas.add_font_from_memory_ttf(FontAtlas* self, void* font_data, int font_data_size, float size_pixels, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) @extern("ImFontAtlas_AddFontFromMemoryTTF");

extern fn bool FontAtlas.build(FontAtlas* self) @extern("ImFontAtlas_Build");

extern fn void FontAtlas.calc_custom_rect_uv(FontAtlas* self, FontAtlasCustomRect* rect, Vec2* out_uv_min, Vec2* out_uv_max) @extern("ImFontAtlas_CalcCustomRectUV");

extern fn void FontAtlas.clear(FontAtlas* self) @extern("ImFontAtlas_Clear");

extern fn void FontAtlas.clear_fonts(FontAtlas* self) @extern("ImFontAtlas_ClearFonts");

extern fn void FontAtlas.clear_input_data(FontAtlas* self) @extern("ImFontAtlas_ClearInputData");

extern fn void FontAtlas.clear_tex_data(FontAtlas* self) @extern("ImFontAtlas_ClearTexData");

extern fn FontAtlasCustomRect* FontAtlas.get_custom_rect_by_index(FontAtlas* self, int index) @extern("ImFontAtlas_GetCustomRectByIndex");

extern fn Wchar* FontAtlas.get_glyph_ranges_chinese_full(FontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesChineseFull");

extern fn Wchar* FontAtlas.get_glyph_ranges_chinese_simplified_common(FontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon");

extern fn Wchar* FontAtlas.get_glyph_ranges_cyrillic(FontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesCyrillic");

extern fn Wchar* FontAtlas.get_glyph_ranges_default(FontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesDefault");

extern fn Wchar* FontAtlas.get_glyph_ranges_greek(FontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesGreek");

extern fn Wchar* FontAtlas.get_glyph_ranges_japanese(FontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesJapanese");

extern fn Wchar* FontAtlas.get_glyph_ranges_korean(FontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesKorean");

extern fn Wchar* FontAtlas.get_glyph_ranges_thai(FontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesThai");

extern fn Wchar* FontAtlas.get_glyph_ranges_vietnamese(FontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesVietnamese");

extern fn bool FontAtlas.get_mouse_cursor_tex_data(FontAtlas* self, MouseCursor cursor, Vec2* out_offset, Vec2* out_size, Vec2[2] out_uv_border, Vec2[2] out_uv_fill) @extern("ImFontAtlas_GetMouseCursorTexData");

extern fn void FontAtlas.get_tex_data_as_alpha8(FontAtlas* self, char** out_pixels, int* out_width, int* out_height, int* out_bytes_per_pixel = null) @extern("ImFontAtlas_GetTexDataAsAlpha8");

extern fn void FontAtlas.get_tex_data_as_rgba32(FontAtlas* self, char** out_pixels, int* out_width, int* out_height, int* out_bytes_per_pixel = null) @extern("ImFontAtlas_GetTexDataAsRGBA32");

extern fn FontAtlas* new_font_atlas() @extern("ImFontAtlas_ImFontAtlas");

extern fn bool FontAtlas.is_built(FontAtlas* self) @extern("ImFontAtlas_IsBuilt");

extern fn void FontAtlas.set_tex_id(FontAtlas* self, TextureID id) @extern("ImFontAtlas_SetTexID");

extern fn void FontAtlas.destroy(FontAtlas* self) @extern("ImFontAtlas_destroy");

extern fn FontConfig* new_font_config() @extern("ImFontConfig_ImFontConfig");

extern fn void FontConfig.destroy(FontConfig* self) @extern("ImFontConfig_destroy");

extern fn void FontGlyphRangesBuilder.add_char(FontGlyphRangesBuilder* self, Wchar c) @extern("ImFontGlyphRangesBuilder_AddChar");

extern fn void FontGlyphRangesBuilder.add_ranges(FontGlyphRangesBuilder* self, Wchar* ranges) @extern("ImFontGlyphRangesBuilder_AddRanges");

extern fn void FontGlyphRangesBuilder.add_text(FontGlyphRangesBuilder* self, ZString text, ZString text_end = null) @extern("ImFontGlyphRangesBuilder_AddText");

extern fn void FontGlyphRangesBuilder.build_ranges(FontGlyphRangesBuilder* self, vector::Vector(<Wchar>)* out_ranges) @extern("ImFontGlyphRangesBuilder_BuildRanges");

extern fn void FontGlyphRangesBuilder.clear(FontGlyphRangesBuilder* self) @extern("ImFontGlyphRangesBuilder_Clear");

extern fn bool FontGlyphRangesBuilder.get_bit(FontGlyphRangesBuilder* self, usz n) @extern("ImFontGlyphRangesBuilder_GetBit");

extern fn FontGlyphRangesBuilder* new_font_glyph_ranges_builder() @extern("ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder");

extern fn void FontGlyphRangesBuilder.set_bit(FontGlyphRangesBuilder* self, usz n) @extern("ImFontGlyphRangesBuilder_SetBit");

extern fn void FontGlyphRangesBuilder.destroy(FontGlyphRangesBuilder* self) @extern("ImFontGlyphRangesBuilder_destroy");

extern fn void Font.add_glyph(Font* self, FontConfig* src_cfg, Wchar c, float x0, float y0, float x1, float y1, float u0, float v0, float u1, float v1, float advance_x) @extern("ImFont_AddGlyph");

extern fn void Font.add_remap_char(Font* self, Wchar dst, Wchar src, bool overwrite_dst = true) @extern("ImFont_AddRemapChar");

extern fn void Font.build_lookup_table(Font* self) @extern("ImFont_BuildLookupTable");

extern fn void imFontCalcTextSizeA(Vec2* pOut, Font* self, float size, float max_width, float wrap_width, ZString text_begin, ZString text_end = null, ZString remaining = null) @extern("ImFont_CalcTextSizeA") @local;
fn Vec2 Font.calc_text_size_a(Font* self, float size, float max_width, float wrap_width, ZString text_begin, ZString text_end = null, ZString remaining = null) @inline {
	Vec2 pOut;
	imFontCalcTextSizeA(&pOut, self, size, max_width, wrap_width, text_begin, text_end, remaining);
	return pOut;
}

extern fn ZString Font.calc_word_wrap_position_a(Font* self, float scale, ZString text, ZString text_end, float wrap_width) @extern("ImFont_CalcWordWrapPositionA");

extern fn void Font.clear_output_data(Font* self) @extern("ImFont_ClearOutputData");

extern fn FontGlyph* Font.find_glyph(Font* self, Wchar c) @extern("ImFont_FindGlyph");

extern fn FontGlyph* Font.find_glyph_no_fallback(Font* self, Wchar c) @extern("ImFont_FindGlyphNoFallback");

extern fn float Font.get_char_advance(Font* self, Wchar c) @extern("ImFont_GetCharAdvance");

extern fn ZString Font.get_debug_name(Font* self) @extern("ImFont_GetDebugName");

extern fn void Font.grow_index(Font* self, int new_size) @extern("ImFont_GrowIndex");

extern fn Font* new_font() @extern("ImFont_ImFont");

extern fn bool Font.is_glyph_range_unused(Font* self, uint c_begin, uint c_last) @extern("ImFont_IsGlyphRangeUnused");

extern fn bool Font.is_loaded(Font* self) @extern("ImFont_IsLoaded");

extern fn void Font.render_char(Font* self, DrawList* draw_list, float size, Vec2 pos, ImU32 col, Wchar c) @extern("ImFont_RenderChar");

extern fn void Font.render_text(Font* self, DrawList* draw_list, float size, Vec2 pos, ImU32 col, Vec4 clip_rect, ZString text_begin, ZString text_end, float wrap_width = 0.0f, bool cpu_fine_clip = false) @extern("ImFont_RenderText");

extern fn void Font.set_glyph_visible(Font* self, Wchar c, bool visible) @extern("ImFont_SetGlyphVisible");

extern fn void Font.destroy(Font* self) @extern("ImFont_destroy");

extern fn void ImIO.add_focus_event(ImIO* self, bool focused) @extern("ImGuiIO_AddFocusEvent");

extern fn void ImIO.add_input_character(ImIO* self, uint c) @extern("ImGuiIO_AddInputCharacter");

extern fn void ImIO.add_input_character_utf16(ImIO* self, Wchar16 c) @extern("ImGuiIO_AddInputCharacterUTF16");

extern fn void ImIO.add_input_characters_utf8(ImIO* self, ZString str) @extern("ImGuiIO_AddInputCharactersUTF8");

extern fn void ImIO.add_key_analog_event(ImIO* self, Key key, bool down, float v) @extern("ImGuiIO_AddKeyAnalogEvent");

extern fn void ImIO.add_key_event(ImIO* self, Key key, bool down) @extern("ImGuiIO_AddKeyEvent");

extern fn void ImIO.add_mouse_button_event(ImIO* self, int button, bool down) @extern("ImGuiIO_AddMouseButtonEvent");

extern fn void ImIO.add_mouse_pos_event(ImIO* self, float x, float y) @extern("ImGuiIO_AddMousePosEvent");

extern fn void ImIO.add_mouse_source_event(ImIO* self, MouseSource source) @extern("ImGuiIO_AddMouseSourceEvent");

extern fn void ImIO.add_mouse_viewport_event(ImIO* self, ImID id) @extern("ImGuiIO_AddMouseViewportEvent");

extern fn void ImIO.add_mouse_wheel_event(ImIO* self, float wheel_x, float wheel_y) @extern("ImGuiIO_AddMouseWheelEvent");

extern fn void ImIO.clear_events_queue(ImIO* self) @extern("ImGuiIO_ClearEventsQueue");

extern fn void ImIO.clear_input_keys(ImIO* self) @extern("ImGuiIO_ClearInputKeys");

extern fn void ImIO.clear_input_mouse(ImIO* self) @extern("ImGuiIO_ClearInputMouse");

extern fn ImIO* new_io() @extern("ImGuiIO_ImGuiIO");

extern fn void ImIO.set_app_accepting_events(ImIO* self, bool accepting_events) @extern("ImGuiIO_SetAppAcceptingEvents");

extern fn void ImIO.set_key_event_native_data(ImIO* self, Key key, int native_keycode, int native_scancode, int native_legacy_index = -1) @extern("ImGuiIO_SetKeyEventNativeData");

extern fn void ImIO.destroy(ImIO* self) @extern("ImGuiIO_destroy");

extern fn void InputTextCallbackData.clear_selection(InputTextCallbackData* self) @extern("ImGuiInputTextCallbackData_ClearSelection");

extern fn void InputTextCallbackData.delete_chars(InputTextCallbackData* self, int pos, int bytes_count) @extern("ImGuiInputTextCallbackData_DeleteChars");

extern fn bool InputTextCallbackData.has_selection(InputTextCallbackData* self) @extern("ImGuiInputTextCallbackData_HasSelection");

extern fn InputTextCallbackData* new_input_text_callback_data() @extern("ImGuiInputTextCallbackData_ImGuiInputTextCallbackData");

extern fn void InputTextCallbackData.insert_chars(InputTextCallbackData* self, int pos, ZString text, ZString text_end = null) @extern("ImGuiInputTextCallbackData_InsertChars");

extern fn void InputTextCallbackData.select_all(InputTextCallbackData* self) @extern("ImGuiInputTextCallbackData_SelectAll");

extern fn void InputTextCallbackData.destroy(InputTextCallbackData* self) @extern("ImGuiInputTextCallbackData_destroy");

extern fn void ListClipper.begin(ListClipper* self, int items_count, float items_height = -1.0f) @extern("ImGuiListClipper_Begin");

extern fn void ListClipper.end(ListClipper* self) @extern("ImGuiListClipper_End");

extern fn ListClipper* new_list_clipper() @extern("ImGuiListClipper_ImGuiListClipper");

extern fn void ListClipper.include_item_by_index(ListClipper* self, int item_index) @extern("ImGuiListClipper_IncludeItemByIndex");

extern fn void ListClipper.include_items_by_index(ListClipper* self, int item_begin, int item_end) @extern("ImGuiListClipper_IncludeItemsByIndex");

extern fn void ListClipper.seek_cursor_for_item(ListClipper* self, int item_index) @extern("ImGuiListClipper_SeekCursorForItem");

extern fn bool ListClipper.step(ListClipper* self) @extern("ImGuiListClipper_Step");

extern fn void ListClipper.destroy(ListClipper* self) @extern("ImGuiListClipper_destroy");

extern fn OnceUponAFrame* new_once_upon_a_frame() @extern("ImGuiOnceUponAFrame_ImGuiOnceUponAFrame");

extern fn void OnceUponAFrame.destroy(OnceUponAFrame* self) @extern("ImGuiOnceUponAFrame_destroy");

extern fn void Payload.clear(Payload* self) @extern("ImGuiPayload_Clear");

extern fn Payload* new_payload() @extern("ImGuiPayload_ImGuiPayload");

extern fn bool Payload.is_data_type(Payload* self, ZString type) @extern("ImGuiPayload_IsDataType");

extern fn bool Payload.is_delivery(Payload* self) @extern("ImGuiPayload_IsDelivery");

extern fn bool Payload.is_preview(Payload* self) @extern("ImGuiPayload_IsPreview");

extern fn void Payload.destroy(Payload* self) @extern("ImGuiPayload_destroy");

extern fn PlatformIO* new_platform_io() @extern("ImGuiPlatformIO_ImGuiPlatformIO");

extern fn PlatformImeData* new_platform_ime_data() @extern("ImGuiPlatformImeData_ImGuiPlatformImeData");

extern fn void PlatformImeData.destroy(PlatformImeData* self) @extern("ImGuiPlatformImeData_destroy");

extern fn PlatformMonitor* new_platform_monitor() @extern("ImGuiPlatformMonitor_ImGuiPlatformMonitor");

extern fn void PlatformMonitor.destroy(PlatformMonitor* self) @extern("ImGuiPlatformMonitor_destroy");

extern fn void SelectionBasicStorage.apply_requests(SelectionBasicStorage* self, MultiSelectIO* ms_io) @extern("ImGuiSelectionBasicStorage_ApplyRequests");

extern fn void SelectionBasicStorage.clear(SelectionBasicStorage* self) @extern("ImGuiSelectionBasicStorage_Clear");

extern fn bool SelectionBasicStorage.contains(SelectionBasicStorage* self, ImID id) @extern("ImGuiSelectionBasicStorage_Contains");

extern fn bool SelectionBasicStorage.get_next_selected_item(SelectionBasicStorage* self, void** opaque_it, ImID* out_id) @extern("ImGuiSelectionBasicStorage_GetNextSelectedItem");

extern fn ImID SelectionBasicStorage.get_storage_id_from_index(SelectionBasicStorage* self, int idx) @extern("ImGuiSelectionBasicStorage_GetStorageIdFromIndex");

extern fn SelectionBasicStorage* new_selection_basic_storage() @extern("ImGuiSelectionBasicStorage_ImGuiSelectionBasicStorage");

extern fn void SelectionBasicStorage.set_item_selected(SelectionBasicStorage* self, ImID id, bool selected) @extern("ImGuiSelectionBasicStorage_SetItemSelected");

extern fn void SelectionBasicStorage.swap(SelectionBasicStorage* self, SelectionBasicStorage* r) @extern("ImGuiSelectionBasicStorage_Swap");

extern fn void SelectionBasicStorage.destroy(SelectionBasicStorage* self) @extern("ImGuiSelectionBasicStorage_destroy");

extern fn void SelectionExternalStorage.apply_requests(SelectionExternalStorage* self, MultiSelectIO* ms_io) @extern("ImGuiSelectionExternalStorage_ApplyRequests");

extern fn SelectionExternalStorage* new_selection_external_storage() @extern("ImGuiSelectionExternalStorage_ImGuiSelectionExternalStorage");

extern fn void SelectionExternalStorage.destroy(SelectionExternalStorage* self) @extern("ImGuiSelectionExternalStorage_destroy");

extern fn StoragePair* new_storage_pair_int(ImID _key, int _val) @extern("ImGuiStoragePair_ImGuiStoragePair_Int");

extern fn StoragePair* new_storage_pair_float(ImID _key, float _val) @extern("ImGuiStoragePair_ImGuiStoragePair_Float");

extern fn StoragePair* new_storage_pair_ptr(ImID _key, void* _val) @extern("ImGuiStoragePair_ImGuiStoragePair_Ptr");

extern fn void StoragePair.destroy(StoragePair* self) @extern("ImGuiStoragePair_destroy");

extern fn void Storage.build_sort_by_key(Storage* self) @extern("ImGuiStorage_BuildSortByKey");

extern fn void Storage.clear(Storage* self) @extern("ImGuiStorage_Clear");

extern fn bool Storage.get_bool(Storage* self, ImID key, bool default_val = false) @extern("ImGuiStorage_GetBool");

extern fn bool* Storage.get_bool_ref(Storage* self, ImID key, bool default_val = false) @extern("ImGuiStorage_GetBoolRef");

extern fn float Storage.get_float(Storage* self, ImID key, float default_val = 0.0f) @extern("ImGuiStorage_GetFloat");

extern fn float* Storage.get_float_ref(Storage* self, ImID key, float default_val = 0.0f) @extern("ImGuiStorage_GetFloatRef");

extern fn int Storage.get_int(Storage* self, ImID key, int default_val = 0) @extern("ImGuiStorage_GetInt");

extern fn int* Storage.get_int_ref(Storage* self, ImID key, int default_val = 0) @extern("ImGuiStorage_GetIntRef");

extern fn void* Storage.get_void_ptr(Storage* self, ImID key) @extern("ImGuiStorage_GetVoidPtr");

extern fn void** Storage.get_void_ptr_ref(Storage* self, ImID key, void* default_val = null) @extern("ImGuiStorage_GetVoidPtrRef");

extern fn void Storage.set_all_int(Storage* self, int val) @extern("ImGuiStorage_SetAllInt");

extern fn void Storage.set_bool(Storage* self, ImID key, bool val) @extern("ImGuiStorage_SetBool");

extern fn void Storage.set_float(Storage* self, ImID key, float val) @extern("ImGuiStorage_SetFloat");

extern fn void Storage.set_int(Storage* self, ImID key, int val) @extern("ImGuiStorage_SetInt");

extern fn void Storage.set_void_ptr(Storage* self, ImID key, void* val) @extern("ImGuiStorage_SetVoidPtr");

extern fn Style* new_style() @extern("ImGuiStyle_ImGuiStyle");

extern fn void Style.scale_all_sizes(Style* self, float scale_factor) @extern("ImGuiStyle_ScaleAllSizes");

extern fn void Style.destroy(Style* self) @extern("ImGuiStyle_destroy");

extern fn TableColumnSortSpecs* new_table_column_sort_specs() @extern("ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs");

extern fn void TableColumnSortSpecs.destroy(TableColumnSortSpecs* self) @extern("ImGuiTableColumnSortSpecs_destroy");

extern fn TableSortSpecs* new_table_sort_specs() @extern("ImGuiTableSortSpecs_ImGuiTableSortSpecs");

extern fn void TableSortSpecs.destroy(TableSortSpecs* self) @extern("ImGuiTableSortSpecs_destroy");

extern fn TextBuffer* new_text_buffer() @extern("ImGuiTextBuffer_ImGuiTextBuffer");

extern fn void TextBuffer.append(TextBuffer* self, ZString str, ZString str_end = null) @extern("ImGuiTextBuffer_append");

extern fn void TextBuffer.appendf(TextBuffer* self, ZString fmt, ...) @extern("ImGuiTextBuffer_appendf");

extern fn ZString TextBuffer.begin(TextBuffer* self) @extern("ImGuiTextBuffer_begin");

extern fn ZString TextBuffer.c_str(TextBuffer* self) @extern("ImGuiTextBuffer_c_str");

extern fn void TextBuffer.clear(TextBuffer* self) @extern("ImGuiTextBuffer_clear");

extern fn void TextBuffer.destroy(TextBuffer* self) @extern("ImGuiTextBuffer_destroy");

extern fn bool TextBuffer.empty(TextBuffer* self) @extern("ImGuiTextBuffer_empty");

extern fn ZString TextBuffer.end(TextBuffer* self) @extern("ImGuiTextBuffer_end");

extern fn void TextBuffer.reserve(TextBuffer* self, int capacity) @extern("ImGuiTextBuffer_reserve");

extern fn int TextBuffer.size(TextBuffer* self) @extern("ImGuiTextBuffer_size");

extern fn void TextFilter.build(TextFilter* self) @extern("ImGuiTextFilter_Build");

extern fn void TextFilter.clear(TextFilter* self) @extern("ImGuiTextFilter_Clear");

extern fn bool TextFilter.draw(TextFilter* self, ZString label = "Filter(inc,-exc)", float width = 0.0f) @extern("ImGuiTextFilter_Draw");

extern fn TextFilter* new_text_filter(ZString default_filter = "") @extern("ImGuiTextFilter_ImGuiTextFilter");

extern fn bool TextFilter.is_active(TextFilter* self) @extern("ImGuiTextFilter_IsActive");

extern fn bool TextFilter.pass_filter(TextFilter* self, ZString text, ZString text_end = null) @extern("ImGuiTextFilter_PassFilter");

extern fn void TextFilter.destroy(TextFilter* self) @extern("ImGuiTextFilter_destroy");

extern fn TextRange* new_text_range() @extern("ImGuiTextRange_ImGuiTextRange_Nil");

extern fn TextRange* new_text_range_str(ZString _b, ZString _e) @extern("ImGuiTextRange_ImGuiTextRange_Str");

extern fn void TextRange.destroy(TextRange* self) @extern("ImGuiTextRange_destroy");

extern fn bool TextRange.empty(TextRange* self) @extern("ImGuiTextRange_empty");

extern fn void TextRange.split(TextRange* self, char separator, vector::Vector(<TextRange>)* out) @extern("ImGuiTextRange_split");

extern fn void imGuiViewportGetCenter(Vec2* pOut, Viewport* self) @extern("ImGuiViewport_GetCenter") @local;
fn Vec2 Viewport.get_center(Viewport* self) @inline {
	Vec2 pOut;
	imGuiViewportGetCenter(&pOut, self);
	return pOut;
}

extern fn void imGuiViewportGetWorkCenter(Vec2* pOut, Viewport* self) @extern("ImGuiViewport_GetWorkCenter") @local;
fn Vec2 Viewport.get_work_center(Viewport* self) @inline {
	Vec2 pOut;
	imGuiViewportGetWorkCenter(&pOut, self);
	return pOut;
}

extern fn Viewport* new_viewport() @extern("ImGuiViewport_ImGuiViewport");

extern fn void Viewport.destroy(Viewport* self) @extern("ImGuiViewport_destroy");

extern fn WindowClass* new_window_class() @extern("ImGuiWindowClass_ImGuiWindowClass");

extern fn void WindowClass.destroy(WindowClass* self) @extern("ImGuiWindowClass_destroy");

extern fn Vec2* new_vec2() @extern("ImVec2_ImVec2_Nil");

extern fn Vec2* new_vec2_float(float _x, float _y) @extern("ImVec2_ImVec2_Float");

extern fn void Vec2.destroy(Vec2* self) @extern("ImVec2_destroy");

extern fn Vec4* new_vec4() @extern("ImVec4_ImVec4_Nil");

extern fn Vec4* new_vec4_float(float _x, float _y, float _z, float _w) @extern("ImVec4_ImVec4_Float");

extern fn void Vec4.destroy(Vec4* self) @extern("ImVec4_destroy");

