module imgui;

// ImDrawFlags_
def ImDrawFlags = int;
const ImDrawFlags IM_DRAW_FLAGS_NONE                       = 0;
const ImDrawFlags IM_DRAW_FLAGS_CLOSED                     = 1 << 0;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_TOP_LEFT     = 1 << 4;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_TOP_RIGHT    = 1 << 5;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_BOTTOM_LEFT  = 1 << 6;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_BOTTOM_RIGHT = 1 << 7;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_NONE         = 1 << 8;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_TOP          = IM_DRAW_FLAGS_ROUND_CORNERS_TOP_LEFT | IM_DRAW_FLAGS_ROUND_CORNERS_TOP_RIGHT;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_BOTTOM       = IM_DRAW_FLAGS_ROUND_CORNERS_BOTTOM_LEFT | IM_DRAW_FLAGS_ROUND_CORNERS_BOTTOM_RIGHT;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_LEFT         = IM_DRAW_FLAGS_ROUND_CORNERS_BOTTOM_LEFT | IM_DRAW_FLAGS_ROUND_CORNERS_TOP_LEFT;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_RIGHT        = IM_DRAW_FLAGS_ROUND_CORNERS_BOTTOM_RIGHT | IM_DRAW_FLAGS_ROUND_CORNERS_TOP_RIGHT;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_ALL          = IM_DRAW_FLAGS_ROUND_CORNERS_TOP_LEFT | IM_DRAW_FLAGS_ROUND_CORNERS_TOP_RIGHT | IM_DRAW_FLAGS_ROUND_CORNERS_BOTTOM_LEFT | IM_DRAW_FLAGS_ROUND_CORNERS_BOTTOM_RIGHT;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_DEFAULT      = IM_DRAW_FLAGS_ROUND_CORNERS_ALL;
const ImDrawFlags IM_DRAW_FLAGS_ROUND_CORNERS_MASK         = IM_DRAW_FLAGS_ROUND_CORNERS_ALL | IM_DRAW_FLAGS_ROUND_CORNERS_NONE;

// ImGuiButtonFlags_
def ImGuiButtonFlags = int;
const ImGuiButtonFlags IM_GUI_BUTTON_FLAGS_NONE                = 0;
const ImGuiButtonFlags IM_GUI_BUTTON_FLAGS_MOUSE_BUTTON_LEFT   = 1 << 0;
const ImGuiButtonFlags IM_GUI_BUTTON_FLAGS_MOUSE_BUTTON_RIGHT  = 1 << 1;
const ImGuiButtonFlags IM_GUI_BUTTON_FLAGS_MOUSE_BUTTON_MIDDLE = 1 << 2;
const ImGuiButtonFlags IM_GUI_BUTTON_FLAGS_MOUSE_BUTTON_MASK   = IM_GUI_BUTTON_FLAGS_MOUSE_BUTTON_LEFT | IM_GUI_BUTTON_FLAGS_MOUSE_BUTTON_RIGHT | IM_GUI_BUTTON_FLAGS_MOUSE_BUTTON_MIDDLE;
const ImGuiButtonFlags IM_GUI_BUTTON_FLAGS_ENABLE_NAV          = 1 << 3;

// ImFontAtlasFlags_
def ImFontAtlasFlags = int;
const ImFontAtlasFlags IM_FONT_ATLAS_FLAGS_NONE                   = 0;
const ImFontAtlasFlags IM_FONT_ATLAS_FLAGS_NO_POWER_OF_TWO_HEIGHT = 1 << 0;
const ImFontAtlasFlags IM_FONT_ATLAS_FLAGS_NO_MOUSE_CURSORS       = 1 << 1;
const ImFontAtlasFlags IM_FONT_ATLAS_FLAGS_NO_BAKED_LINES         = 1 << 2;

// ImGuiTableRowFlags_
def ImGuiTableRowFlags = int;
const ImGuiTableRowFlags IM_GUI_TABLE_ROW_FLAGS_NONE    = 0;
const ImGuiTableRowFlags IM_GUI_TABLE_ROW_FLAGS_HEADERS = 1 << 0;

// ImGuiCond_
def ImGuiCond = int;
const ImGuiCond IM_GUI_COND_NONE           = 0;
const ImGuiCond IM_GUI_COND_ALWAYS         = 1 << 0;
const ImGuiCond IM_GUI_COND_ONCE           = 1 << 1;
const ImGuiCond IM_GUI_COND_FIRST_USE_EVER = 1 << 2;
const ImGuiCond IM_GUI_COND_APPEARING      = 1 << 3;

// ImGuiPopupFlags_
def ImGuiPopupFlags = int;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_NONE                        = 0;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_MOUSE_BUTTON_LEFT           = 0;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_MOUSE_BUTTON_RIGHT          = 1;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_MOUSE_BUTTON_MIDDLE         = 2;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_MOUSE_BUTTON_MASK           = 0x1F;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_MOUSE_BUTTON_DEFAULT        = 1;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_NO_REOPEN                   = 1 << 5;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_NO_OPEN_OVER_EXISTING_POPUP = 1 << 7;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_NO_OPEN_OVER_ITEMS          = 1 << 8;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_ANY_POPUP_ID                = 1 << 10;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_ANY_POPUP_LEVEL             = 1 << 11;
const ImGuiPopupFlags IM_GUI_POPUP_FLAGS_ANY_POPUP                   = IM_GUI_POPUP_FLAGS_ANY_POPUP_ID | IM_GUI_POPUP_FLAGS_ANY_POPUP_LEVEL;

// ImGuiSelectionRequestType
def ImGuiSelectionRequestType = int;
const ImGuiSelectionRequestType IM_GUI_SELECTION_REQUEST_TYPE_NONE      = 0;
const ImGuiSelectionRequestType IM_GUI_SELECTION_REQUEST_TYPE_SET_ALL   = 1;
const ImGuiSelectionRequestType IM_GUI_SELECTION_REQUEST_TYPE_SET_RANGE = 2;

// ImGuiDragDropFlags_
def ImGuiDragDropFlags = int;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_NONE                          = 0;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_SOURCE_NO_PREVIEW_TOOLTIP     = 1 << 0;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_SOURCE_NO_DISABLE_HOVER       = 1 << 1;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_SOURCE_NO_HOLD_TO_OPEN_OTHERS = 1 << 2;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_SOURCE_ALLOW_NULL_ID          = 1 << 3;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_SOURCE_EXTERN                 = 1 << 4;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_PAYLOAD_AUTO_EXPIRE           = 1 << 5;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_PAYLOAD_NO_CROSS_CONTEXT      = 1 << 6;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_PAYLOAD_NO_CROSS_PROCESS      = 1 << 7;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_ACCEPT_BEFORE_DELIVERY        = 1 << 10;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_ACCEPT_NO_DRAW_DEFAULT_RECT   = 1 << 11;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_ACCEPT_NO_PREVIEW_TOOLTIP     = 1 << 12;
const ImGuiDragDropFlags IM_GUI_DRAG_DROP_FLAGS_ACCEPT_PEEK_ONLY              = IM_GUI_DRAG_DROP_FLAGS_ACCEPT_BEFORE_DELIVERY | IM_GUI_DRAG_DROP_FLAGS_ACCEPT_NO_DRAW_DEFAULT_RECT;

// ImGuiBackendFlags_
def ImGuiBackendFlags = int;
const ImGuiBackendFlags IM_GUI_BACKEND_FLAGS_NONE                    = 0;
const ImGuiBackendFlags IM_GUI_BACKEND_FLAGS_HAS_GAMEPAD             = 1 << 0;
const ImGuiBackendFlags IM_GUI_BACKEND_FLAGS_HAS_MOUSE_CURSORS       = 1 << 1;
const ImGuiBackendFlags IM_GUI_BACKEND_FLAGS_HAS_SET_MOUSE_POS       = 1 << 2;
const ImGuiBackendFlags IM_GUI_BACKEND_FLAGS_RENDERER_HAS_VTX_OFFSET = 1 << 3;

