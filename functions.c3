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

extern fn void push_i_d__str(ZString str_id) @extern("igPushID_Str");

extern fn void push_i_d__str_str(ZString str_id_begin, ZString str_id_end) @extern("igPushID_StrStr");

extern fn void push_i_d__ptr(void* ptr_id) @extern("igPushID_Ptr");

extern fn void push_i_d__int(int int_id) @extern("igPushID_Int");

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

extern fn ImID get_i_d__str(ZString str_id) @extern("igGetID_Str");

extern fn ImID get_i_d__str_str(ZString str_id_begin, ZString str_id_end) @extern("igGetID_StrStr");

extern fn ImID get_i_d__ptr(void* ptr_id) @extern("igGetID_Ptr");

extern fn ImID get_i_d__int(int int_id) @extern("igGetID_Int");

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
	igCalcTextSize(&pOut, text,text_end,hide_text_after_double_hash,wrap_width);
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
	igGetMouseDragDelta(&pOut, button,lock_threshold);
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

extern fn bool input_double(ZString label, double* v, double step = 0.000000, double step_fast = 0.000000, ZString format = "%.6f", InputTextFlags flags = 0) @extern("igInputDouble");

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

extern fn void progress_bar(float fraction, Vec2 size_arg = {-float.min, 0}, ZString overlay = null) @extern("igProgressBar");

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

