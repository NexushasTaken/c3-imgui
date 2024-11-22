module imgui;

// ImGuiTableSortSpecs
struct TableSortSpecs {
	TableColumnSortSpecs* specs;
	int specs_count;
	bool specs_dirty;
}

// ImGuiStorage
struct Storage {
	vector::Vector(<StoragePair>) data;
}

// ImGuiKeyData
struct KeyData {
	bool down;
	float down_duration;
	float down_duration_prev;
	float analog_value;
}

// ImGuiPlatformImeData
struct PlatformImeData {
	bool want_visible;
	Vec2 input_pos;
	float input_line_height;
}

// ImGuiStyle
struct Style {
	float alpha;
	float disabled_alpha;
	Vec2 window_padding;
	float window_rounding;
	float window_border_size;
	Vec2 window_min_size;
	Vec2 window_title_align;
	Dir window_menu_button_position;
	float child_rounding;
	float child_border_size;
	float popup_rounding;
	float popup_border_size;
	Vec2 frame_padding;
	float frame_rounding;
	float frame_border_size;
	Vec2 item_spacing;
	Vec2 item_inner_spacing;
	Vec2 cell_padding;
	Vec2 touch_extra_padding;
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
	Vec2 table_angled_headers_text_align;
	Dir color_button_position;
	Vec2 button_text_align;
	Vec2 selectable_text_align;
	float separator_text_border_size;
	Vec2 separator_text_align;
	Vec2 separator_text_padding;
	Vec2 display_window_padding;
	Vec2 display_safe_area_padding;
	float mouse_cursor_scale;
	bool anti_aliased_lines;
	bool anti_aliased_lines_use_tex;
	bool anti_aliased_fill;
	float curve_tessellation_tol;
	float circle_tessellation_max_error;
	Vec4[(usz)(COL_COUNT)] colors;
	float hover_stationary_delay;
	float hover_delay_short;
	float hover_delay_normal;
	HoveredFlags hover_flags_for_tooltip_mouse;
	HoveredFlags hover_flags_for_tooltip_nav;
}

// ImGuiMultiSelectIO
struct MultiSelectIO {
	vector::Vector(<SelectionRequest>) requests;
	SelectionUserData range_src_item;
	SelectionUserData nav_id_item;
	bool nav_id_selected;
	bool range_src_reset;
	int items_count;
}

// ImGuiSelectionRequest
struct SelectionRequest {
	SelectionRequestType type;
	bool selected;
	ImU8 range_direction;
	SelectionUserData range_first_item;
	SelectionUserData range_last_item;
}

// ImColor
struct Color {
	Vec4 value;
}

// ImVec2
struct Vec2 {
	float x;
	float y;
}

// ImVec4
struct Vec4 {
	float x;
	float y;
	float z;
	float w;
}

// ImDrawData
struct DrawData {
	bool valid;
	int cmd_lists_count;
	int total_idx_count;
	int total_vtx_count;
	vector::Vector(<DrawList*>) cmd_lists;
	Vec2 display_pos;
	Vec2 display_size;
	Vec2 framebuffer_scale;
	Viewport* owner_viewport;
}

// ImGuiPlatformIO
struct PlatformIO {
	PlatformGetClipboardTextFn_Func platform_get_clipboard_text_fn;
	PlatformSetClipboardTextFn_Func platform_set_clipboard_text_fn;
	void* platform_clipboard_user_data;
	PlatformOpenInShellFn_Func platform_open_in_shell_fn;
	void* platform_open_in_shell_user_data;
	PlatformSetImeDataFn_Func platform_set_ime_data_fn;
	void* platform_ime_user_data;
	Wchar platform_locale_decimal_point;
	void* renderer_render_state;
}

def PlatformGetClipboardTextFn_Func = fn ZString(void* ctx);
def PlatformSetClipboardTextFn_Func = fn void(void* ctx, ZString text);
def PlatformOpenInShellFn_Func = fn bool(void* ctx, ZString path);
def PlatformSetImeDataFn_Func = fn void(void* ctx, Viewport* viewport, PlatformImeData* data);