// ImGuiTableColumnFlags_
def ImGuiTableColumnFlags = int;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_NONE                   = 0;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_DISABLED               = 1 << 0;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_DEFAULT_HIDE           = 1 << 1;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_DEFAULT_SORT           = 1 << 2;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_WIDTH_STRETCH          = 1 << 3;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_WIDTH_FIXED            = 1 << 4;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_NO_RESIZE              = 1 << 5;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_NO_REORDER             = 1 << 6;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_NO_HIDE                = 1 << 7;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_NO_CLIP                = 1 << 8;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_NO_SORT                = 1 << 9;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_NO_SORT_ASCENDING      = 1 << 10;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_NO_SORT_DESCENDING     = 1 << 11;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_NO_HEADER_LABEL        = 1 << 12;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_NO_HEADER_WIDTH        = 1 << 13;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_PREFER_SORT_ASCENDING  = 1 << 14;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_PREFER_SORT_DESCENDING = 1 << 15;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_INDENT_ENABLE          = 1 << 16;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_INDENT_DISABLE         = 1 << 17;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_ANGLED_HEADER          = 1 << 18;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_IS_ENABLED             = 1 << 24;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_IS_VISIBLE             = 1 << 25;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_IS_SORTED              = 1 << 26;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_IS_HOVERED             = 1 << 27;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_WIDTH_MASK             = IM_GUI_TABLE_COLUMN_FLAGS_WIDTH_STRETCH | IM_GUI_TABLE_COLUMN_FLAGS_WIDTH_FIXED;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_INDENT_MASK            = IM_GUI_TABLE_COLUMN_FLAGS_INDENT_ENABLE | IM_GUI_TABLE_COLUMN_FLAGS_INDENT_DISABLE;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_STATUS_MASK            = IM_GUI_TABLE_COLUMN_FLAGS_IS_ENABLED | IM_GUI_TABLE_COLUMN_FLAGS_IS_VISIBLE | IM_GUI_TABLE_COLUMN_FLAGS_IS_SORTED | IM_GUI_TABLE_COLUMN_FLAGS_IS_HOVERED;
const ImGuiTableColumnFlags IM_GUI_TABLE_COLUMN_FLAGS_NO_DIRECT_RESIZE       = 1 << 30;

// ImGuiStyleVar_
def ImGuiStyleVar = int;
const ImGuiStyleVar IM_GUI_STYLE_VAR_ALPHA                           = 0;
const ImGuiStyleVar IM_GUI_STYLE_VAR_DISABLED_ALPHA                  = 1;
const ImGuiStyleVar IM_GUI_STYLE_VAR_WINDOW_PADDING                  = 2;
const ImGuiStyleVar IM_GUI_STYLE_VAR_WINDOW_ROUNDING                 = 3;
const ImGuiStyleVar IM_GUI_STYLE_VAR_WINDOW_BORDER_SIZE              = 4;
const ImGuiStyleVar IM_GUI_STYLE_VAR_WINDOW_MIN_SIZE                 = 5;
const ImGuiStyleVar IM_GUI_STYLE_VAR_WINDOW_TITLE_ALIGN              = 6;
const ImGuiStyleVar IM_GUI_STYLE_VAR_CHILD_ROUNDING                  = 7;
const ImGuiStyleVar IM_GUI_STYLE_VAR_CHILD_BORDER_SIZE               = 8;
const ImGuiStyleVar IM_GUI_STYLE_VAR_POPUP_ROUNDING                  = 9;
const ImGuiStyleVar IM_GUI_STYLE_VAR_POPUP_BORDER_SIZE               = 10;
const ImGuiStyleVar IM_GUI_STYLE_VAR_FRAME_PADDING                   = 11;
const ImGuiStyleVar IM_GUI_STYLE_VAR_FRAME_ROUNDING                  = 12;
const ImGuiStyleVar IM_GUI_STYLE_VAR_FRAME_BORDER_SIZE               = 13;
const ImGuiStyleVar IM_GUI_STYLE_VAR_ITEM_SPACING                    = 14;
const ImGuiStyleVar IM_GUI_STYLE_VAR_ITEM_INNER_SPACING              = 15;
const ImGuiStyleVar IM_GUI_STYLE_VAR_INDENT_SPACING                  = 16;
const ImGuiStyleVar IM_GUI_STYLE_VAR_CELL_PADDING                    = 17;
const ImGuiStyleVar IM_GUI_STYLE_VAR_SCROLLBAR_SIZE                  = 18;
const ImGuiStyleVar IM_GUI_STYLE_VAR_SCROLLBAR_ROUNDING              = 19;
const ImGuiStyleVar IM_GUI_STYLE_VAR_GRAB_MIN_SIZE                   = 20;
const ImGuiStyleVar IM_GUI_STYLE_VAR_GRAB_ROUNDING                   = 21;
const ImGuiStyleVar IM_GUI_STYLE_VAR_TAB_ROUNDING                    = 22;
const ImGuiStyleVar IM_GUI_STYLE_VAR_TAB_BORDER_SIZE                 = 23;
const ImGuiStyleVar IM_GUI_STYLE_VAR_TAB_BAR_BORDER_SIZE             = 24;
const ImGuiStyleVar IM_GUI_STYLE_VAR_TAB_BAR_OVERLINE_SIZE           = 25;
const ImGuiStyleVar IM_GUI_STYLE_VAR_TABLE_ANGLED_HEADERS_ANGLE      = 26;
const ImGuiStyleVar IM_GUI_STYLE_VAR_TABLE_ANGLED_HEADERS_TEXT_ALIGN = 27;
const ImGuiStyleVar IM_GUI_STYLE_VAR_BUTTON_TEXT_ALIGN               = 28;
const ImGuiStyleVar IM_GUI_STYLE_VAR_SELECTABLE_TEXT_ALIGN           = 29;
const ImGuiStyleVar IM_GUI_STYLE_VAR_SEPARATOR_TEXT_BORDER_SIZE      = 30;
const ImGuiStyleVar IM_GUI_STYLE_VAR_SEPARATOR_TEXT_ALIGN            = 31;
const ImGuiStyleVar IM_GUI_STYLE_VAR_SEPARATOR_TEXT_PADDING          = 32;
const ImGuiStyleVar IM_GUI_STYLE_VAR_COUNT                           = 33;

// ImGuiTabBarFlags_
def ImGuiTabBarFlags = int;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_NONE                              = 0;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_REORDERABLE                       = 1 << 0;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_AUTO_SELECT_NEW_TABS              = 1 << 1;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_TAB_LIST_POPUP_BUTTON             = 1 << 2;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_NO_CLOSE_WITH_MIDDLE_MOUSE_BUTTON = 1 << 3;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_NO_TAB_LIST_SCROLLING_BUTTONS     = 1 << 4;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_NO_TOOLTIP                        = 1 << 5;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_DRAW_SELECTED_OVERLINE            = 1 << 6;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_FITTING_POLICY_RESIZE_DOWN        = 1 << 7;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_FITTING_POLICY_SCROLL             = 1 << 8;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_FITTING_POLICY_MASK               = IM_GUI_TAB_BAR_FLAGS_FITTING_POLICY_RESIZE_DOWN | IM_GUI_TAB_BAR_FLAGS_FITTING_POLICY_SCROLL;
const ImGuiTabBarFlags IM_GUI_TAB_BAR_FLAGS_FITTING_POLICY_DEFAULT            = IM_GUI_TAB_BAR_FLAGS_FITTING_POLICY_RESIZE_DOWN;

// ImGuiChildFlags_
def ImGuiChildFlags = int;
const ImGuiChildFlags IM_GUI_CHILD_FLAGS_NONE                      = 0;
const ImGuiChildFlags IM_GUI_CHILD_FLAGS_BORDERS                   = 1 << 0;
const ImGuiChildFlags IM_GUI_CHILD_FLAGS_ALWAYS_USE_WINDOW_PADDING = 1 << 1;
const ImGuiChildFlags IM_GUI_CHILD_FLAGS_RESIZE_X                  = 1 << 2;
const ImGuiChildFlags IM_GUI_CHILD_FLAGS_RESIZE_Y                  = 1 << 3;
const ImGuiChildFlags IM_GUI_CHILD_FLAGS_AUTO_RESIZE_X             = 1 << 4;
const ImGuiChildFlags IM_GUI_CHILD_FLAGS_AUTO_RESIZE_Y             = 1 << 5;
const ImGuiChildFlags IM_GUI_CHILD_FLAGS_ALWAYS_AUTO_RESIZE        = 1 << 6;
const ImGuiChildFlags IM_GUI_CHILD_FLAGS_FRAME_STYLE               = 1 << 7;
const ImGuiChildFlags IM_GUI_CHILD_FLAGS_NAV_FLATTENED             = 1 << 8;

