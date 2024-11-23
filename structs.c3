module imgui;

// ImGuiTableSortSpecs
struct ImGuiTableSortSpecs {
	ImGuiTableColumnSortSpecs* specs;
	int specs_count;
	bool specs_dirty;
}

// ImGuiStorage
struct ImGuiStorage {
	vector::ImVector(<ImGuiStoragePair>) data;
}

// ImGuiKeyData
struct ImGuiKeyData {
	bool down;
	float down_duration;
	float down_duration_prev;
	float analog_value;
}

// ImGuiPlatformImeData
struct ImGuiPlatformImeData {
	bool want_visible;
	ImVec2 input_pos;
	float input_line_height;
}

// ImGuiStyle
struct ImGuiStyle {
	float alpha;
	float disabled_alpha;
	ImVec2 window_padding;
	float window_rounding;
	float window_border_size;
	ImVec2 window_min_size;
	ImVec2 window_title_align;
	ImGuiDir window_menu_button_position;
	float child_rounding;
	float child_border_size;
	float popup_rounding;
	float popup_border_size;
	ImVec2 frame_padding;
	float frame_rounding;
	float frame_border_size;
	ImVec2 item_spacing;
	ImVec2 item_inner_spacing;
	ImVec2 cell_padding;
	ImVec2 touch_extra_padding;
	float indent_spacing;
	float columns_min_spacing;
	float scrollbar_size;
	float scrollbar_rounding;
	float grab_min_size;
	float grab_rounding;
	float log_slider_deadzone;
	float tab_rounding;
	float tab_border_size;
	float tab_min_width_for_close_button;
	float tab_bar_border_size;
	float tab_bar_overline_size;
	float table_angled_headers_angle;
	ImVec2 table_angled_headers_text_align;
	ImGuiDir color_button_position;
	ImVec2 button_text_align;
	ImVec2 selectable_text_align;
	float separator_text_border_size;
	ImVec2 separator_text_align;
	ImVec2 separator_text_padding;
	ImVec2 display_window_padding;
	ImVec2 display_safe_area_padding;
	float mouse_cursor_scale;
	bool anti_aliased_lines;
	bool anti_aliased_lines_use_tex;
	bool anti_aliased_fill;
	float curve_tessellation_tol;
	float circle_tessellation_max_error;
	ImVec4[(usz)(COL_COUNT)] colors;
	float hover_stationary_delay;
	float hover_delay_short;
	float hover_delay_normal;
	ImGuiHoveredFlags hover_flags_for_tooltip_mouse;
	ImGuiHoveredFlags hover_flags_for_tooltip_nav;
}

// ImGuiMultiSelectIO
struct ImGuiMultiSelectIO {
	vector::ImVector(<ImGuiSelectionRequest>) requests;
	ImGuiSelectionUserData range_src_item;
	ImGuiSelectionUserData nav_id_item;
	bool nav_id_selected;
	bool range_src_reset;
	int items_count;
}

// ImGuiSelectionRequest
struct ImGuiSelectionRequest {
	ImGuiSelectionRequestType type;
	bool selected;
	ImU8 range_direction;
	ImGuiSelectionUserData range_first_item;
	ImGuiSelectionUserData range_last_item;
}

// ImColor
struct ImColor {
	ImVec4 value;
}

// ImVec2
struct ImVec2 {
	float x;
	float y;
}

// ImVec4
struct ImVec4 {
	float x;
	float y;
	float z;
	float w;
}

// ImDrawData
struct ImDrawData {
	bool valid;
	int cmd_lists_count;
	int total_idx_count;
	int total_vtx_count;
	vector::ImVector(<ImDrawList*>) cmd_lists;
	ImVec2 display_pos;
	ImVec2 display_size;
	ImVec2 framebuffer_scale;
	ImGuiViewport* owner_viewport;
}

// ImGuiPlatformIO
struct ImGuiPlatformIO {
	PlatformGetClipboardTextFn_Func platform_get_clipboard_text_fn;
	PlatformSetClipboardTextFn_Func platform_set_clipboard_text_fn;
	void* platform_clipboard_user_data;
	PlatformOpenInShellFn_Func platform_open_in_shell_fn;
	void* platform_open_in_shell_user_data;
	PlatformSetImeDataFn_Func platform_set_ime_data_fn;
	void* platform_ime_user_data;
	ImWchar platform_locale_decimal_point;
	void* renderer_render_state;
}

