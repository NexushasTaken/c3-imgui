module imgui;

extern fn void igGetMousePos(ImVec2* pOut) @extern("igGetMousePos") @local;
fn ImVec2 get_mouse_pos() @inline {
	ImVec2 pOut;
	igGetMousePos(&pOut);
	return pOut;
}

extern fn void igGetItemRectMax(ImVec2* pOut) @extern("igGetItemRectMax") @local;
fn ImVec2 get_item_rect_max() @inline {
	ImVec2 pOut;
	igGetItemRectMax(&pOut);
	return pOut;
}

extern fn void igGetFontTexUvWhitePixel(ImVec2* pOut) @extern("igGetFontTexUvWhitePixel") @local;
fn ImVec2 get_font_tex_uv_white_pixel() @inline {
	ImVec2 pOut;
	igGetFontTexUvWhitePixel(&pOut);
	return pOut;
}

extern fn void igGetItemRectMin(ImVec2* pOut) @extern("igGetItemRectMin") @local;
fn ImVec2 get_item_rect_min() @inline {
	ImVec2 pOut;
	igGetItemRectMin(&pOut);
	return pOut;
}

extern fn void igColorConvertU32ToFloat4(ImVec4* pOut, ImU32 in) @extern("igColorConvertU32ToFloat4") @local;
fn ImVec4 color_convert_u32_to_float4(ImU32 in) @inline {
	ImVec4 pOut;
	igColorConvertU32ToFloat4(&pOut, in);
	return pOut;
}

extern fn void igGetCursorStartPos(ImVec2* pOut) @extern("igGetCursorStartPos") @local;
fn ImVec2 get_cursor_start_pos() @inline {
	ImVec2 pOut;
	igGetCursorStartPos(&pOut);
	return pOut;
}

extern fn void igCalcTextSize(ImVec2* pOut, ZString text, ZString text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f) @extern("igCalcTextSize") @local;
fn ImVec2 calc_text_size(ZString text, ZString text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f) @inline {
	ImVec2 pOut;
	igCalcTextSize(&pOut, text, text_end, hide_text_after_double_hash, wrap_width);
	return pOut;
}

extern fn void igGetMouseDragDelta(ImVec2* pOut, ImGuiMouseButton button = 0, float lock_threshold = -1.0f) @extern("igGetMouseDragDelta") @local;
fn ImVec2 get_mouse_drag_delta(ImGuiMouseButton button = 0, float lock_threshold = -1.0f) @inline {
	ImVec2 pOut;
	igGetMouseDragDelta(&pOut, button, lock_threshold);
	return pOut;
}

extern fn void igGetContentRegionAvail(ImVec2* pOut) @extern("igGetContentRegionAvail") @local;
fn ImVec2 get_content_region_avail() @inline {
	ImVec2 pOut;
	igGetContentRegionAvail(&pOut);
	return pOut;
}

extern fn void igGetCursorPos(ImVec2* pOut) @extern("igGetCursorPos") @local;
fn ImVec2 get_cursor_pos() @inline {
	ImVec2 pOut;
	igGetCursorPos(&pOut);
	return pOut;
}

extern fn void igGetWindowSize(ImVec2* pOut) @extern("igGetWindowSize") @local;
fn ImVec2 get_window_size() @inline {
	ImVec2 pOut;
	igGetWindowSize(&pOut);
	return pOut;
}

extern fn void igGetMousePosOnOpeningCurrentPopup(ImVec2* pOut) @extern("igGetMousePosOnOpeningCurrentPopup") @local;
fn ImVec2 get_mouse_pos_on_opening_current_popup() @inline {
	ImVec2 pOut;
	igGetMousePosOnOpeningCurrentPopup(&pOut);
	return pOut;
}

extern fn void igGetCursorScreenPos(ImVec2* pOut) @extern("igGetCursorScreenPos") @local;
fn ImVec2 get_cursor_screen_pos() @inline {
	ImVec2 pOut;
	igGetCursorScreenPos(&pOut);
	return pOut;
}

extern fn void igGetItemRectSize(ImVec2* pOut) @extern("igGetItemRectSize") @local;
fn ImVec2 get_item_rect_size() @inline {
	ImVec2 pOut;
	igGetItemRectSize(&pOut);
	return pOut;
}

extern fn void igGetWindowPos(ImVec2* pOut) @extern("igGetWindowPos") @local;
fn ImVec2 get_window_pos() @inline {
	ImVec2 pOut;
	igGetWindowPos(&pOut);
	return pOut;
}

extern fn void imColorHsv(ImColor* pOut, float h, float s, float v, float a = 1.0f) @extern("ImColor_HSV") @local;
fn ImColor im_color_hsv(float h, float s, float v, float a = 1.0f) @inline {
	ImColor pOut;
	imColorHsv(&pOut, h, s, v, a);
	return pOut;
}

extern fn void imDrawListGetClipRectMax(ImVec2* pOut, ImDrawList* self) @extern("ImDrawList_GetClipRectMax") @local;
fn ImVec2 ImDrawList.get_clip_rect_max(ImDrawList* self) @inline {
	ImVec2 pOut;
	imDrawListGetClipRectMax(&pOut, self);
	return pOut;
}

extern fn void imDrawListGetClipRectMin(ImVec2* pOut, ImDrawList* self) @extern("ImDrawList_GetClipRectMin") @local;
fn ImVec2 ImDrawList.get_clip_rect_min(ImDrawList* self) @inline {
	ImVec2 pOut;
	imDrawListGetClipRectMin(&pOut, self);
	return pOut;
}

extern fn void imFontCalcTextSizeA(ImVec2* pOut, ImFont* self, float size, float max_width, float wrap_width, ZString text_begin, ZString text_end = null, ZString remaining = null) @extern("ImFont_CalcTextSizeA") @local;
fn ImVec2 ImFont.calc_text_size_a(ImFont* self, float size, float max_width, float wrap_width, ZString text_begin, ZString text_end = null, ZString remaining = null) @inline {
	ImVec2 pOut;
	imFontCalcTextSizeA(&pOut, self, size, max_width, wrap_width, text_begin, text_end, remaining);
	return pOut;
}

extern fn void imGuiViewportGetCenter(ImVec2* pOut, ImGuiViewport* self) @extern("ImGuiViewport_GetCenter") @local;
fn ImVec2 ImGuiViewport.get_center(ImGuiViewport* self) @inline {
	ImVec2 pOut;
	imGuiViewportGetCenter(&pOut, self);
	return pOut;
}

extern fn void imGuiViewportGetWorkCenter(ImVec2* pOut, ImGuiViewport* self) @extern("ImGuiViewport_GetWorkCenter") @local;
fn ImVec2 ImGuiViewport.get_work_center(ImGuiViewport* self) @inline {
	ImVec2 pOut;
	imGuiViewportGetWorkCenter(&pOut, self);
	return pOut;
}