// ImGuiFreeTypeBuilderFlags
def ImGuiFreeTypeBuilderFlags = int;
const ImGuiFreeTypeBuilderFlags IM_GUI_FREE_TYPE_BUILDER_FLAGS_NO_HINTING      = 1 << 0;
const ImGuiFreeTypeBuilderFlags IM_GUI_FREE_TYPE_BUILDER_FLAGS_NO_AUTO_HINT    = 1 << 1;
const ImGuiFreeTypeBuilderFlags IM_GUI_FREE_TYPE_BUILDER_FLAGS_FORCE_AUTO_HINT = 1 << 2;
const ImGuiFreeTypeBuilderFlags IM_GUI_FREE_TYPE_BUILDER_FLAGS_LIGHT_HINTING   = 1 << 3;
const ImGuiFreeTypeBuilderFlags IM_GUI_FREE_TYPE_BUILDER_FLAGS_MONO_HINTING    = 1 << 4;
const ImGuiFreeTypeBuilderFlags IM_GUI_FREE_TYPE_BUILDER_FLAGS_BOLD            = 1 << 5;
const ImGuiFreeTypeBuilderFlags IM_GUI_FREE_TYPE_BUILDER_FLAGS_OBLIQUE         = 1 << 6;
const ImGuiFreeTypeBuilderFlags IM_GUI_FREE_TYPE_BUILDER_FLAGS_MONOCHROME      = 1 << 7;
const ImGuiFreeTypeBuilderFlags IM_GUI_FREE_TYPE_BUILDER_FLAGS_LOAD_COLOR      = 1 << 8;
const ImGuiFreeTypeBuilderFlags IM_GUI_FREE_TYPE_BUILDER_FLAGS_BITMAP          = 1 << 9;

// ImGuiMultiSelectFlags_
def ImGuiMultiSelectFlags = int;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_NONE                      = 0;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_SINGLE_SELECT             = 1 << 0;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_NO_SELECT_ALL             = 1 << 1;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_NO_RANGE_SELECT           = 1 << 2;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_NO_AUTO_SELECT            = 1 << 3;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_NO_AUTO_CLEAR             = 1 << 4;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_NO_AUTO_CLEAR_ON_RESELECT = 1 << 5;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_BOX_SELECT1D              = 1 << 6;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_BOX_SELECT2D              = 1 << 7;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_BOX_SELECT_NO_SCROLL      = 1 << 8;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_CLEAR_ON_ESCAPE           = 1 << 9;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_CLEAR_ON_CLICK_VOID       = 1 << 10;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_SCOPE_WINDOW              = 1 << 11;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_SCOPE_RECT                = 1 << 12;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_SELECT_ON_CLICK           = 1 << 13;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_SELECT_ON_CLICK_RELEASE   = 1 << 14;
const ImGuiMultiSelectFlags IM_GUI_MULTI_SELECT_FLAGS_NAV_WRAP_X                = 1 << 16;

// ImGuiSelectableFlags_
def ImGuiSelectableFlags = int;
const ImGuiSelectableFlags IM_GUI_SELECTABLE_FLAGS_NONE                 = 0;
const ImGuiSelectableFlags IM_GUI_SELECTABLE_FLAGS_NO_AUTO_CLOSE_POPUPS = 1 << 0;
const ImGuiSelectableFlags IM_GUI_SELECTABLE_FLAGS_SPAN_ALL_COLUMNS     = 1 << 1;
const ImGuiSelectableFlags IM_GUI_SELECTABLE_FLAGS_ALLOW_DOUBLE_CLICK   = 1 << 2;
const ImGuiSelectableFlags IM_GUI_SELECTABLE_FLAGS_DISABLED             = 1 << 3;
const ImGuiSelectableFlags IM_GUI_SELECTABLE_FLAGS_ALLOW_OVERLAP        = 1 << 4;
const ImGuiSelectableFlags IM_GUI_SELECTABLE_FLAGS_HIGHLIGHT            = 1 << 5;

// ImGuiDir
def ImGuiDir = int;
const ImGuiDir IM_GUI_DIR_NONE  = -1;
const ImGuiDir IM_GUI_DIR_LEFT  = 0;
const ImGuiDir IM_GUI_DIR_RIGHT = 1;
const ImGuiDir IM_GUI_DIR_UP    = 2;
const ImGuiDir IM_GUI_DIR_DOWN  = 3;
const ImGuiDir IM_GUI_DIR_COUNT = 4;

// ImGuiTableFlags_
def ImGuiTableFlags = int;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_NONE                            = 0;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_RESIZABLE                       = 1 << 0;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_REORDERABLE                     = 1 << 1;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_HIDEABLE                        = 1 << 2;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_SORTABLE                        = 1 << 3;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_NO_SAVED_SETTINGS               = 1 << 4;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_CONTEXT_MENU_IN_BODY            = 1 << 5;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_ROW_BG                          = 1 << 6;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_BORDERS_INNER_H                 = 1 << 7;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_BORDERS_OUTER_H                 = 1 << 8;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_BORDERS_INNER_V                 = 1 << 9;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_BORDERS_OUTER_V                 = 1 << 10;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_BORDERS_H                       = IM_GUI_TABLE_FLAGS_BORDERS_INNER_H | IM_GUI_TABLE_FLAGS_BORDERS_OUTER_H;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_BORDERS_V                       = IM_GUI_TABLE_FLAGS_BORDERS_INNER_V | IM_GUI_TABLE_FLAGS_BORDERS_OUTER_V;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_BORDERS_INNER                   = IM_GUI_TABLE_FLAGS_BORDERS_INNER_V | IM_GUI_TABLE_FLAGS_BORDERS_INNER_H;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_BORDERS_OUTER                   = IM_GUI_TABLE_FLAGS_BORDERS_OUTER_V | IM_GUI_TABLE_FLAGS_BORDERS_OUTER_H;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_BORDERS                         = IM_GUI_TABLE_FLAGS_BORDERS_INNER | IM_GUI_TABLE_FLAGS_BORDERS_OUTER;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_NO_BORDERS_IN_BODY              = 1 << 11;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_NO_BORDERS_IN_BODY_UNTIL_RESIZE = 1 << 12;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_SIZING_FIXED_FIT                = 1 << 13;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_SIZING_FIXED_SAME               = 2 << 13;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_SIZING_STRETCH_PROP             = 3 << 13;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_SIZING_STRETCH_SAME             = 4 << 13;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_NO_HOST_EXTEND_X                = 1 << 16;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_NO_HOST_EXTEND_Y                = 1 << 17;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_NO_KEEP_COLUMNS_VISIBLE         = 1 << 18;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_PRECISE_WIDTHS                  = 1 << 19;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_NO_CLIP                         = 1 << 20;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_PAD_OUTER_X                     = 1 << 21;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_NO_PAD_OUTER_X                  = 1 << 22;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_NO_PAD_INNER_X                  = 1 << 23;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_SCROLL_X                        = 1 << 24;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_SCROLL_Y                        = 1 << 25;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_SORT_MULTI                      = 1 << 26;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_SORT_TRISTATE                   = 1 << 27;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_HIGHLIGHT_HOVERED_COLUMN        = 1 << 28;
const ImGuiTableFlags IM_GUI_TABLE_FLAGS_SIZING_MASK                     = IM_GUI_TABLE_FLAGS_SIZING_FIXED_FIT | IM_GUI_TABLE_FLAGS_SIZING_FIXED_SAME | IM_GUI_TABLE_FLAGS_SIZING_STRETCH_PROP | IM_GUI_TABLE_FLAGS_SIZING_STRETCH_SAME;