def PlatformGetClipboardTextFn_Func = fn ZString(void* ctx);
def PlatformSetClipboardTextFn_Func = fn void(void* ctx, ZString text);
def PlatformOpenInShellFn_Func = fn bool(void* ctx, ZString path);
def PlatformSetImeDataFn_Func = fn void(void* ctx, ImGuiViewport* viewport, ImGuiPlatformImeData* data);

// ImFontGlyph
struct ImFontGlyph {
	bitstruct : uint {
		uint colored : 0..0;
		uint visible : 1..1;
		uint codepoint : 2..31;
	}
	float x0;
	float y0;
	float x1;
	float y1;
	float u0;
	float v0;
	float u1;
	float v1;
}

// ImFont
struct ImFont {
	vector::ImVector(<float>) index_advance_x;
	float fallback_advance_x;
	float font_size;
	vector::ImVector(<ImWchar>) index_lookup;
	vector::ImVector(<ImFontGlyph>) glyphs;
	ImFontGlyph* fallback_glyph;
	ImFontAtlas* container_atlas;
	ImFontConfig* config_data;
	short config_data_count;
	ImWchar fallback_char;
	ImWchar ellipsis_char;
	short ellipsis_char_count;
	float ellipsis_width;
	float ellipsis_char_step;
	bool dirty_lookup_tables;
	float scale;
	float ascent;
	float descent;
	int metrics_total_surface;
	ImU8[(usz)((0xFFFF+1)/4096/8)] used4k_pages_map;
}

// ImFontGlyphRangesBuilder
struct ImFontGlyphRangesBuilder {
	vector::ImVector(<uint>) used_chars;
}

// ImGuiOnceUponAFrame
struct ImGuiOnceUponAFrame {
	int ref_frame;
}

// ImDrawChannel
struct ImDrawChannel {
	vector::ImVector(<ImDrawCmd>) _cmd_buffer;
	vector::ImVector(<ImDrawIdx>) _idx_buffer;
}

// ImGuiSizeCallbackData
struct ImGuiSizeCallbackData {
	void* user_data;
	ImVec2 pos;
	ImVec2 current_size;
	ImVec2 desired_size;
}

// ImDrawCmdHeader
struct ImDrawCmdHeader {
	ImVec4 clip_rect;
	ImTextureID texture_id;
	uint vtx_offset;
}

// ImDrawCmd
struct ImDrawCmd {
	ImVec4 clip_rect;
	ImTextureID texture_id;
	uint vtx_offset;
	uint idx_offset;
	uint elem_count;
	ImDrawCallback user_callback;
	void* user_callback_data;
	int user_callback_data_size;
	int user_callback_data_offset;
}

// ImGuiSelectionExternalStorage
struct ImGuiSelectionExternalStorage {
	void* user_data;
	AdapterSetItemSelected_Func adapter_set_item_selected;
}

def AdapterSetItemSelected_Func = fn void(ImGuiSelectionExternalStorage* self, int idx, bool selected);

// ImFontConfig
struct ImFontConfig {
	void* font_data;
	int font_data_size;
	bool font_data_owned_by_atlas;
	int font_no;
	float size_pixels;
	int oversample_h;
	int oversample_v;
	bool pixel_snap_h;
	ImVec2 glyph_extra_spacing;
	ImVec2 glyph_offset;
	ImWchar* glyph_ranges;
	float glyph_min_advance_x;
	float glyph_max_advance_x;
	bool merge_mode;
	uint font_builder_flags;
	float rasterizer_multiply;
	float rasterizer_density;
	ImWchar ellipsis_char;
	char[(usz)(40)] name;
	ImFont* dst_font;
}

