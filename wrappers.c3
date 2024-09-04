module imgui;

extern fn void igGetMousePos(Vec2* pOut) @extern("igGetMousePos") @local;
fn Vec2 get_mouse_pos() @inline {
	Vec2 pOut;
	igGetMousePos(&pOut);
	return pOut;
}

extern fn void igGetItemRectMax(Vec2* pOut) @extern("igGetItemRectMax") @local;
fn Vec2 get_item_rect_max() @inline {
	Vec2 pOut;
	igGetItemRectMax(&pOut);
	return pOut;
}

extern fn void igGetFontTexUvWhitePixel(Vec2* pOut) @extern("igGetFontTexUvWhitePixel") @local;
fn Vec2 get_font_tex_uv_white_pixel() @inline {
	Vec2 pOut;
	igGetFontTexUvWhitePixel(&pOut);
	return pOut;
}

extern fn void igGetItemRectMin(Vec2* pOut) @extern("igGetItemRectMin") @local;
fn Vec2 get_item_rect_min() @inline {
	Vec2 pOut;
	igGetItemRectMin(&pOut);
	return pOut;
}

extern fn void igColorConvertU32ToFloat4(Vec4* pOut, ImU32 in) @extern("igColorConvertU32ToFloat4") @local;
fn Vec4 color_convert_u32_to_float4(ImU32 in) @inline {
	Vec4 pOut;
	igColorConvertU32ToFloat4(&pOut, in);
	return pOut;
}

extern fn void igGetCursorStartPos(Vec2* pOut) @extern("igGetCursorStartPos") @local;
fn Vec2 get_cursor_start_pos() @inline {
	Vec2 pOut;
	igGetCursorStartPos(&pOut);
	return pOut;
}

extern fn void igCalcTextSize(Vec2* pOut, ZString text, ZString text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f) @extern("igCalcTextSize") @local;
fn Vec2 calc_text_size(ZString text, ZString text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f) @inline {
	Vec2 pOut;
	igCalcTextSize(&pOut, text, text_end, hide_text_after_double_hash, wrap_width);
	return pOut;
}

extern fn void igGetMouseDragDelta(Vec2* pOut, MouseButton button = 0, float lock_threshold = -1.0f) @extern("igGetMouseDragDelta") @local;
fn Vec2 get_mouse_drag_delta(MouseButton button = 0, float lock_threshold = -1.0f) @inline {
	Vec2 pOut;
	igGetMouseDragDelta(&pOut, button, lock_threshold);
	return pOut;
}

extern fn void igGetContentRegionAvail(Vec2* pOut) @extern("igGetContentRegionAvail") @local;
fn Vec2 get_content_region_avail() @inline {
	Vec2 pOut;
	igGetContentRegionAvail(&pOut);
	return pOut;
}

extern fn void igGetCursorPos(Vec2* pOut) @extern("igGetCursorPos") @local;
fn Vec2 get_cursor_pos() @inline {
	Vec2 pOut;
	igGetCursorPos(&pOut);
	return pOut;
}

extern fn void igGetWindowSize(Vec2* pOut) @extern("igGetWindowSize") @local;
fn Vec2 get_window_size() @inline {
	Vec2 pOut;
	igGetWindowSize(&pOut);
	return pOut;
}

extern fn void igGetMousePosOnOpeningCurrentPopup(Vec2* pOut) @extern("igGetMousePosOnOpeningCurrentPopup") @local;
fn Vec2 get_mouse_pos_on_opening_current_popup() @inline {
	Vec2 pOut;
	igGetMousePosOnOpeningCurrentPopup(&pOut);
	return pOut;
}

extern fn void igGetCursorScreenPos(Vec2* pOut) @extern("igGetCursorScreenPos") @local;
fn Vec2 get_cursor_screen_pos() @inline {
	Vec2 pOut;
	igGetCursorScreenPos(&pOut);
	return pOut;
}

extern fn void igGetItemRectSize(Vec2* pOut) @extern("igGetItemRectSize") @local;
fn Vec2 get_item_rect_size() @inline {
	Vec2 pOut;
	igGetItemRectSize(&pOut);
	return pOut;
}

extern fn void igGetWindowPos(Vec2* pOut) @extern("igGetWindowPos") @local;
fn Vec2 get_window_pos() @inline {
	Vec2 pOut;
	igGetWindowPos(&pOut);
	return pOut;
}

extern fn void imColorHsv(Color* pOut, float h, float s, float v, float a = 1.0f) @extern("ImColor_HSV") @local;
fn Color color_hsv(float h, float s, float v, float a = 1.0f) @inline {
	Color pOut;
	imColorHsv(&pOut, h, s, v, a);
	return pOut;
}

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

extern fn void imFontCalcTextSizeA(Vec2* pOut, Font* self, float size, float max_width, float wrap_width, ZString text_begin, ZString text_end = null, ZString remaining = null) @extern("ImFont_CalcTextSizeA") @local;
fn Vec2 Font.calc_text_size_a(Font* self, float size, float max_width, float wrap_width, ZString text_begin, ZString text_end = null, ZString remaining = null) @inline {
	Vec2 pOut;
	imFontCalcTextSizeA(&pOut, self, size, max_width, wrap_width, text_begin, text_end, remaining);
	return pOut;
}

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