// ImGuiColorEditFlags_
def ImGuiColorEditFlags = int;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_NONE               = 0;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_NO_ALPHA           = 1 << 1;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_NO_PICKER          = 1 << 2;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_NO_OPTIONS         = 1 << 3;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_NO_SMALL_PREVIEW   = 1 << 4;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_NO_INPUTS          = 1 << 5;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_NO_TOOLTIP         = 1 << 6;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_NO_LABEL           = 1 << 7;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_NO_SIDE_PREVIEW    = 1 << 8;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_NO_DRAG_DROP       = 1 << 9;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_NO_BORDER          = 1 << 10;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_ALPHA_BAR          = 1 << 16;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_ALPHA_PREVIEW      = 1 << 17;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_ALPHA_PREVIEW_HALF = 1 << 18;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_HDR                = 1 << 19;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_DISPLAY_RGB        = 1 << 20;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_DISPLAY_HSV        = 1 << 21;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_DISPLAY_HEX        = 1 << 22;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_UINT8              = 1 << 23;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_FLOAT              = 1 << 24;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_PICKER_HUE_BAR     = 1 << 25;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_PICKER_HUE_WHEEL   = 1 << 26;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_INPUT_RGB          = 1 << 27;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_INPUT_HSV          = 1 << 28;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_DEFAULT_OPTIONS    = IM_GUI_COLOR_EDIT_FLAGS_UINT8 | IM_GUI_COLOR_EDIT_FLAGS_DISPLAY_RGB | IM_GUI_COLOR_EDIT_FLAGS_INPUT_RGB | IM_GUI_COLOR_EDIT_FLAGS_PICKER_HUE_BAR;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_DISPLAY_MASK       = IM_GUI_COLOR_EDIT_FLAGS_DISPLAY_RGB | IM_GUI_COLOR_EDIT_FLAGS_DISPLAY_HSV | IM_GUI_COLOR_EDIT_FLAGS_DISPLAY_HEX;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_DATA_TYPE_MASK     = IM_GUI_COLOR_EDIT_FLAGS_UINT8 | IM_GUI_COLOR_EDIT_FLAGS_FLOAT;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_PICKER_MASK        = IM_GUI_COLOR_EDIT_FLAGS_PICKER_HUE_WHEEL | IM_GUI_COLOR_EDIT_FLAGS_PICKER_HUE_BAR;
const ImGuiColorEditFlags IM_GUI_COLOR_EDIT_FLAGS_INPUT_MASK         = IM_GUI_COLOR_EDIT_FLAGS_INPUT_RGB | IM_GUI_COLOR_EDIT_FLAGS_INPUT_HSV;

// ImGuiHoveredFlags_
def ImGuiHoveredFlags = int;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_NONE                              = 0;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_CHILD_WINDOWS                     = 1 << 0;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_ROOT_WINDOW                       = 1 << 1;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_ANY_WINDOW                        = 1 << 2;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_NO_POPUP_HIERARCHY                = 1 << 3;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_ALLOW_WHEN_BLOCKED_BY_POPUP       = 1 << 5;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_ALLOW_WHEN_BLOCKED_BY_ACTIVE_ITEM = 1 << 7;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED_BY_ITEM     = 1 << 8;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED_BY_WINDOW   = 1 << 9;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_ALLOW_WHEN_DISABLED               = 1 << 10;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_NO_NAV_OVERRIDE                   = 1 << 11;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED             = IM_GUI_HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED_BY_ITEM | IM_GUI_HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED_BY_WINDOW;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_RECT_ONLY                         = IM_GUI_HOVERED_FLAGS_ALLOW_WHEN_BLOCKED_BY_POPUP | IM_GUI_HOVERED_FLAGS_ALLOW_WHEN_BLOCKED_BY_ACTIVE_ITEM | IM_GUI_HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_ROOT_AND_CHILD_WINDOWS            = IM_GUI_HOVERED_FLAGS_ROOT_WINDOW | IM_GUI_HOVERED_FLAGS_CHILD_WINDOWS;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_FOR_TOOLTIP                       = 1 << 12;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_STATIONARY                        = 1 << 13;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_DELAY_NONE                        = 1 << 14;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_DELAY_SHORT                       = 1 << 15;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_DELAY_NORMAL                      = 1 << 16;
const ImGuiHoveredFlags IM_GUI_HOVERED_FLAGS_NO_SHARED_DELAY                   = 1 << 17;

// ImGuiInputFlags_
def ImGuiInputFlags = int;
const ImGuiInputFlags IM_GUI_INPUT_FLAGS_NONE                    = 0;
const ImGuiInputFlags IM_GUI_INPUT_FLAGS_REPEAT                  = 1 << 0;
const ImGuiInputFlags IM_GUI_INPUT_FLAGS_ROUTE_ACTIVE            = 1 << 10;
const ImGuiInputFlags IM_GUI_INPUT_FLAGS_ROUTE_FOCUSED           = 1 << 11;
const ImGuiInputFlags IM_GUI_INPUT_FLAGS_ROUTE_GLOBAL            = 1 << 12;
const ImGuiInputFlags IM_GUI_INPUT_FLAGS_ROUTE_ALWAYS            = 1 << 13;
const ImGuiInputFlags IM_GUI_INPUT_FLAGS_ROUTE_OVER_FOCUSED      = 1 << 14;
const ImGuiInputFlags IM_GUI_INPUT_FLAGS_ROUTE_OVER_ACTIVE       = 1 << 15;
const ImGuiInputFlags IM_GUI_INPUT_FLAGS_ROUTE_UNLESS_BG_FOCUSED = 1 << 16;
const ImGuiInputFlags IM_GUI_INPUT_FLAGS_ROUTE_FROM_ROOT_WINDOW  = 1 << 17;
const ImGuiInputFlags IM_GUI_INPUT_FLAGS_TOOLTIP                 = 1 << 18;

// ImGuiViewportFlags_
def ImGuiViewportFlags = int;
const ImGuiViewportFlags IM_GUI_VIEWPORT_FLAGS_NONE                = 0;
const ImGuiViewportFlags IM_GUI_VIEWPORT_FLAGS_IS_PLATFORM_WINDOW  = 1 << 0;
const ImGuiViewportFlags IM_GUI_VIEWPORT_FLAGS_IS_PLATFORM_MONITOR = 1 << 1;
const ImGuiViewportFlags IM_GUI_VIEWPORT_FLAGS_OWNED_BY_APP        = 1 << 2;

// ImGuiFocusedFlags_
def ImGuiFocusedFlags = int;
const ImGuiFocusedFlags IM_GUI_FOCUSED_FLAGS_NONE                   = 0;
const ImGuiFocusedFlags IM_GUI_FOCUSED_FLAGS_CHILD_WINDOWS          = 1 << 0;
const ImGuiFocusedFlags IM_GUI_FOCUSED_FLAGS_ROOT_WINDOW            = 1 << 1;
const ImGuiFocusedFlags IM_GUI_FOCUSED_FLAGS_ANY_WINDOW             = 1 << 2;
const ImGuiFocusedFlags IM_GUI_FOCUSED_FLAGS_NO_POPUP_HIERARCHY     = 1 << 3;
const ImGuiFocusedFlags IM_GUI_FOCUSED_FLAGS_ROOT_AND_CHILD_WINDOWS = IM_GUI_FOCUSED_FLAGS_ROOT_WINDOW | IM_GUI_FOCUSED_FLAGS_CHILD_WINDOWS;

// ImGuiSortDirection
def ImGuiSortDirection = ImU8;
const ImGuiSortDirection IM_GUI_SORT_DIRECTION_NONE       = 0;
const ImGuiSortDirection IM_GUI_SORT_DIRECTION_ASCENDING  = 1;
const ImGuiSortDirection IM_GUI_SORT_DIRECTION_DESCENDING = 2;

// ImGuiInputTextFlags_
def ImGuiInputTextFlags = int;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_NONE                    = 0;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CHARS_DECIMAL           = 1 << 0;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CHARS_HEXADECIMAL       = 1 << 1;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CHARS_SCIENTIFIC        = 1 << 2;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CHARS_UPPERCASE         = 1 << 3;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CHARS_NO_BLANK          = 1 << 4;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_ALLOW_TAB_INPUT         = 1 << 5;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_ENTER_RETURNS_TRUE      = 1 << 6;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_ESCAPE_CLEARS_ALL       = 1 << 7;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CTRL_ENTER_FOR_NEW_LINE = 1 << 8;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_READ_ONLY               = 1 << 9;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_PASSWORD                = 1 << 10;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_ALWAYS_OVERWRITE        = 1 << 11;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_AUTO_SELECT_ALL         = 1 << 12;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_PARSE_EMPTY_REF_VAL     = 1 << 13;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_DISPLAY_EMPTY_REF_VAL   = 1 << 14;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_NO_HORIZONTAL_SCROLL    = 1 << 15;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_NO_UNDO_REDO            = 1 << 16;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CALLBACK_COMPLETION     = 1 << 17;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CALLBACK_HISTORY        = 1 << 18;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CALLBACK_ALWAYS         = 1 << 19;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CALLBACK_CHAR_FILTER    = 1 << 20;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CALLBACK_RESIZE         = 1 << 21;
const ImGuiInputTextFlags IM_GUI_INPUT_TEXT_FLAGS_CALLBACK_EDIT           = 1 << 22;