// ImGuiIO
struct ImGuiIO {
	ImGuiConfigFlags config_flags;
	ImGuiBackendFlags backend_flags;
	ImVec2 display_size;
	float delta_time;
	float ini_saving_rate;
	ZString ini_filename;
	ZString log_filename;
	void* user_data;
	ImFontAtlas* fonts;
	float font_global_scale;
	bool font_allow_user_scaling;
	ImFont* font_default;
	ImVec2 display_framebuffer_scale;
	bool config_nav_swap_gamepad_buttons;
	bool config_nav_move_set_mouse_pos;
	bool config_nav_capture_keyboard;
	bool config_nav_escape_clear_focus_item;
	bool config_nav_escape_clear_focus_window;
	bool config_nav_cursor_visible_auto;
	bool config_nav_cursor_visible_always;
	bool mouse_draw_cursor;
	bool config_mac_osx_behaviors;
	bool config_input_trickle_event_queue;
	bool config_input_text_cursor_blink;
	bool config_input_text_enter_keep_active;
	bool config_drag_click_to_input_text;
	bool config_windows_resize_from_edges;
	bool config_windows_move_from_title_bar_only;
	bool config_windows_copy_contents_with_ctrl_c;
	bool config_scrollbar_scroll_by_page;
	float config_memory_compact_timer;
	float mouse_double_click_time;
	float mouse_double_click_max_dist;
	float mouse_drag_threshold;
	float key_repeat_delay;
	float key_repeat_rate;
	bool config_error_recovery;
	bool config_error_recovery_enable_assert;
	bool config_error_recovery_enable_debug_log;
	bool config_error_recovery_enable_tooltip;
	bool config_debug_is_debugger_present;
	bool config_debug_highlight_id_conflicts;
	bool config_debug_begin_return_value_once;
	bool config_debug_begin_return_value_loop;
	bool config_debug_ignore_focus_loss;
	bool config_debug_ini_settings;
	ZString backend_platform_name;
	ZString backend_renderer_name;
	void* backend_platform_user_data;
	void* backend_renderer_user_data;
	void* backend_language_user_data;
	bool want_capture_mouse;
	bool want_capture_keyboard;
	bool want_text_input;
	bool want_set_mouse_pos;
	bool want_save_ini_settings;
	bool nav_active;
	bool nav_visible;
	float framerate;
	int metrics_render_vertices;
	int metrics_render_indices;
	int metrics_render_windows;
	int metrics_active_windows;
	ImVec2 mouse_delta;
	void* ctx;
	ImVec2 mouse_pos;
	bool[(usz)(5)] mouse_down;
	float mouse_wheel;
	float mouse_wheel_h;
	ImGuiMouseSource mouse_source;
	bool key_ctrl;
	bool key_shift;
	bool key_alt;
	bool key_super;
	ImGuiKeyChord key_mods;
	ImGuiKeyData[(usz)(KEY_NAMED_KEY_COUNT)] keys_data;
	bool want_capture_mouse_unless_popup_close;
	ImVec2 mouse_pos_prev;
	ImVec2[(usz)(5)] mouse_clicked_pos;
	double[(usz)(5)] mouse_clicked_time;
	bool[(usz)(5)] mouse_clicked;
	bool[(usz)(5)] mouse_double_clicked;
	ImU16[(usz)(5)] mouse_clicked_count;
	ImU16[(usz)(5)] mouse_clicked_last_count;
	bool[(usz)(5)] mouse_released;
	bool[(usz)(5)] mouse_down_owned;
	bool[(usz)(5)] mouse_down_owned_unless_popup_close;
	bool mouse_wheel_request_axis_swap;
	bool mouse_ctrl_left_as_right_click;
	float[(usz)(5)] mouse_down_duration;
	float[(usz)(5)] mouse_down_duration_prev;
	float[(usz)(5)] mouse_drag_max_distance_sqr;
	float pen_pressure;
	bool app_focus_lost;
	bool app_accepting_events;
	ImWchar16 input_queue_surrogate;
	vector::ImVector(<ImWchar>) input_queue_characters;
}

// ImDrawListSplitter
struct ImDrawListSplitter {
	int _current;
	int _count;
	vector::ImVector(<ImDrawChannel>) _channels;
}

// ImGuiTextBuffer
struct ImGuiTextBuffer {
	vector::ImVector(<char>) buf;
}