// ImFontGlyph
struct FontGlyph {
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
struct Font {
	vector::Vector(<float>) index_advance_x;
	float fallback_advance_x;
	float font_size;
	vector::Vector(<Wchar>) index_lookup;
	vector::Vector(<FontGlyph>) glyphs;
	FontGlyph* fallback_glyph;
	FontAtlas* container_atlas;
	FontConfig* config_data;
	short config_data_count;
	Wchar fallback_char;
	Wchar ellipsis_char;
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
struct FontGlyphRangesBuilder {
	vector::Vector(<uint>) used_chars;
}

// ImGuiOnceUponAFrame
struct OnceUponAFrame {
	int ref_frame;
}

// ImDrawChannel
struct DrawChannel {
	vector::Vector(<DrawCmd>) _cmd_buffer;
	vector::Vector(<DrawIdx>) _idx_buffer;
}

// ImGuiSizeCallbackData
struct SizeCallbackData {
	void* user_data;
	Vec2 pos;
	Vec2 current_size;
	Vec2 desired_size;
}

// ImDrawCmdHeader
struct DrawCmdHeader {
	Vec4 clip_rect;
	TextureID texture_id;
	uint vtx_offset;
}

// ImDrawCmd
struct DrawCmd {
	Vec4 clip_rect;
	TextureID texture_id;
	uint vtx_offset;
	uint idx_offset;
	uint elem_count;
	DrawCallback user_callback;
	void* user_callback_data;
	int user_callback_data_size;
	int user_callback_data_offset;
}

// ImGuiSelectionExternalStorage
struct SelectionExternalStorage {
	void* user_data;
	AdapterSetItemSelected_Func adapter_set_item_selected;
}

def AdapterSetItemSelected_Func = fn void(SelectionExternalStorage* self, int idx, bool selected);

// ImFontConfig
struct FontConfig {
	void* font_data;
	int font_data_size;
	bool font_data_owned_by_atlas;
	int font_no;
	float size_pixels;
	int oversample_h;
	int oversample_v;
	bool pixel_snap_h;
	Vec2 glyph_extra_spacing;
	Vec2 glyph_offset;
	Wchar* glyph_ranges;
	float glyph_min_advance_x;
	float glyph_max_advance_x;
	bool merge_mode;
	uint font_builder_flags;
	float rasterizer_multiply;
	float rasterizer_density;
	Wchar ellipsis_char;
	char[(usz)(40)] name;
	Font* dst_font;
}

// ImGuiIO
struct ImGuiIO {
	ConfigFlags config_flags;
	BackendFlags backend_flags;
	Vec2 display_size;
	float delta_time;
	float ini_saving_rate;
	ZString ini_filename;
	ZString log_filename;
	void* user_data;
	FontAtlas* fonts;
	float font_global_scale;
	bool font_allow_user_scaling;
	Font* font_default;
	Vec2 display_framebuffer_scale;
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
	Vec2 mouse_delta;
	void* ctx;
	Vec2 mouse_pos;
	bool[(usz)(5)] mouse_down;
	float mouse_wheel;
	float mouse_wheel_h;
	MouseSource mouse_source;
	bool key_ctrl;
	bool key_shift;
	bool key_alt;
	bool key_super;
	KeyChord key_mods;
	KeyData[(usz)(KEY_NAMED_KEY_COUNT)] keys_data;
	bool want_capture_mouse_unless_popup_close;
	Vec2 mouse_pos_prev;
	Vec2[(usz)(5)] mouse_clicked_pos;
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
	Wchar16 input_queue_surrogate;
	vector::Vector(<Wchar>) input_queue_characters;
}

// ImDrawListSplitter
struct DrawListSplitter {
	int _current;
	int _count;
	vector::Vector(<DrawChannel>) _channels;
}

// ImGuiTextBuffer
struct TextBuffer {
	vector::Vector(<char>) buf;
}

// ImFontAtlas
struct FontAtlas {
	FontAtlasFlags flags;
	TextureID tex_id;
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
	Vec2 tex_uv_scale;
	Vec2 tex_uv_white_pixel;
	vector::Vector(<Font*>) fonts;
	vector::Vector(<FontAtlasCustomRect>) custom_rects;
	vector::Vector(<FontConfig>) config_data;
	Vec4[(usz)((63)+1)] tex_uv_lines;
	void* font_builder_io;
	uint font_builder_flags;
	int pack_id_mouse_cursors;
	int pack_id_lines;
}

// ImGuiStoragePair
struct StoragePair {
	ImGuiID key;
	union { int val_i; float val_f; void* val_p;}
}

// ImGuiTextRange
struct TextRange {
	ZString b;
	ZString e;
}

// ImGuiSelectionBasicStorage
struct SelectionBasicStorage {
	int size;
	bool preserve_order;
	void* user_data;
	AdapterIndexToStorageId_Func adapter_index_to_storage_id;
	int _selection_order;
	Storage _storage;
}

def AdapterIndexToStorageId_Func = fn ImGuiID(SelectionBasicStorage* self, int idx);

// ImGuiListClipper
struct ListClipper {
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
struct Payload {
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
struct DrawVert {
	Vec2 pos;
	Vec2 uv;
	ImU32 col;
}

// ImGuiInputTextCallbackData
struct InputTextCallbackData {
	void* ctx;
	InputTextFlags event_flag;
	InputTextFlags flags;
	void* user_data;
	Wchar event_char;
	Key event_key;
	char* buf;
	int buf_text_len;
	int buf_size;
	bool buf_dirty;
	int cursor_pos;
	int selection_start;
	int selection_end;
}

// ImDrawList
struct DrawList {
	vector::Vector(<DrawCmd>) cmd_buffer;
	vector::Vector(<DrawIdx>) idx_buffer;
	vector::Vector(<DrawVert>) vtx_buffer;
	DrawListFlags flags;
	uint _vtx_current_idx;
	void* _data;
	DrawVert* _vtx_write_ptr;
	DrawIdx* _idx_write_ptr;
	vector::Vector(<Vec2>) _path;
	DrawCmdHeader _cmd_header;
	DrawListSplitter _splitter;
	vector::Vector(<Vec4>) _clip_rect_stack;
	vector::Vector(<TextureID>) _texture_id_stack;
	vector::Vector(<char>) _callbacks_data_buf;
	float _fringe_scale;
	ZString _owner_name;
}

// ImGuiViewport
struct Viewport {
	ImGuiID id;
	ViewportFlags flags;
	Vec2 pos;
	Vec2 size;
	Vec2 work_pos;
	Vec2 work_size;
	void* platform_handle;
	void* platform_handle_raw;
}

// ImGuiTableColumnSortSpecs
struct TableColumnSortSpecs {
	ImGuiID column_user_id;
	ImU16 column_index;
	ImU16 sort_order;
	SortDirection sort_direction;
}

// ImGuiTextFilter
struct TextFilter {
	char[(usz)(256)] input_buf;
	vector::Vector(<TextRange>) filters;
	int count_grep;
}

// ImFontAtlasCustomRect
struct FontAtlasCustomRect {
	ushort width;
	ushort height;
	ushort x;
	ushort y;
	bitstruct : uint {
		uint glyph_id : 0..30;
		uint glyph_colored : 31..31;
	}
	Vec2 glyph_offset;
	Font* font;
}