// ImGuiMouseButton_
def ImGuiMouseButton = int;
const ImGuiMouseButton IM_GUI_MOUSE_BUTTON_LEFT   = 0;
const ImGuiMouseButton IM_GUI_MOUSE_BUTTON_RIGHT  = 1;
const ImGuiMouseButton IM_GUI_MOUSE_BUTTON_MIDDLE = 2;
const ImGuiMouseButton IM_GUI_MOUSE_BUTTON_COUNT  = 5;

// ImGuiSliderFlags_
def ImGuiSliderFlags = int;
const ImGuiSliderFlags IM_GUI_SLIDER_FLAGS_NONE               = 0;
const ImGuiSliderFlags IM_GUI_SLIDER_FLAGS_LOGARITHMIC        = 1 << 5;
const ImGuiSliderFlags IM_GUI_SLIDER_FLAGS_NO_ROUND_TO_FORMAT = 1 << 6;
const ImGuiSliderFlags IM_GUI_SLIDER_FLAGS_NO_INPUT           = 1 << 7;
const ImGuiSliderFlags IM_GUI_SLIDER_FLAGS_WRAP_AROUND        = 1 << 8;
const ImGuiSliderFlags IM_GUI_SLIDER_FLAGS_CLAMP_ON_INPUT     = 1 << 9;
const ImGuiSliderFlags IM_GUI_SLIDER_FLAGS_CLAMP_ZERO_RANGE   = 1 << 10;
const ImGuiSliderFlags IM_GUI_SLIDER_FLAGS_ALWAYS_CLAMP       = IM_GUI_SLIDER_FLAGS_CLAMP_ON_INPUT | IM_GUI_SLIDER_FLAGS_CLAMP_ZERO_RANGE;
const ImGuiSliderFlags IM_GUI_SLIDER_FLAGS_INVALID_MASK       = 0x7000000F;

// ImGuiItemFlags_
def ImGuiItemFlags = int;
const ImGuiItemFlags IM_GUI_ITEM_FLAGS_NONE                 = 0;
const ImGuiItemFlags IM_GUI_ITEM_FLAGS_NO_TAB_STOP          = 1 << 0;
const ImGuiItemFlags IM_GUI_ITEM_FLAGS_NO_NAV               = 1 << 1;
const ImGuiItemFlags IM_GUI_ITEM_FLAGS_NO_NAV_DEFAULT_FOCUS = 1 << 2;
const ImGuiItemFlags IM_GUI_ITEM_FLAGS_BUTTON_REPEAT        = 1 << 3;
const ImGuiItemFlags IM_GUI_ITEM_FLAGS_AUTO_CLOSE_POPUPS    = 1 << 4;
const ImGuiItemFlags IM_GUI_ITEM_FLAGS_ALLOW_DUPLICATE_ID   = 1 << 5;

// ImGuiDataType_
def ImGuiDataType = int;
const ImGuiDataType IM_GUI_DATA_TYPE_S8     = 0;
const ImGuiDataType IM_GUI_DATA_TYPE_U8     = 1;
const ImGuiDataType IM_GUI_DATA_TYPE_S16    = 2;
const ImGuiDataType IM_GUI_DATA_TYPE_U16    = 3;
const ImGuiDataType IM_GUI_DATA_TYPE_S32    = 4;
const ImGuiDataType IM_GUI_DATA_TYPE_U32    = 5;
const ImGuiDataType IM_GUI_DATA_TYPE_S64    = 6;
const ImGuiDataType IM_GUI_DATA_TYPE_U64    = 7;
const ImGuiDataType IM_GUI_DATA_TYPE_FLOAT  = 8;
const ImGuiDataType IM_GUI_DATA_TYPE_DOUBLE = 9;
const ImGuiDataType IM_GUI_DATA_TYPE_BOOL   = 10;
const ImGuiDataType IM_GUI_DATA_TYPE_COUNT  = 11;

// ImGuiTreeNodeFlags_
def ImGuiTreeNodeFlags = int;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_NONE                     = 0;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_SELECTED                 = 1 << 0;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_FRAMED                   = 1 << 1;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_ALLOW_OVERLAP            = 1 << 2;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_NO_TREE_PUSH_ON_OPEN     = 1 << 3;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_NO_AUTO_OPEN_ON_LOG      = 1 << 4;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_DEFAULT_OPEN             = 1 << 5;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_OPEN_ON_DOUBLE_CLICK     = 1 << 6;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_OPEN_ON_ARROW            = 1 << 7;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_LEAF                     = 1 << 8;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_BULLET                   = 1 << 9;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_FRAME_PADDING            = 1 << 10;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_SPAN_AVAIL_WIDTH         = 1 << 11;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_SPAN_FULL_WIDTH          = 1 << 12;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_SPAN_TEXT_WIDTH          = 1 << 13;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_SPAN_ALL_COLUMNS         = 1 << 14;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_NAV_LEFT_JUMPS_BACK_HERE = 1 << 15;
const ImGuiTreeNodeFlags IM_GUI_TREE_NODE_FLAGS_COLLAPSING_HEADER        = IM_GUI_TREE_NODE_FLAGS_FRAMED | IM_GUI_TREE_NODE_FLAGS_NO_TREE_PUSH_ON_OPEN | IM_GUI_TREE_NODE_FLAGS_NO_AUTO_OPEN_ON_LOG;

// ImGuiTableBgTarget_
def ImGuiTableBgTarget = int;
const ImGuiTableBgTarget IM_GUI_TABLE_BG_TARGET_NONE    = 0;
const ImGuiTableBgTarget IM_GUI_TABLE_BG_TARGET_ROW_BG0 = 1;
const ImGuiTableBgTarget IM_GUI_TABLE_BG_TARGET_ROW_BG1 = 2;
const ImGuiTableBgTarget IM_GUI_TABLE_BG_TARGET_CELL_BG = 3;

// ImGuiConfigFlags_
def ImGuiConfigFlags = int;
const ImGuiConfigFlags IM_GUI_CONFIG_FLAGS_NONE                   = 0;
const ImGuiConfigFlags IM_GUI_CONFIG_FLAGS_NAV_ENABLE_KEYBOARD    = 1 << 0;
const ImGuiConfigFlags IM_GUI_CONFIG_FLAGS_NAV_ENABLE_GAMEPAD     = 1 << 1;
const ImGuiConfigFlags IM_GUI_CONFIG_FLAGS_NO_MOUSE               = 1 << 4;
const ImGuiConfigFlags IM_GUI_CONFIG_FLAGS_NO_MOUSE_CURSOR_CHANGE = 1 << 5;
const ImGuiConfigFlags IM_GUI_CONFIG_FLAGS_NO_KEYBOARD            = 1 << 6;
const ImGuiConfigFlags IM_GUI_CONFIG_FLAGS_IS_SRGB                = 1 << 20;
const ImGuiConfigFlags IM_GUI_CONFIG_FLAGS_IS_TOUCH_SCREEN        = 1 << 21;