// ImFontAtlas
struct ImFontAtlas {
	ImFontAtlasFlags flags;
	ImTextureID tex_id;
	int tex_desired_width;
	int tex_glyph_padding;
	bool locked;
	void* user_data;
	bool tex_ready;
	bool tex_pixels_use_colors;
	char* tex_pixels_alpha8;
	uint* tex_pixels_rgba32;
	int tex_width;
	int tex_height;
	ImVec2 tex_uv_scale;
	ImVec2 tex_uv_white_pixel;
	vector::ImVector(<ImFont*>) fonts;
	vector::ImVector(<ImFontAtlasCustomRect>) custom_rects;
	vector::ImVector(<ImFontConfig>) config_data;
	ImVec4[(usz)((63)+1)] tex_uv_lines;
	void* font_builder_io;
	uint font_builder_flags;
	int pack_id_mouse_cursors;
	int pack_id_lines;
}

// ImGuiStoragePair
struct ImGuiStoragePair {
	ImGuiID key;
	union { int val_i; float val_f; void* val_p;}
}

// ImGuiTextRange
struct ImGuiTextRange {
	ZString b;
	ZString e;
}

// ImGuiSelectionBasicStorage
struct ImGuiSelectionBasicStorage {
	int size;
	bool preserve_order;
	void* user_data;
	AdapterIndexToStorageId_Func adapter_index_to_storage_id;
	int _selection_order;
	ImGuiStorage _storage;
}

def AdapterIndexToStorageId_Func = fn ImGuiID(ImGuiSelectionBasicStorage* self, int idx);

// ImGuiListClipper
struct ImGuiListClipper {
	void* ctx;
	int display_start;
	int display_end;
	int items_count;
	float items_height;
	float start_pos_y;
	double start_seek_offset_y;
	void* temp_data;
}

// ImGuiPayload
struct ImGuiPayload {
	void* data;
	int data_size;
	ImGuiID source_id;
	ImGuiID source_parent_id;
	int data_frame_count;
	char[(usz)(32+1)] data_type;
	bool preview;
	bool delivery;
}

// ImDrawVert
struct ImDrawVert {
	ImVec2 pos;
	ImVec2 uv;
	ImU32 col;
}

// ImGuiInputTextCallbackData
struct ImGuiInputTextCallbackData {
	void* ctx;
	ImGuiInputTextFlags event_flag;
	ImGuiInputTextFlags flags;
	void* user_data;
	ImWchar event_char;
	ImGuiKey event_key;
	char* buf;
	int buf_text_len;
	int buf_size;
	bool buf_dirty;
	int cursor_pos;
	int selection_start;
	int selection_end;
}

// ImDrawList
struct ImDrawList {
	vector::ImVector(<ImDrawCmd>) cmd_buffer;
	vector::ImVector(<ImDrawIdx>) idx_buffer;
	vector::ImVector(<ImDrawVert>) vtx_buffer;
	ImDrawListFlags flags;
	uint _vtx_current_idx;
	void* _data;
	ImDrawVert* _vtx_write_ptr;
	ImDrawIdx* _idx_write_ptr;
	vector::ImVector(<ImVec2>) _path;
	ImDrawCmdHeader _cmd_header;
	ImDrawListSplitter _splitter;
	vector::ImVector(<ImVec4>) _clip_rect_stack;
	vector::ImVector(<ImTextureID>) _texture_id_stack;
	vector::ImVector(<char>) _callbacks_data_buf;
	float _fringe_scale;
	ZString _owner_name;
}

// ImGuiViewport
struct ImGuiViewport {
	ImGuiID id;
	ImGuiViewportFlags flags;
	ImVec2 pos;
	ImVec2 size;
	ImVec2 work_pos;
	ImVec2 work_size;
	void* platform_handle;
	void* platform_handle_raw;
}

// ImGuiTableColumnSortSpecs
struct ImGuiTableColumnSortSpecs {
	ImGuiID column_user_id;
	ImU16 column_index;
	ImU16 sort_order;
	ImGuiSortDirection sort_direction;
}

// ImGuiTextFilter
struct ImGuiTextFilter {
	char[(usz)(256)] input_buf;
	vector::ImVector(<ImGuiTextRange>) filters;
	int count_grep;
}

// ImFontAtlasCustomRect
struct ImFontAtlasCustomRect {
	ushort width;
	ushort height;
	ushort x;
	ushort y;
	bitstruct : uint {
		uint glyph_id : 0..30;
		uint glyph_colored : 31..31;
	}
	ImVec2 glyph_offset;
	ImFont* font;
}