// ImGuiCol_
def ImGuiCol = int;
const ImGuiCol IM_GUI_COL_TEXT                         = 0;
const ImGuiCol IM_GUI_COL_TEXT_DISABLED                = 1;
const ImGuiCol IM_GUI_COL_WINDOW_BG                    = 2;
const ImGuiCol IM_GUI_COL_CHILD_BG                     = 3;
const ImGuiCol IM_GUI_COL_POPUP_BG                     = 4;
const ImGuiCol IM_GUI_COL_BORDER                       = 5;
const ImGuiCol IM_GUI_COL_BORDER_SHADOW                = 6;
const ImGuiCol IM_GUI_COL_FRAME_BG                     = 7;
const ImGuiCol IM_GUI_COL_FRAME_BG_HOVERED             = 8;
const ImGuiCol IM_GUI_COL_FRAME_BG_ACTIVE              = 9;
const ImGuiCol IM_GUI_COL_TITLE_BG                     = 10;
const ImGuiCol IM_GUI_COL_TITLE_BG_ACTIVE              = 11;
const ImGuiCol IM_GUI_COL_TITLE_BG_COLLAPSED           = 12;
const ImGuiCol IM_GUI_COL_MENU_BAR_BG                  = 13;
const ImGuiCol IM_GUI_COL_SCROLLBAR_BG                 = 14;
const ImGuiCol IM_GUI_COL_SCROLLBAR_GRAB               = 15;
const ImGuiCol IM_GUI_COL_SCROLLBAR_GRAB_HOVERED       = 16;
const ImGuiCol IM_GUI_COL_SCROLLBAR_GRAB_ACTIVE        = 17;
const ImGuiCol IM_GUI_COL_CHECK_MARK                   = 18;
const ImGuiCol IM_GUI_COL_SLIDER_GRAB                  = 19;
const ImGuiCol IM_GUI_COL_SLIDER_GRAB_ACTIVE           = 20;
const ImGuiCol IM_GUI_COL_BUTTON                       = 21;
const ImGuiCol IM_GUI_COL_BUTTON_HOVERED               = 22;
const ImGuiCol IM_GUI_COL_BUTTON_ACTIVE                = 23;
const ImGuiCol IM_GUI_COL_HEADER                       = 24;
const ImGuiCol IM_GUI_COL_HEADER_HOVERED               = 25;
const ImGuiCol IM_GUI_COL_HEADER_ACTIVE                = 26;
const ImGuiCol IM_GUI_COL_SEPARATOR                    = 27;
const ImGuiCol IM_GUI_COL_SEPARATOR_HOVERED            = 28;
const ImGuiCol IM_GUI_COL_SEPARATOR_ACTIVE             = 29;
const ImGuiCol IM_GUI_COL_RESIZE_GRIP                  = 30;
const ImGuiCol IM_GUI_COL_RESIZE_GRIP_HOVERED          = 31;
const ImGuiCol IM_GUI_COL_RESIZE_GRIP_ACTIVE           = 32;
const ImGuiCol IM_GUI_COL_TAB_HOVERED                  = 33;
const ImGuiCol IM_GUI_COL_TAB                          = 34;
const ImGuiCol IM_GUI_COL_TAB_SELECTED                 = 35;
const ImGuiCol IM_GUI_COL_TAB_SELECTED_OVERLINE        = 36;
const ImGuiCol IM_GUI_COL_TAB_DIMMED                   = 37;
const ImGuiCol IM_GUI_COL_TAB_DIMMED_SELECTED          = 38;
const ImGuiCol IM_GUI_COL_TAB_DIMMED_SELECTED_OVERLINE = 39;
const ImGuiCol IM_GUI_COL_PLOT_LINES                   = 40;
const ImGuiCol IM_GUI_COL_PLOT_LINES_HOVERED           = 41;
const ImGuiCol IM_GUI_COL_PLOT_HISTOGRAM               = 42;
const ImGuiCol IM_GUI_COL_PLOT_HISTOGRAM_HOVERED       = 43;
const ImGuiCol IM_GUI_COL_TABLE_HEADER_BG              = 44;
const ImGuiCol IM_GUI_COL_TABLE_BORDER_STRONG          = 45;
const ImGuiCol IM_GUI_COL_TABLE_BORDER_LIGHT           = 46;
const ImGuiCol IM_GUI_COL_TABLE_ROW_BG                 = 47;
const ImGuiCol IM_GUI_COL_TABLE_ROW_BG_ALT             = 48;
const ImGuiCol IM_GUI_COL_TEXT_LINK                    = 49;
const ImGuiCol IM_GUI_COL_TEXT_SELECTED_BG             = 50;
const ImGuiCol IM_GUI_COL_DRAG_DROP_TARGET             = 51;
const ImGuiCol IM_GUI_COL_NAV_CURSOR                   = 52;
const ImGuiCol IM_GUI_COL_NAV_WINDOWING_HIGHLIGHT      = 53;
const ImGuiCol IM_GUI_COL_NAV_WINDOWING_DIM_BG         = 54;
const ImGuiCol IM_GUI_COL_MODAL_WINDOW_DIM_BG          = 55;
const ImGuiCol IM_GUI_COL_COUNT                        = 56;

// ImGuiKey
def ImGuiKey = int;
const ImGuiKey IM_GUI_KEY_NONE                   = 0;
const ImGuiKey IM_GUI_KEY_NAMED_KEY_BEGIN        = 512;
const ImGuiKey IM_GUI_KEY_TAB                    = 512;
const ImGuiKey IM_GUI_KEY_LEFT_ARROW             = 513;
const ImGuiKey IM_GUI_KEY_RIGHT_ARROW            = 514;
const ImGuiKey IM_GUI_KEY_UP_ARROW               = 515;
const ImGuiKey IM_GUI_KEY_DOWN_ARROW             = 516;
const ImGuiKey IM_GUI_KEY_PAGE_UP                = 517;
const ImGuiKey IM_GUI_KEY_PAGE_DOWN              = 518;
const ImGuiKey IM_GUI_KEY_HOME                   = 519;
const ImGuiKey IM_GUI_KEY_END                    = 520;
const ImGuiKey IM_GUI_KEY_INSERT                 = 521;
const ImGuiKey IM_GUI_KEY_DELETE                 = 522;
const ImGuiKey IM_GUI_KEY_BACKSPACE              = 523;
const ImGuiKey IM_GUI_KEY_SPACE                  = 524;
const ImGuiKey IM_GUI_KEY_ENTER                  = 525;
const ImGuiKey IM_GUI_KEY_ESCAPE                 = 526;
const ImGuiKey IM_GUI_KEY_LEFT_CTRL              = 527;
const ImGuiKey IM_GUI_KEY_LEFT_SHIFT             = 528;
const ImGuiKey IM_GUI_KEY_LEFT_ALT               = 529;
const ImGuiKey IM_GUI_KEY_LEFT_SUPER             = 530;
const ImGuiKey IM_GUI_KEY_RIGHT_CTRL             = 531;
const ImGuiKey IM_GUI_KEY_RIGHT_SHIFT            = 532;
const ImGuiKey IM_GUI_KEY_RIGHT_ALT              = 533;
const ImGuiKey IM_GUI_KEY_RIGHT_SUPER            = 534;
const ImGuiKey IM_GUI_KEY_MENU                   = 535;
const ImGuiKey IM_GUI_KEY_0                      = 536;
const ImGuiKey IM_GUI_KEY_1                      = 537;
const ImGuiKey IM_GUI_KEY_2                      = 538;
const ImGuiKey IM_GUI_KEY_3                      = 539;
const ImGuiKey IM_GUI_KEY_4                      = 540;
const ImGuiKey IM_GUI_KEY_5                      = 541;
const ImGuiKey IM_GUI_KEY_6                      = 542;
const ImGuiKey IM_GUI_KEY_7                      = 543;
const ImGuiKey IM_GUI_KEY_8                      = 544;
const ImGuiKey IM_GUI_KEY_9                      = 545;
const ImGuiKey IM_GUI_KEY_A                      = 546;
const ImGuiKey IM_GUI_KEY_B                      = 547;
const ImGuiKey IM_GUI_KEY_C                      = 548;
const ImGuiKey IM_GUI_KEY_D                      = 549;
const ImGuiKey IM_GUI_KEY_E                      = 550;
const ImGuiKey IM_GUI_KEY_F                      = 551;
const ImGuiKey IM_GUI_KEY_G                      = 552;
const ImGuiKey IM_GUI_KEY_H                      = 553;
const ImGuiKey IM_GUI_KEY_I                      = 554;
const ImGuiKey IM_GUI_KEY_J                      = 555;
const ImGuiKey IM_GUI_KEY_K                      = 556;
const ImGuiKey IM_GUI_KEY_L                      = 557;
const ImGuiKey IM_GUI_KEY_M                      = 558;
const ImGuiKey IM_GUI_KEY_N                      = 559;
const ImGuiKey IM_GUI_KEY_O                      = 560;
const ImGuiKey IM_GUI_KEY_P                      = 561;
const ImGuiKey IM_GUI_KEY_Q                      = 562;
const ImGuiKey IM_GUI_KEY_R                      = 563;
const ImGuiKey IM_GUI_KEY_S                      = 564;
const ImGuiKey IM_GUI_KEY_T                      = 565;
const ImGuiKey IM_GUI_KEY_U                      = 566;
const ImGuiKey IM_GUI_KEY_V                      = 567;
const ImGuiKey IM_GUI_KEY_W                      = 568;
const ImGuiKey IM_GUI_KEY_X                      = 569;
const ImGuiKey IM_GUI_KEY_Y                      = 570;
const ImGuiKey IM_GUI_KEY_Z                      = 571;
const ImGuiKey IM_GUI_KEY_F1                     = 572;
const ImGuiKey IM_GUI_KEY_F2                     = 573;
const ImGuiKey IM_GUI_KEY_F3                     = 574;
const ImGuiKey IM_GUI_KEY_F4                     = 575;
const ImGuiKey IM_GUI_KEY_F5                     = 576;
const ImGuiKey IM_GUI_KEY_F6                     = 577;
const ImGuiKey IM_GUI_KEY_F7                     = 578;
const ImGuiKey IM_GUI_KEY_F8                     = 579;
const ImGuiKey IM_GUI_KEY_F9                     = 580;
const ImGuiKey IM_GUI_KEY_F10                    = 581;
const ImGuiKey IM_GUI_KEY_F11                    = 582;
const ImGuiKey IM_GUI_KEY_F12                    = 583;
const ImGuiKey IM_GUI_KEY_F13                    = 584;
const ImGuiKey IM_GUI_KEY_F14                    = 585;
const ImGuiKey IM_GUI_KEY_F15                    = 586;
const ImGuiKey IM_GUI_KEY_F16                    = 587;
const ImGuiKey IM_GUI_KEY_F17                    = 588;
const ImGuiKey IM_GUI_KEY_F18                    = 589;
const ImGuiKey IM_GUI_KEY_F19                    = 590;
const ImGuiKey IM_GUI_KEY_F20                    = 591;
const ImGuiKey IM_GUI_KEY_F21                    = 592;
const ImGuiKey IM_GUI_KEY_F22                    = 593;
const ImGuiKey IM_GUI_KEY_F23                    = 594;
const ImGuiKey IM_GUI_KEY_F24                    = 595;
const ImGuiKey IM_GUI_KEY_APOSTROPHE             = 596;
const ImGuiKey IM_GUI_KEY_COMMA                  = 597;
const ImGuiKey IM_GUI_KEY_MINUS                  = 598;
const ImGuiKey IM_GUI_KEY_PERIOD                 = 599;
const ImGuiKey IM_GUI_KEY_SLASH                  = 600;
const ImGuiKey IM_GUI_KEY_SEMICOLON              = 601;
const ImGuiKey IM_GUI_KEY_EQUAL                  = 602;
const ImGuiKey IM_GUI_KEY_LEFT_BRACKET           = 603;
const ImGuiKey IM_GUI_KEY_BACKSLASH              = 604;
const ImGuiKey IM_GUI_KEY_RIGHT_BRACKET          = 605;
const ImGuiKey IM_GUI_KEY_GRAVE_ACCENT           = 606;
const ImGuiKey IM_GUI_KEY_CAPS_LOCK              = 607;
const ImGuiKey IM_GUI_KEY_SCROLL_LOCK            = 608;
const ImGuiKey IM_GUI_KEY_NUM_LOCK               = 609;
const ImGuiKey IM_GUI_KEY_PRINT_SCREEN           = 610;
const ImGuiKey IM_GUI_KEY_PAUSE                  = 611;
const ImGuiKey IM_GUI_KEY_KEYPAD0                = 612;
const ImGuiKey IM_GUI_KEY_KEYPAD1                = 613;
const ImGuiKey IM_GUI_KEY_KEYPAD2                = 614;
const ImGuiKey IM_GUI_KEY_KEYPAD3                = 615;
const ImGuiKey IM_GUI_KEY_KEYPAD4                = 616;
const ImGuiKey IM_GUI_KEY_KEYPAD5                = 617;
const ImGuiKey IM_GUI_KEY_KEYPAD6                = 618;
const ImGuiKey IM_GUI_KEY_KEYPAD7                = 619;
const ImGuiKey IM_GUI_KEY_KEYPAD8                = 620;
const ImGuiKey IM_GUI_KEY_KEYPAD9                = 621;
const ImGuiKey IM_GUI_KEY_KEYPAD_DECIMAL         = 622;
const ImGuiKey IM_GUI_KEY_KEYPAD_DIVIDE          = 623;
const ImGuiKey IM_GUI_KEY_KEYPAD_MULTIPLY        = 624;
const ImGuiKey IM_GUI_KEY_KEYPAD_SUBTRACT        = 625;
const ImGuiKey IM_GUI_KEY_KEYPAD_ADD             = 626;
const ImGuiKey IM_GUI_KEY_KEYPAD_ENTER           = 627;
const ImGuiKey IM_GUI_KEY_KEYPAD_EQUAL           = 628;
const ImGuiKey IM_GUI_KEY_APP_BACK               = 629;
const ImGuiKey IM_GUI_KEY_APP_FORWARD            = 630;
const ImGuiKey IM_GUI_KEY_GAMEPAD_START          = 631;
const ImGuiKey IM_GUI_KEY_GAMEPAD_BACK           = 632;
const ImGuiKey IM_GUI_KEY_GAMEPAD_FACE_LEFT      = 633;
const ImGuiKey IM_GUI_KEY_GAMEPAD_FACE_RIGHT     = 634;
const ImGuiKey IM_GUI_KEY_GAMEPAD_FACE_UP        = 635;
const ImGuiKey IM_GUI_KEY_GAMEPAD_FACE_DOWN      = 636;
const ImGuiKey IM_GUI_KEY_GAMEPAD_DPAD_LEFT      = 637;
const ImGuiKey IM_GUI_KEY_GAMEPAD_DPAD_RIGHT     = 638;
const ImGuiKey IM_GUI_KEY_GAMEPAD_DPAD_UP        = 639;
const ImGuiKey IM_GUI_KEY_GAMEPAD_DPAD_DOWN      = 640;
const ImGuiKey IM_GUI_KEY_GAMEPAD_L1             = 641;
const ImGuiKey IM_GUI_KEY_GAMEPAD_R1             = 642;
const ImGuiKey IM_GUI_KEY_GAMEPAD_L2             = 643;
const ImGuiKey IM_GUI_KEY_GAMEPAD_R2             = 644;
const ImGuiKey IM_GUI_KEY_GAMEPAD_L3             = 645;
const ImGuiKey IM_GUI_KEY_GAMEPAD_R3             = 646;
const ImGuiKey IM_GUI_KEY_GAMEPAD_L_STICK_LEFT   = 647;
const ImGuiKey IM_GUI_KEY_GAMEPAD_L_STICK_RIGHT  = 648;
const ImGuiKey IM_GUI_KEY_GAMEPAD_L_STICK_UP     = 649;
const ImGuiKey IM_GUI_KEY_GAMEPAD_L_STICK_DOWN   = 650;
const ImGuiKey IM_GUI_KEY_GAMEPAD_R_STICK_LEFT   = 651;
const ImGuiKey IM_GUI_KEY_GAMEPAD_R_STICK_RIGHT  = 652;
const ImGuiKey IM_GUI_KEY_GAMEPAD_R_STICK_UP     = 653;
const ImGuiKey IM_GUI_KEY_GAMEPAD_R_STICK_DOWN   = 654;
const ImGuiKey IM_GUI_KEY_MOUSE_LEFT             = 655;
const ImGuiKey IM_GUI_KEY_MOUSE_RIGHT            = 656;
const ImGuiKey IM_GUI_KEY_MOUSE_MIDDLE           = 657;
const ImGuiKey IM_GUI_KEY_MOUSE_X1               = 658;
const ImGuiKey IM_GUI_KEY_MOUSE_X2               = 659;
const ImGuiKey IM_GUI_KEY_MOUSE_WHEEL_X          = 660;
const ImGuiKey IM_GUI_KEY_MOUSE_WHEEL_Y          = 661;
const ImGuiKey IM_GUI_KEY_RESERVED_FOR_MOD_CTRL  = 662;
const ImGuiKey IM_GUI_KEY_RESERVED_FOR_MOD_SHIFT = 663;
const ImGuiKey IM_GUI_KEY_RESERVED_FOR_MOD_ALT   = 664;
const ImGuiKey IM_GUI_KEY_RESERVED_FOR_MOD_SUPER = 665;
const ImGuiKey IM_GUI_KEY_NAMED_KEY_END          = 666;
const ImGuiKey IM_GUI_MOD_NONE                   = 0;
const ImGuiKey IM_GUI_MOD_CTRL                   = 1 << 12;
const ImGuiKey IM_GUI_MOD_SHIFT                  = 1 << 13;
const ImGuiKey IM_GUI_MOD_ALT                    = 1 << 14;
const ImGuiKey IM_GUI_MOD_SUPER                  = 1 << 15;
const ImGuiKey IM_GUI_MOD_MASK                   = 0xF000;
const ImGuiKey IM_GUI_KEY_NAMED_KEY_COUNT        = 154;

// ImGuiWindowFlags_
def ImGuiWindowFlags = int;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NONE                        = 0;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_TITLE_BAR                = 1 << 0;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_RESIZE                   = 1 << 1;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_MOVE                     = 1 << 2;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_SCROLLBAR                = 1 << 3;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_SCROLL_WITH_MOUSE        = 1 << 4;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_COLLAPSE                 = 1 << 5;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_ALWAYS_AUTO_RESIZE          = 1 << 6;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_BACKGROUND               = 1 << 7;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_SAVED_SETTINGS           = 1 << 8;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_MOUSE_INPUTS             = 1 << 9;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_MENU_BAR                    = 1 << 10;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_HORIZONTAL_SCROLLBAR        = 1 << 11;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_FOCUS_ON_APPEARING       = 1 << 12;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_BRING_TO_FRONT_ON_FOCUS  = 1 << 13;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_ALWAYS_VERTICAL_SCROLLBAR   = 1 << 14;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_ALWAYS_HORIZONTAL_SCROLLBAR = 1<< 15;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_NAV_INPUTS               = 1 << 16;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_NAV_FOCUS                = 1 << 17;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_UNSAVED_DOCUMENT            = 1 << 18;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_NAV                      = IM_GUI_WINDOW_FLAGS_NO_NAV_INPUTS | IM_GUI_WINDOW_FLAGS_NO_NAV_FOCUS;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_DECORATION               = IM_GUI_WINDOW_FLAGS_NO_TITLE_BAR | IM_GUI_WINDOW_FLAGS_NO_RESIZE | IM_GUI_WINDOW_FLAGS_NO_SCROLLBAR | IM_GUI_WINDOW_FLAGS_NO_COLLAPSE;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_NO_INPUTS                   = IM_GUI_WINDOW_FLAGS_NO_MOUSE_INPUTS | IM_GUI_WINDOW_FLAGS_NO_NAV_INPUTS | IM_GUI_WINDOW_FLAGS_NO_NAV_FOCUS;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_CHILD_WINDOW                = 1 << 24;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_TOOLTIP                     = 1 << 25;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_POPUP                       = 1 << 26;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_MODAL                       = 1 << 27;
const ImGuiWindowFlags IM_GUI_WINDOW_FLAGS_CHILD_MENU                  = 1 << 28;

// ImGuiMouseCursor_
def ImGuiMouseCursor = int;
const ImGuiMouseCursor IM_GUI_MOUSE_CURSOR_NONE        = -1;
const ImGuiMouseCursor IM_GUI_MOUSE_CURSOR_ARROW       = 0;
const ImGuiMouseCursor IM_GUI_MOUSE_CURSOR_TEXT_INPUT  = 1;
const ImGuiMouseCursor IM_GUI_MOUSE_CURSOR_RESIZE_ALL  = 2;
const ImGuiMouseCursor IM_GUI_MOUSE_CURSOR_RESIZE_NS   = 3;
const ImGuiMouseCursor IM_GUI_MOUSE_CURSOR_RESIZE_EW   = 4;
const ImGuiMouseCursor IM_GUI_MOUSE_CURSOR_RESIZE_NESW = 5;
const ImGuiMouseCursor IM_GUI_MOUSE_CURSOR_RESIZE_NWSE = 6;
const ImGuiMouseCursor IM_GUI_MOUSE_CURSOR_HAND        = 7;
const ImGuiMouseCursor IM_GUI_MOUSE_CURSOR_NOT_ALLOWED = 8;
const ImGuiMouseCursor IM_GUI_MOUSE_CURSOR_COUNT       = 9;

// ImGuiComboFlags_
def ImGuiComboFlags = int;
const ImGuiComboFlags IM_GUI_COMBO_FLAGS_NONE              = 0;
const ImGuiComboFlags IM_GUI_COMBO_FLAGS_POPUP_ALIGN_LEFT  = 1 << 0;
const ImGuiComboFlags IM_GUI_COMBO_FLAGS_HEIGHT_SMALL      = 1 << 1;
const ImGuiComboFlags IM_GUI_COMBO_FLAGS_HEIGHT_REGULAR    = 1 << 2;
const ImGuiComboFlags IM_GUI_COMBO_FLAGS_HEIGHT_LARGE      = 1 << 3;
const ImGuiComboFlags IM_GUI_COMBO_FLAGS_HEIGHT_LARGEST    = 1 << 4;
const ImGuiComboFlags IM_GUI_COMBO_FLAGS_NO_ARROW_BUTTON   = 1 << 5;
const ImGuiComboFlags IM_GUI_COMBO_FLAGS_NO_PREVIEW        = 1 << 6;
const ImGuiComboFlags IM_GUI_COMBO_FLAGS_WIDTH_FIT_PREVIEW = 1 << 7;
const ImGuiComboFlags IM_GUI_COMBO_FLAGS_HEIGHT_MASK       = IM_GUI_COMBO_FLAGS_HEIGHT_SMALL | IM_GUI_COMBO_FLAGS_HEIGHT_REGULAR | IM_GUI_COMBO_FLAGS_HEIGHT_LARGE | IM_GUI_COMBO_FLAGS_HEIGHT_LARGEST;

// ImDrawListFlags_
def ImDrawListFlags = int;
const ImDrawListFlags IM_DRAW_LIST_FLAGS_NONE                       = 0;
const ImDrawListFlags IM_DRAW_LIST_FLAGS_ANTI_ALIASED_LINES         = 1 << 0;
const ImDrawListFlags IM_DRAW_LIST_FLAGS_ANTI_ALIASED_LINES_USE_TEX = 1 << 1;
const ImDrawListFlags IM_DRAW_LIST_FLAGS_ANTI_ALIASED_FILL          = 1 << 2;
const ImDrawListFlags IM_DRAW_LIST_FLAGS_ALLOW_VTX_OFFSET           = 1 << 3;

// ImGuiMouseSource
def ImGuiMouseSource = int;
const ImGuiMouseSource IM_GUI_MOUSE_SOURCE_MOUSE        = 0;
const ImGuiMouseSource IM_GUI_MOUSE_SOURCE_TOUCH_SCREEN = 1;
const ImGuiMouseSource IM_GUI_MOUSE_SOURCE_PEN          = 2;
const ImGuiMouseSource IM_GUI_MOUSE_SOURCE_COUNT        = 3;

// ImGuiTabItemFlags_
def ImGuiTabItemFlags = int;
const ImGuiTabItemFlags IM_GUI_TAB_ITEM_FLAGS_NONE                              = 0;
const ImGuiTabItemFlags IM_GUI_TAB_ITEM_FLAGS_UNSAVED_DOCUMENT                  = 1 << 0;
const ImGuiTabItemFlags IM_GUI_TAB_ITEM_FLAGS_SET_SELECTED                      = 1 << 1;
const ImGuiTabItemFlags IM_GUI_TAB_ITEM_FLAGS_NO_CLOSE_WITH_MIDDLE_MOUSE_BUTTON = 1 << 2;
const ImGuiTabItemFlags IM_GUI_TAB_ITEM_FLAGS_NO_PUSH_ID                        = 1 << 3;
const ImGuiTabItemFlags IM_GUI_TAB_ITEM_FLAGS_NO_TOOLTIP                        = 1 << 4;
const ImGuiTabItemFlags IM_GUI_TAB_ITEM_FLAGS_NO_REORDER                        = 1 << 5;
const ImGuiTabItemFlags IM_GUI_TAB_ITEM_FLAGS_LEADING                           = 1 << 6;
const ImGuiTabItemFlags IM_GUI_TAB_ITEM_FLAGS_TRAILING                          = 1 << 7;
const ImGuiTabItemFlags IM_GUI_TAB_ITEM_FLAGS_NO_ASSUMED_CLOSURE                = 1 << 8;

