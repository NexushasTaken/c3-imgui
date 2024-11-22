module imgui;

// ImDrawFlags_
def DrawFlags = int;
const DrawFlags DRAW_FLAGS_NONE                       = 0;
const DrawFlags DRAW_FLAGS_CLOSED                     = 1 << 0;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_TOP_LEFT     = 1 << 4;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_TOP_RIGHT    = 1 << 5;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_BOTTOM_LEFT  = 1 << 6;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_BOTTOM_RIGHT = 1 << 7;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_NONE         = 1 << 8;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_TOP          = DRAW_FLAGS_ROUND_CORNERS_TOP_LEFT | DRAW_FLAGS_ROUND_CORNERS_TOP_RIGHT;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_BOTTOM       = DRAW_FLAGS_ROUND_CORNERS_BOTTOM_LEFT | DRAW_FLAGS_ROUND_CORNERS_BOTTOM_RIGHT;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_LEFT         = DRAW_FLAGS_ROUND_CORNERS_BOTTOM_LEFT | DRAW_FLAGS_ROUND_CORNERS_TOP_LEFT;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_RIGHT        = DRAW_FLAGS_ROUND_CORNERS_BOTTOM_RIGHT | DRAW_FLAGS_ROUND_CORNERS_TOP_RIGHT;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_ALL          = DRAW_FLAGS_ROUND_CORNERS_TOP_LEFT | DRAW_FLAGS_ROUND_CORNERS_TOP_RIGHT | DRAW_FLAGS_ROUND_CORNERS_BOTTOM_LEFT | DRAW_FLAGS_ROUND_CORNERS_BOTTOM_RIGHT;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_DEFAULT      = DRAW_FLAGS_ROUND_CORNERS_ALL;
const DrawFlags DRAW_FLAGS_ROUND_CORNERS_MASK         = DRAW_FLAGS_ROUND_CORNERS_ALL | DRAW_FLAGS_ROUND_CORNERS_NONE;

// ImGuiButtonFlags_
def ButtonFlags = int;
const ButtonFlags BUTTON_FLAGS_NONE                = 0;
const ButtonFlags BUTTON_FLAGS_MOUSE_BUTTON_LEFT   = 1 << 0;
const ButtonFlags BUTTON_FLAGS_MOUSE_BUTTON_RIGHT  = 1 << 1;
const ButtonFlags BUTTON_FLAGS_MOUSE_BUTTON_MIDDLE = 1 << 2;
const ButtonFlags BUTTON_FLAGS_MOUSE_BUTTON_MASK   = BUTTON_FLAGS_MOUSE_BUTTON_LEFT | BUTTON_FLAGS_MOUSE_BUTTON_RIGHT | BUTTON_FLAGS_MOUSE_BUTTON_MIDDLE;
const ButtonFlags BUTTON_FLAGS_ENABLE_NAV          = 1 << 3;

// ImFontAtlasFlags_
def FontAtlasFlags = int;
const FontAtlasFlags FONT_ATLAS_FLAGS_NONE                   = 0;
const FontAtlasFlags FONT_ATLAS_FLAGS_NO_POWER_OF_TWO_HEIGHT = 1 << 0;
const FontAtlasFlags FONT_ATLAS_FLAGS_NO_MOUSE_CURSORS       = 1 << 1;
const FontAtlasFlags FONT_ATLAS_FLAGS_NO_BAKED_LINES         = 1 << 2;

// ImGuiTableRowFlags_
def TableRowFlags = int;
const TableRowFlags TABLE_ROW_FLAGS_NONE    = 0;
const TableRowFlags TABLE_ROW_FLAGS_HEADERS = 1 << 0;

// ImGuiCond_
def Cond = int;
const Cond COND_NONE           = 0;
const Cond COND_ALWAYS         = 1 << 0;
const Cond COND_ONCE           = 1 << 1;
const Cond COND_FIRST_USE_EVER = 1 << 2;
const Cond COND_APPEARING      = 1 << 3;

// ImGuiPopupFlags_
def PopupFlags = int;
const PopupFlags POPUP_FLAGS_NONE                        = 0;
const PopupFlags POPUP_FLAGS_MOUSE_BUTTON_LEFT           = 0;
const PopupFlags POPUP_FLAGS_MOUSE_BUTTON_RIGHT          = 1;
const PopupFlags POPUP_FLAGS_MOUSE_BUTTON_MIDDLE         = 2;
const PopupFlags POPUP_FLAGS_MOUSE_BUTTON_MASK           = 0x1F;
const PopupFlags POPUP_FLAGS_MOUSE_BUTTON_DEFAULT        = 1;
const PopupFlags POPUP_FLAGS_NO_REOPEN                   = 1 << 5;
const PopupFlags POPUP_FLAGS_NO_OPEN_OVER_EXISTING_POPUP = 1 << 7;
const PopupFlags POPUP_FLAGS_NO_OPEN_OVER_ITEMS          = 1 << 8;
const PopupFlags POPUP_FLAGS_ANY_POPUP_ID                = 1 << 10;
const PopupFlags POPUP_FLAGS_ANY_POPUP_LEVEL             = 1 << 11;
const PopupFlags POPUP_FLAGS_ANY_POPUP                   = POPUP_FLAGS_ANY_POPUP_ID | POPUP_FLAGS_ANY_POPUP_LEVEL;

// ImGuiSelectionRequestType
def SelectionRequestType = int;
const SelectionRequestType SELECTION_REQUEST_TYPE_NONE      = 0;
const SelectionRequestType SELECTION_REQUEST_TYPE_SET_ALL   = 1;
const SelectionRequestType SELECTION_REQUEST_TYPE_SET_RANGE = 2;

// ImGuiDragDropFlags_
def DragDropFlags = int;
const DragDropFlags DRAG_DROP_FLAGS_NONE                          = 0;
const DragDropFlags DRAG_DROP_FLAGS_SOURCE_NO_PREVIEW_TOOLTIP     = 1 << 0;
const DragDropFlags DRAG_DROP_FLAGS_SOURCE_NO_DISABLE_HOVER       = 1 << 1;
const DragDropFlags DRAG_DROP_FLAGS_SOURCE_NO_HOLD_TO_OPEN_OTHERS = 1 << 2;
const DragDropFlags DRAG_DROP_FLAGS_SOURCE_ALLOW_NULL_ID          = 1 << 3;
const DragDropFlags DRAG_DROP_FLAGS_SOURCE_EXTERN                 = 1 << 4;
const DragDropFlags DRAG_DROP_FLAGS_PAYLOAD_AUTO_EXPIRE           = 1 << 5;
const DragDropFlags DRAG_DROP_FLAGS_PAYLOAD_NO_CROSS_CONTEXT      = 1 << 6;
const DragDropFlags DRAG_DROP_FLAGS_PAYLOAD_NO_CROSS_PROCESS      = 1 << 7;
const DragDropFlags DRAG_DROP_FLAGS_ACCEPT_BEFORE_DELIVERY        = 1 << 10;
const DragDropFlags DRAG_DROP_FLAGS_ACCEPT_NO_DRAW_DEFAULT_RECT   = 1 << 11;
const DragDropFlags DRAG_DROP_FLAGS_ACCEPT_NO_PREVIEW_TOOLTIP     = 1 << 12;
const DragDropFlags DRAG_DROP_FLAGS_ACCEPT_PEEK_ONLY              = DRAG_DROP_FLAGS_ACCEPT_BEFORE_DELIVERY | DRAG_DROP_FLAGS_ACCEPT_NO_DRAW_DEFAULT_RECT;

// ImGuiBackendFlags_
def BackendFlags = int;
const BackendFlags BACKEND_FLAGS_NONE                    = 0;
const BackendFlags BACKEND_FLAGS_HAS_GAMEPAD             = 1 << 0;
const BackendFlags BACKEND_FLAGS_HAS_MOUSE_CURSORS       = 1 << 1;
const BackendFlags BACKEND_FLAGS_HAS_SET_MOUSE_POS       = 1 << 2;
const BackendFlags BACKEND_FLAGS_RENDERER_HAS_VTX_OFFSET = 1 << 3;

// ImGuiTableColumnFlags_
def TableColumnFlags = int;
const TableColumnFlags TABLE_COLUMN_FLAGS_NONE                   = 0;
const TableColumnFlags TABLE_COLUMN_FLAGS_DISABLED               = 1 << 0;
const TableColumnFlags TABLE_COLUMN_FLAGS_DEFAULT_HIDE           = 1 << 1;
const TableColumnFlags TABLE_COLUMN_FLAGS_DEFAULT_SORT           = 1 << 2;
const TableColumnFlags TABLE_COLUMN_FLAGS_WIDTH_STRETCH          = 1 << 3;
const TableColumnFlags TABLE_COLUMN_FLAGS_WIDTH_FIXED            = 1 << 4;
const TableColumnFlags TABLE_COLUMN_FLAGS_NO_RESIZE              = 1 << 5;
const TableColumnFlags TABLE_COLUMN_FLAGS_NO_REORDER             = 1 << 6;
const TableColumnFlags TABLE_COLUMN_FLAGS_NO_HIDE                = 1 << 7;
const TableColumnFlags TABLE_COLUMN_FLAGS_NO_CLIP                = 1 << 8;
const TableColumnFlags TABLE_COLUMN_FLAGS_NO_SORT                = 1 << 9;
const TableColumnFlags TABLE_COLUMN_FLAGS_NO_SORT_ASCENDING      = 1 << 10;
const TableColumnFlags TABLE_COLUMN_FLAGS_NO_SORT_DESCENDING     = 1 << 11;
const TableColumnFlags TABLE_COLUMN_FLAGS_NO_HEADER_LABEL        = 1 << 12;
const TableColumnFlags TABLE_COLUMN_FLAGS_NO_HEADER_WIDTH        = 1 << 13;
const TableColumnFlags TABLE_COLUMN_FLAGS_PREFER_SORT_ASCENDING  = 1 << 14;
const TableColumnFlags TABLE_COLUMN_FLAGS_PREFER_SORT_DESCENDING = 1 << 15;
const TableColumnFlags TABLE_COLUMN_FLAGS_INDENT_ENABLE          = 1 << 16;
const TableColumnFlags TABLE_COLUMN_FLAGS_INDENT_DISABLE         = 1 << 17;
const TableColumnFlags TABLE_COLUMN_FLAGS_ANGLED_HEADER          = 1 << 18;
const TableColumnFlags TABLE_COLUMN_FLAGS_IS_ENABLED             = 1 << 24;
const TableColumnFlags TABLE_COLUMN_FLAGS_IS_VISIBLE             = 1 << 25;
const TableColumnFlags TABLE_COLUMN_FLAGS_IS_SORTED              = 1 << 26;
const TableColumnFlags TABLE_COLUMN_FLAGS_IS_HOVERED             = 1 << 27;
const TableColumnFlags TABLE_COLUMN_FLAGS_WIDTH_MASK             = TABLE_COLUMN_FLAGS_WIDTH_STRETCH | TABLE_COLUMN_FLAGS_WIDTH_FIXED;
const TableColumnFlags TABLE_COLUMN_FLAGS_INDENT_MASK            = TABLE_COLUMN_FLAGS_INDENT_ENABLE | TABLE_COLUMN_FLAGS_INDENT_DISABLE;
const TableColumnFlags TABLE_COLUMN_FLAGS_STATUS_MASK            = TABLE_COLUMN_FLAGS_IS_ENABLED | TABLE_COLUMN_FLAGS_IS_VISIBLE | TABLE_COLUMN_FLAGS_IS_SORTED | TABLE_COLUMN_FLAGS_IS_HOVERED;
const TableColumnFlags TABLE_COLUMN_FLAGS_NO_DIRECT_RESIZE       = 1 << 30;

// ImGuiStyleVar_
def StyleVar = int;
const StyleVar STYLE_VAR_ALPHA                           = 0;
const StyleVar STYLE_VAR_DISABLED_ALPHA                  = 1;
const StyleVar STYLE_VAR_WINDOW_PADDING                  = 2;
const StyleVar STYLE_VAR_WINDOW_ROUNDING                 = 3;
const StyleVar STYLE_VAR_WINDOW_BORDER_SIZE              = 4;
const StyleVar STYLE_VAR_WINDOW_MIN_SIZE                 = 5;
const StyleVar STYLE_VAR_WINDOW_TITLE_ALIGN              = 6;
const StyleVar STYLE_VAR_CHILD_ROUNDING                  = 7;
const StyleVar STYLE_VAR_CHILD_BORDER_SIZE               = 8;
const StyleVar STYLE_VAR_POPUP_ROUNDING                  = 9;
const StyleVar STYLE_VAR_POPUP_BORDER_SIZE               = 10;
const StyleVar STYLE_VAR_FRAME_PADDING                   = 11;
const StyleVar STYLE_VAR_FRAME_ROUNDING                  = 12;
const StyleVar STYLE_VAR_FRAME_BORDER_SIZE               = 13;
const StyleVar STYLE_VAR_ITEM_SPACING                    = 14;
const StyleVar STYLE_VAR_ITEM_INNER_SPACING              = 15;
const StyleVar STYLE_VAR_INDENT_SPACING                  = 16;
const StyleVar STYLE_VAR_CELL_PADDING                    = 17;
const StyleVar STYLE_VAR_SCROLLBAR_SIZE                  = 18;
const StyleVar STYLE_VAR_SCROLLBAR_ROUNDING              = 19;
const StyleVar STYLE_VAR_GRAB_MIN_SIZE                   = 20;
const StyleVar STYLE_VAR_GRAB_ROUNDING                   = 21;
const StyleVar STYLE_VAR_TAB_ROUNDING                    = 22;
const StyleVar STYLE_VAR_TAB_BORDER_SIZE                 = 23;
const StyleVar STYLE_VAR_TAB_BAR_BORDER_SIZE             = 24;
const StyleVar STYLE_VAR_TAB_BAR_OVERLINE_SIZE           = 25;
const StyleVar STYLE_VAR_TABLE_ANGLED_HEADERS_ANGLE      = 26;
const StyleVar STYLE_VAR_TABLE_ANGLED_HEADERS_TEXT_ALIGN = 27;
const StyleVar STYLE_VAR_BUTTON_TEXT_ALIGN               = 28;
const StyleVar STYLE_VAR_SELECTABLE_TEXT_ALIGN           = 29;
const StyleVar STYLE_VAR_SEPARATOR_TEXT_BORDER_SIZE      = 30;
const StyleVar STYLE_VAR_SEPARATOR_TEXT_ALIGN            = 31;
const StyleVar STYLE_VAR_SEPARATOR_TEXT_PADDING          = 32;
const StyleVar STYLE_VAR_COUNT                           = 33;

// ImGuiTabBarFlags_
def TabBarFlags = int;
const TabBarFlags TAB_BAR_FLAGS_NONE                              = 0;
const TabBarFlags TAB_BAR_FLAGS_REORDERABLE                       = 1 << 0;
const TabBarFlags TAB_BAR_FLAGS_AUTO_SELECT_NEW_TABS              = 1 << 1;
const TabBarFlags TAB_BAR_FLAGS_TAB_LIST_POPUP_BUTTON             = 1 << 2;
const TabBarFlags TAB_BAR_FLAGS_NO_CLOSE_WITH_MIDDLE_MOUSE_BUTTON = 1 << 3;
const TabBarFlags TAB_BAR_FLAGS_NO_TAB_LIST_SCROLLING_BUTTONS     = 1 << 4;
const TabBarFlags TAB_BAR_FLAGS_NO_TOOLTIP                        = 1 << 5;
const TabBarFlags TAB_BAR_FLAGS_DRAW_SELECTED_OVERLINE            = 1 << 6;
const TabBarFlags TAB_BAR_FLAGS_FITTING_POLICY_RESIZE_DOWN        = 1 << 7;
const TabBarFlags TAB_BAR_FLAGS_FITTING_POLICY_SCROLL             = 1 << 8;
const TabBarFlags TAB_BAR_FLAGS_FITTING_POLICY_MASK               = TAB_BAR_FLAGS_FITTING_POLICY_RESIZE_DOWN | TAB_BAR_FLAGS_FITTING_POLICY_SCROLL;
const TabBarFlags TAB_BAR_FLAGS_FITTING_POLICY_DEFAULT            = TAB_BAR_FLAGS_FITTING_POLICY_RESIZE_DOWN;

// ImGuiChildFlags_
def ChildFlags = int;
const ChildFlags CHILD_FLAGS_NONE                      = 0;
const ChildFlags CHILD_FLAGS_BORDERS                   = 1 << 0;
const ChildFlags CHILD_FLAGS_ALWAYS_USE_WINDOW_PADDING = 1 << 1;
const ChildFlags CHILD_FLAGS_RESIZE_X                  = 1 << 2;
const ChildFlags CHILD_FLAGS_RESIZE_Y                  = 1 << 3;
const ChildFlags CHILD_FLAGS_AUTO_RESIZE_X             = 1 << 4;
const ChildFlags CHILD_FLAGS_AUTO_RESIZE_Y             = 1 << 5;
const ChildFlags CHILD_FLAGS_ALWAYS_AUTO_RESIZE        = 1 << 6;
const ChildFlags CHILD_FLAGS_FRAME_STYLE               = 1 << 7;
const ChildFlags CHILD_FLAGS_NAV_FLATTENED             = 1 << 8;

// ImGuiFreeTypeBuilderFlags
def FreeTypeBuilderFlags = int;
const FreeTypeBuilderFlags FREE_TYPE_BUILDER_FLAGS_NO_HINTING      = 1 << 0;
const FreeTypeBuilderFlags FREE_TYPE_BUILDER_FLAGS_NO_AUTO_HINT    = 1 << 1;
const FreeTypeBuilderFlags FREE_TYPE_BUILDER_FLAGS_FORCE_AUTO_HINT = 1 << 2;
const FreeTypeBuilderFlags FREE_TYPE_BUILDER_FLAGS_LIGHT_HINTING   = 1 << 3;
const FreeTypeBuilderFlags FREE_TYPE_BUILDER_FLAGS_MONO_HINTING    = 1 << 4;
const FreeTypeBuilderFlags FREE_TYPE_BUILDER_FLAGS_BOLD            = 1 << 5;
const FreeTypeBuilderFlags FREE_TYPE_BUILDER_FLAGS_OBLIQUE         = 1 << 6;
const FreeTypeBuilderFlags FREE_TYPE_BUILDER_FLAGS_MONOCHROME      = 1 << 7;
const FreeTypeBuilderFlags FREE_TYPE_BUILDER_FLAGS_LOAD_COLOR      = 1 << 8;
const FreeTypeBuilderFlags FREE_TYPE_BUILDER_FLAGS_BITMAP          = 1 << 9;

// ImGuiMultiSelectFlags_
def MultiSelectFlags = int;
const MultiSelectFlags MULTI_SELECT_FLAGS_NONE                      = 0;
const MultiSelectFlags MULTI_SELECT_FLAGS_SINGLE_SELECT             = 1 << 0;
const MultiSelectFlags MULTI_SELECT_FLAGS_NO_SELECT_ALL             = 1 << 1;
const MultiSelectFlags MULTI_SELECT_FLAGS_NO_RANGE_SELECT           = 1 << 2;
const MultiSelectFlags MULTI_SELECT_FLAGS_NO_AUTO_SELECT            = 1 << 3;
const MultiSelectFlags MULTI_SELECT_FLAGS_NO_AUTO_CLEAR             = 1 << 4;
const MultiSelectFlags MULTI_SELECT_FLAGS_NO_AUTO_CLEAR_ON_RESELECT = 1 << 5;
const MultiSelectFlags MULTI_SELECT_FLAGS_BOX_SELECT1D              = 1 << 6;
const MultiSelectFlags MULTI_SELECT_FLAGS_BOX_SELECT2D              = 1 << 7;
const MultiSelectFlags MULTI_SELECT_FLAGS_BOX_SELECT_NO_SCROLL      = 1 << 8;
const MultiSelectFlags MULTI_SELECT_FLAGS_CLEAR_ON_ESCAPE           = 1 << 9;
const MultiSelectFlags MULTI_SELECT_FLAGS_CLEAR_ON_CLICK_VOID       = 1 << 10;
const MultiSelectFlags MULTI_SELECT_FLAGS_SCOPE_WINDOW              = 1 << 11;
const MultiSelectFlags MULTI_SELECT_FLAGS_SCOPE_RECT                = 1 << 12;
const MultiSelectFlags MULTI_SELECT_FLAGS_SELECT_ON_CLICK           = 1 << 13;
const MultiSelectFlags MULTI_SELECT_FLAGS_SELECT_ON_CLICK_RELEASE   = 1 << 14;
const MultiSelectFlags MULTI_SELECT_FLAGS_NAV_WRAP_X                = 1 << 16;

// ImGuiSelectableFlags_
def SelectableFlags = int;
const SelectableFlags SELECTABLE_FLAGS_NONE                 = 0;
const SelectableFlags SELECTABLE_FLAGS_NO_AUTO_CLOSE_POPUPS = 1 << 0;
const SelectableFlags SELECTABLE_FLAGS_SPAN_ALL_COLUMNS     = 1 << 1;
const SelectableFlags SELECTABLE_FLAGS_ALLOW_DOUBLE_CLICK   = 1 << 2;
const SelectableFlags SELECTABLE_FLAGS_DISABLED             = 1 << 3;
const SelectableFlags SELECTABLE_FLAGS_ALLOW_OVERLAP        = 1 << 4;
const SelectableFlags SELECTABLE_FLAGS_HIGHLIGHT            = 1 << 5;

// ImGuiDir
def Dir = int;
const Dir DIR_NONE  = -1;
const Dir DIR_LEFT  = 0;
const Dir DIR_RIGHT = 1;
const Dir DIR_UP    = 2;
const Dir DIR_DOWN  = 3;
const Dir DIR_COUNT = 4;

// ImGuiTableFlags_
def TableFlags = int;
const TableFlags TABLE_FLAGS_NONE                            = 0;
const TableFlags TABLE_FLAGS_RESIZABLE                       = 1 << 0;
const TableFlags TABLE_FLAGS_REORDERABLE                     = 1 << 1;
const TableFlags TABLE_FLAGS_HIDEABLE                        = 1 << 2;
const TableFlags TABLE_FLAGS_SORTABLE                        = 1 << 3;
const TableFlags TABLE_FLAGS_NO_SAVED_SETTINGS               = 1 << 4;
const TableFlags TABLE_FLAGS_CONTEXT_MENU_IN_BODY            = 1 << 5;
const TableFlags TABLE_FLAGS_ROW_BG                          = 1 << 6;
const TableFlags TABLE_FLAGS_BORDERS_INNER_H                 = 1 << 7;
const TableFlags TABLE_FLAGS_BORDERS_OUTER_H                 = 1 << 8;
const TableFlags TABLE_FLAGS_BORDERS_INNER_V                 = 1 << 9;
const TableFlags TABLE_FLAGS_BORDERS_OUTER_V                 = 1 << 10;
const TableFlags TABLE_FLAGS_BORDERS_H                       = TABLE_FLAGS_BORDERS_INNER_H | TABLE_FLAGS_BORDERS_OUTER_H;
const TableFlags TABLE_FLAGS_BORDERS_V                       = TABLE_FLAGS_BORDERS_INNER_V | TABLE_FLAGS_BORDERS_OUTER_V;
const TableFlags TABLE_FLAGS_BORDERS_INNER                   = TABLE_FLAGS_BORDERS_INNER_V | TABLE_FLAGS_BORDERS_INNER_H;
const TableFlags TABLE_FLAGS_BORDERS_OUTER                   = TABLE_FLAGS_BORDERS_OUTER_V | TABLE_FLAGS_BORDERS_OUTER_H;
const TableFlags TABLE_FLAGS_BORDERS                         = TABLE_FLAGS_BORDERS_INNER | TABLE_FLAGS_BORDERS_OUTER;
const TableFlags TABLE_FLAGS_NO_BORDERS_IN_BODY              = 1 << 11;
const TableFlags TABLE_FLAGS_NO_BORDERS_IN_BODY_UNTIL_RESIZE = 1 << 12;
const TableFlags TABLE_FLAGS_SIZING_FIXED_FIT                = 1 << 13;
const TableFlags TABLE_FLAGS_SIZING_FIXED_SAME               = 2 << 13;
const TableFlags TABLE_FLAGS_SIZING_STRETCH_PROP             = 3 << 13;
const TableFlags TABLE_FLAGS_SIZING_STRETCH_SAME             = 4 << 13;
const TableFlags TABLE_FLAGS_NO_HOST_EXTEND_X                = 1 << 16;
const TableFlags TABLE_FLAGS_NO_HOST_EXTEND_Y                = 1 << 17;
const TableFlags TABLE_FLAGS_NO_KEEP_COLUMNS_VISIBLE         = 1 << 18;
const TableFlags TABLE_FLAGS_PRECISE_WIDTHS                  = 1 << 19;
const TableFlags TABLE_FLAGS_NO_CLIP                         = 1 << 20;
const TableFlags TABLE_FLAGS_PAD_OUTER_X                     = 1 << 21;
const TableFlags TABLE_FLAGS_NO_PAD_OUTER_X                  = 1 << 22;
const TableFlags TABLE_FLAGS_NO_PAD_INNER_X                  = 1 << 23;
const TableFlags TABLE_FLAGS_SCROLL_X                        = 1 << 24;
const TableFlags TABLE_FLAGS_SCROLL_Y                        = 1 << 25;
const TableFlags TABLE_FLAGS_SORT_MULTI                      = 1 << 26;
const TableFlags TABLE_FLAGS_SORT_TRISTATE                   = 1 << 27;
const TableFlags TABLE_FLAGS_HIGHLIGHT_HOVERED_COLUMN        = 1 << 28;
const TableFlags TABLE_FLAGS_SIZING_MASK                     = TABLE_FLAGS_SIZING_FIXED_FIT | TABLE_FLAGS_SIZING_FIXED_SAME | TABLE_FLAGS_SIZING_STRETCH_PROP | TABLE_FLAGS_SIZING_STRETCH_SAME;

// ImGuiColorEditFlags_
def ColorEditFlags = int;
const ColorEditFlags COLOR_EDIT_FLAGS_NONE               = 0;
const ColorEditFlags COLOR_EDIT_FLAGS_NO_ALPHA           = 1 << 1;
const ColorEditFlags COLOR_EDIT_FLAGS_NO_PICKER          = 1 << 2;
const ColorEditFlags COLOR_EDIT_FLAGS_NO_OPTIONS         = 1 << 3;
const ColorEditFlags COLOR_EDIT_FLAGS_NO_SMALL_PREVIEW   = 1 << 4;
const ColorEditFlags COLOR_EDIT_FLAGS_NO_INPUTS          = 1 << 5;
const ColorEditFlags COLOR_EDIT_FLAGS_NO_TOOLTIP         = 1 << 6;
const ColorEditFlags COLOR_EDIT_FLAGS_NO_LABEL           = 1 << 7;
const ColorEditFlags COLOR_EDIT_FLAGS_NO_SIDE_PREVIEW    = 1 << 8;
const ColorEditFlags COLOR_EDIT_FLAGS_NO_DRAG_DROP       = 1 << 9;
const ColorEditFlags COLOR_EDIT_FLAGS_NO_BORDER          = 1 << 10;
const ColorEditFlags COLOR_EDIT_FLAGS_ALPHA_BAR          = 1 << 16;
const ColorEditFlags COLOR_EDIT_FLAGS_ALPHA_PREVIEW      = 1 << 17;
const ColorEditFlags COLOR_EDIT_FLAGS_ALPHA_PREVIEW_HALF = 1 << 18;
const ColorEditFlags COLOR_EDIT_FLAGS_HDR                = 1 << 19;
const ColorEditFlags COLOR_EDIT_FLAGS_DISPLAY_RGB        = 1 << 20;
const ColorEditFlags COLOR_EDIT_FLAGS_DISPLAY_HSV        = 1 << 21;
const ColorEditFlags COLOR_EDIT_FLAGS_DISPLAY_HEX        = 1 << 22;
const ColorEditFlags COLOR_EDIT_FLAGS_UINT8              = 1 << 23;
const ColorEditFlags COLOR_EDIT_FLAGS_FLOAT              = 1 << 24;
const ColorEditFlags COLOR_EDIT_FLAGS_PICKER_HUE_BAR     = 1 << 25;
const ColorEditFlags COLOR_EDIT_FLAGS_PICKER_HUE_WHEEL   = 1 << 26;
const ColorEditFlags COLOR_EDIT_FLAGS_INPUT_RGB          = 1 << 27;
const ColorEditFlags COLOR_EDIT_FLAGS_INPUT_HSV          = 1 << 28;
const ColorEditFlags COLOR_EDIT_FLAGS_DEFAULT_OPTIONS    = COLOR_EDIT_FLAGS_UINT8 | COLOR_EDIT_FLAGS_DISPLAY_RGB | COLOR_EDIT_FLAGS_INPUT_RGB | COLOR_EDIT_FLAGS_PICKER_HUE_BAR;
const ColorEditFlags COLOR_EDIT_FLAGS_DISPLAY_MASK       = COLOR_EDIT_FLAGS_DISPLAY_RGB | COLOR_EDIT_FLAGS_DISPLAY_HSV | COLOR_EDIT_FLAGS_DISPLAY_HEX;
const ColorEditFlags COLOR_EDIT_FLAGS_DATA_TYPE_MASK     = COLOR_EDIT_FLAGS_UINT8 | COLOR_EDIT_FLAGS_FLOAT;
const ColorEditFlags COLOR_EDIT_FLAGS_PICKER_MASK        = COLOR_EDIT_FLAGS_PICKER_HUE_WHEEL | COLOR_EDIT_FLAGS_PICKER_HUE_BAR;
const ColorEditFlags COLOR_EDIT_FLAGS_INPUT_MASK         = COLOR_EDIT_FLAGS_INPUT_RGB | COLOR_EDIT_FLAGS_INPUT_HSV;

// ImGuiHoveredFlags_
def HoveredFlags = int;
const HoveredFlags HOVERED_FLAGS_NONE                              = 0;
const HoveredFlags HOVERED_FLAGS_CHILD_WINDOWS                     = 1 << 0;
const HoveredFlags HOVERED_FLAGS_ROOT_WINDOW                       = 1 << 1;
const HoveredFlags HOVERED_FLAGS_ANY_WINDOW                        = 1 << 2;
const HoveredFlags HOVERED_FLAGS_NO_POPUP_HIERARCHY                = 1 << 3;
const HoveredFlags HOVERED_FLAGS_ALLOW_WHEN_BLOCKED_BY_POPUP       = 1 << 5;
const HoveredFlags HOVERED_FLAGS_ALLOW_WHEN_BLOCKED_BY_ACTIVE_ITEM = 1 << 7;
const HoveredFlags HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED_BY_ITEM     = 1 << 8;
const HoveredFlags HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED_BY_WINDOW   = 1 << 9;
const HoveredFlags HOVERED_FLAGS_ALLOW_WHEN_DISABLED               = 1 << 10;
const HoveredFlags HOVERED_FLAGS_NO_NAV_OVERRIDE                   = 1 << 11;
const HoveredFlags HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED             = HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED_BY_ITEM | HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED_BY_WINDOW;
const HoveredFlags HOVERED_FLAGS_RECT_ONLY                         = HOVERED_FLAGS_ALLOW_WHEN_BLOCKED_BY_POPUP | HOVERED_FLAGS_ALLOW_WHEN_BLOCKED_BY_ACTIVE_ITEM | HOVERED_FLAGS_ALLOW_WHEN_OVERLAPPED;
const HoveredFlags HOVERED_FLAGS_ROOT_AND_CHILD_WINDOWS            = HOVERED_FLAGS_ROOT_WINDOW | HOVERED_FLAGS_CHILD_WINDOWS;
const HoveredFlags HOVERED_FLAGS_FOR_TOOLTIP                       = 1 << 12;
const HoveredFlags HOVERED_FLAGS_STATIONARY                        = 1 << 13;
const HoveredFlags HOVERED_FLAGS_DELAY_NONE                        = 1 << 14;
const HoveredFlags HOVERED_FLAGS_DELAY_SHORT                       = 1 << 15;
const HoveredFlags HOVERED_FLAGS_DELAY_NORMAL                      = 1 << 16;
const HoveredFlags HOVERED_FLAGS_NO_SHARED_DELAY                   = 1 << 17;

// ImGuiInputFlags_
def InputFlags = int;
const InputFlags INPUT_FLAGS_NONE                    = 0;
const InputFlags INPUT_FLAGS_REPEAT                  = 1 << 0;
const InputFlags INPUT_FLAGS_ROUTE_ACTIVE            = 1 << 10;
const InputFlags INPUT_FLAGS_ROUTE_FOCUSED           = 1 << 11;
const InputFlags INPUT_FLAGS_ROUTE_GLOBAL            = 1 << 12;
const InputFlags INPUT_FLAGS_ROUTE_ALWAYS            = 1 << 13;
const InputFlags INPUT_FLAGS_ROUTE_OVER_FOCUSED      = 1 << 14;
const InputFlags INPUT_FLAGS_ROUTE_OVER_ACTIVE       = 1 << 15;
const InputFlags INPUT_FLAGS_ROUTE_UNLESS_BG_FOCUSED = 1 << 16;
const InputFlags INPUT_FLAGS_ROUTE_FROM_ROOT_WINDOW  = 1 << 17;
const InputFlags INPUT_FLAGS_TOOLTIP                 = 1 << 18;

// ImGuiViewportFlags_
def ViewportFlags = int;
const ViewportFlags VIEWPORT_FLAGS_NONE                = 0;
const ViewportFlags VIEWPORT_FLAGS_IS_PLATFORM_WINDOW  = 1 << 0;
const ViewportFlags VIEWPORT_FLAGS_IS_PLATFORM_MONITOR = 1 << 1;
const ViewportFlags VIEWPORT_FLAGS_OWNED_BY_APP        = 1 << 2;

// ImGuiFocusedFlags_
def FocusedFlags = int;
const FocusedFlags FOCUSED_FLAGS_NONE                   = 0;
const FocusedFlags FOCUSED_FLAGS_CHILD_WINDOWS          = 1 << 0;
const FocusedFlags FOCUSED_FLAGS_ROOT_WINDOW            = 1 << 1;
const FocusedFlags FOCUSED_FLAGS_ANY_WINDOW             = 1 << 2;
const FocusedFlags FOCUSED_FLAGS_NO_POPUP_HIERARCHY     = 1 << 3;
const FocusedFlags FOCUSED_FLAGS_ROOT_AND_CHILD_WINDOWS = FOCUSED_FLAGS_ROOT_WINDOW | FOCUSED_FLAGS_CHILD_WINDOWS;

// ImGuiSortDirection
def SortDirection = ImU8;
const SortDirection SORT_DIRECTION_NONE       = 0;
const SortDirection SORT_DIRECTION_ASCENDING  = 1;
const SortDirection SORT_DIRECTION_DESCENDING = 2;

// ImGuiInputTextFlags_
def InputTextFlags = int;
const InputTextFlags INPUT_TEXT_FLAGS_NONE                    = 0;
const InputTextFlags INPUT_TEXT_FLAGS_CHARS_DECIMAL           = 1 << 0;
const InputTextFlags INPUT_TEXT_FLAGS_CHARS_HEXADECIMAL       = 1 << 1;
const InputTextFlags INPUT_TEXT_FLAGS_CHARS_SCIENTIFIC        = 1 << 2;
const InputTextFlags INPUT_TEXT_FLAGS_CHARS_UPPERCASE         = 1 << 3;
const InputTextFlags INPUT_TEXT_FLAGS_CHARS_NO_BLANK          = 1 << 4;
const InputTextFlags INPUT_TEXT_FLAGS_ALLOW_TAB_INPUT         = 1 << 5;
const InputTextFlags INPUT_TEXT_FLAGS_ENTER_RETURNS_TRUE      = 1 << 6;
const InputTextFlags INPUT_TEXT_FLAGS_ESCAPE_CLEARS_ALL       = 1 << 7;
const InputTextFlags INPUT_TEXT_FLAGS_CTRL_ENTER_FOR_NEW_LINE = 1 << 8;
const InputTextFlags INPUT_TEXT_FLAGS_READ_ONLY               = 1 << 9;
const InputTextFlags INPUT_TEXT_FLAGS_PASSWORD                = 1 << 10;
const InputTextFlags INPUT_TEXT_FLAGS_ALWAYS_OVERWRITE        = 1 << 11;
const InputTextFlags INPUT_TEXT_FLAGS_AUTO_SELECT_ALL         = 1 << 12;
const InputTextFlags INPUT_TEXT_FLAGS_PARSE_EMPTY_REF_VAL     = 1 << 13;
const InputTextFlags INPUT_TEXT_FLAGS_DISPLAY_EMPTY_REF_VAL   = 1 << 14;
const InputTextFlags INPUT_TEXT_FLAGS_NO_HORIZONTAL_SCROLL    = 1 << 15;
const InputTextFlags INPUT_TEXT_FLAGS_NO_UNDO_REDO            = 1 << 16;
const InputTextFlags INPUT_TEXT_FLAGS_CALLBACK_COMPLETION     = 1 << 17;
const InputTextFlags INPUT_TEXT_FLAGS_CALLBACK_HISTORY        = 1 << 18;
const InputTextFlags INPUT_TEXT_FLAGS_CALLBACK_ALWAYS         = 1 << 19;
const InputTextFlags INPUT_TEXT_FLAGS_CALLBACK_CHAR_FILTER    = 1 << 20;
const InputTextFlags INPUT_TEXT_FLAGS_CALLBACK_RESIZE         = 1 << 21;
const InputTextFlags INPUT_TEXT_FLAGS_CALLBACK_EDIT           = 1 << 22;

// ImGuiMouseButton_
def MouseButton = int;
const MouseButton MOUSE_BUTTON_LEFT   = 0;
const MouseButton MOUSE_BUTTON_RIGHT  = 1;
const MouseButton MOUSE_BUTTON_MIDDLE = 2;
const MouseButton MOUSE_BUTTON_COUNT  = 5;

// ImGuiSliderFlags_
def SliderFlags = int;
const SliderFlags SLIDER_FLAGS_NONE               = 0;
const SliderFlags SLIDER_FLAGS_LOGARITHMIC        = 1 << 5;
const SliderFlags SLIDER_FLAGS_NO_ROUND_TO_FORMAT = 1 << 6;
const SliderFlags SLIDER_FLAGS_NO_INPUT           = 1 << 7;
const SliderFlags SLIDER_FLAGS_WRAP_AROUND        = 1 << 8;
const SliderFlags SLIDER_FLAGS_CLAMP_ON_INPUT     = 1 << 9;
const SliderFlags SLIDER_FLAGS_CLAMP_ZERO_RANGE   = 1 << 10;
const SliderFlags SLIDER_FLAGS_ALWAYS_CLAMP       = SLIDER_FLAGS_CLAMP_ON_INPUT | SLIDER_FLAGS_CLAMP_ZERO_RANGE;
const SliderFlags SLIDER_FLAGS_INVALID_MASK       = 0x7000000F;

// ImGuiItemFlags_
def ItemFlags = int;
const ItemFlags ITEM_FLAGS_NONE                 = 0;
const ItemFlags ITEM_FLAGS_NO_TAB_STOP          = 1 << 0;
const ItemFlags ITEM_FLAGS_NO_NAV               = 1 << 1;
const ItemFlags ITEM_FLAGS_NO_NAV_DEFAULT_FOCUS = 1 << 2;
const ItemFlags ITEM_FLAGS_BUTTON_REPEAT        = 1 << 3;
const ItemFlags ITEM_FLAGS_AUTO_CLOSE_POPUPS    = 1 << 4;
const ItemFlags ITEM_FLAGS_ALLOW_DUPLICATE_ID   = 1 << 5;

// ImGuiDataType_
def DataType = int;
const DataType DATA_TYPE_S8     = 0;
const DataType DATA_TYPE_U8     = 1;
const DataType DATA_TYPE_S16    = 2;
const DataType DATA_TYPE_U16    = 3;
const DataType DATA_TYPE_S32    = 4;
const DataType DATA_TYPE_U32    = 5;
const DataType DATA_TYPE_S64    = 6;
const DataType DATA_TYPE_U64    = 7;
const DataType DATA_TYPE_FLOAT  = 8;
const DataType DATA_TYPE_DOUBLE = 9;
const DataType DATA_TYPE_BOOL   = 10;
const DataType DATA_TYPE_COUNT  = 11;

// ImGuiTreeNodeFlags_
def TreeNodeFlags = int;
const TreeNodeFlags TREE_NODE_FLAGS_NONE                     = 0;
const TreeNodeFlags TREE_NODE_FLAGS_SELECTED                 = 1 << 0;
const TreeNodeFlags TREE_NODE_FLAGS_FRAMED                   = 1 << 1;
const TreeNodeFlags TREE_NODE_FLAGS_ALLOW_OVERLAP            = 1 << 2;
const TreeNodeFlags TREE_NODE_FLAGS_NO_TREE_PUSH_ON_OPEN     = 1 << 3;
const TreeNodeFlags TREE_NODE_FLAGS_NO_AUTO_OPEN_ON_LOG      = 1 << 4;
const TreeNodeFlags TREE_NODE_FLAGS_DEFAULT_OPEN             = 1 << 5;
const TreeNodeFlags TREE_NODE_FLAGS_OPEN_ON_DOUBLE_CLICK     = 1 << 6;
const TreeNodeFlags TREE_NODE_FLAGS_OPEN_ON_ARROW            = 1 << 7;
const TreeNodeFlags TREE_NODE_FLAGS_LEAF                     = 1 << 8;
const TreeNodeFlags TREE_NODE_FLAGS_BULLET                   = 1 << 9;
const TreeNodeFlags TREE_NODE_FLAGS_FRAME_PADDING            = 1 << 10;
const TreeNodeFlags TREE_NODE_FLAGS_SPAN_AVAIL_WIDTH         = 1 << 11;
const TreeNodeFlags TREE_NODE_FLAGS_SPAN_FULL_WIDTH          = 1 << 12;
const TreeNodeFlags TREE_NODE_FLAGS_SPAN_TEXT_WIDTH          = 1 << 13;
const TreeNodeFlags TREE_NODE_FLAGS_SPAN_ALL_COLUMNS         = 1 << 14;
const TreeNodeFlags TREE_NODE_FLAGS_NAV_LEFT_JUMPS_BACK_HERE = 1 << 15;
const TreeNodeFlags TREE_NODE_FLAGS_COLLAPSING_HEADER        = TREE_NODE_FLAGS_FRAMED | TREE_NODE_FLAGS_NO_TREE_PUSH_ON_OPEN | TREE_NODE_FLAGS_NO_AUTO_OPEN_ON_LOG;

// ImGuiTableBgTarget_
def TableBgTarget = int;
const TableBgTarget TABLE_BG_TARGET_NONE    = 0;
const TableBgTarget TABLE_BG_TARGET_ROW_BG0 = 1;
const TableBgTarget TABLE_BG_TARGET_ROW_BG1 = 2;
const TableBgTarget TABLE_BG_TARGET_CELL_BG = 3;

// ImGuiConfigFlags_
def ConfigFlags = int;
const ConfigFlags CONFIG_FLAGS_NONE                   = 0;
const ConfigFlags CONFIG_FLAGS_NAV_ENABLE_KEYBOARD    = 1 << 0;
const ConfigFlags CONFIG_FLAGS_NAV_ENABLE_GAMEPAD     = 1 << 1;
const ConfigFlags CONFIG_FLAGS_NO_MOUSE               = 1 << 4;
const ConfigFlags CONFIG_FLAGS_NO_MOUSE_CURSOR_CHANGE = 1 << 5;
const ConfigFlags CONFIG_FLAGS_NO_KEYBOARD            = 1 << 6;
const ConfigFlags CONFIG_FLAGS_IS_SRGB                = 1 << 20;
const ConfigFlags CONFIG_FLAGS_IS_TOUCH_SCREEN        = 1 << 21;

// ImGuiCol_
def Col = int;
const Col COL_TEXT                         = 0;
const Col COL_TEXT_DISABLED                = 1;
const Col COL_WINDOW_BG                    = 2;
const Col COL_CHILD_BG                     = 3;
const Col COL_POPUP_BG                     = 4;
const Col COL_BORDER                       = 5;
const Col COL_BORDER_SHADOW                = 6;
const Col COL_FRAME_BG                     = 7;
const Col COL_FRAME_BG_HOVERED             = 8;
const Col COL_FRAME_BG_ACTIVE              = 9;
const Col COL_TITLE_BG                     = 10;
const Col COL_TITLE_BG_ACTIVE              = 11;
const Col COL_TITLE_BG_COLLAPSED           = 12;
const Col COL_MENU_BAR_BG                  = 13;
const Col COL_SCROLLBAR_BG                 = 14;
const Col COL_SCROLLBAR_GRAB               = 15;
const Col COL_SCROLLBAR_GRAB_HOVERED       = 16;
const Col COL_SCROLLBAR_GRAB_ACTIVE        = 17;
const Col COL_CHECK_MARK                   = 18;
const Col COL_SLIDER_GRAB                  = 19;
const Col COL_SLIDER_GRAB_ACTIVE           = 20;
const Col COL_BUTTON                       = 21;
const Col COL_BUTTON_HOVERED               = 22;
const Col COL_BUTTON_ACTIVE                = 23;
const Col COL_HEADER                       = 24;
const Col COL_HEADER_HOVERED               = 25;
const Col COL_HEADER_ACTIVE                = 26;
const Col COL_SEPARATOR                    = 27;
const Col COL_SEPARATOR_HOVERED            = 28;
const Col COL_SEPARATOR_ACTIVE             = 29;
const Col COL_RESIZE_GRIP                  = 30;
const Col COL_RESIZE_GRIP_HOVERED          = 31;
const Col COL_RESIZE_GRIP_ACTIVE           = 32;
const Col COL_TAB_HOVERED                  = 33;
const Col COL_TAB                          = 34;
const Col COL_TAB_SELECTED                 = 35;
const Col COL_TAB_SELECTED_OVERLINE        = 36;
const Col COL_TAB_DIMMED                   = 37;
const Col COL_TAB_DIMMED_SELECTED          = 38;
const Col COL_TAB_DIMMED_SELECTED_OVERLINE = 39;
const Col COL_PLOT_LINES                   = 40;
const Col COL_PLOT_LINES_HOVERED           = 41;
const Col COL_PLOT_HISTOGRAM               = 42;
const Col COL_PLOT_HISTOGRAM_HOVERED       = 43;
const Col COL_TABLE_HEADER_BG              = 44;
const Col COL_TABLE_BORDER_STRONG          = 45;
const Col COL_TABLE_BORDER_LIGHT           = 46;
const Col COL_TABLE_ROW_BG                 = 47;
const Col COL_TABLE_ROW_BG_ALT             = 48;
const Col COL_TEXT_LINK                    = 49;
const Col COL_TEXT_SELECTED_BG             = 50;
const Col COL_DRAG_DROP_TARGET             = 51;
const Col COL_NAV_CURSOR                   = 52;
const Col COL_NAV_WINDOWING_HIGHLIGHT      = 53;
const Col COL_NAV_WINDOWING_DIM_BG         = 54;
const Col COL_MODAL_WINDOW_DIM_BG          = 55;
const Col COL_COUNT                        = 56;

// ImGuiKey
def Key = int;
const Key KEY_NONE                   = 0;
const Key KEY_NAMED_KEY_BEGIN        = 512;
const Key KEY_TAB                    = 512;
const Key KEY_LEFT_ARROW             = 513;
const Key KEY_RIGHT_ARROW            = 514;
const Key KEY_UP_ARROW               = 515;
const Key KEY_DOWN_ARROW             = 516;
const Key KEY_PAGE_UP                = 517;
const Key KEY_PAGE_DOWN              = 518;
const Key KEY_HOME                   = 519;
const Key KEY_END                    = 520;
const Key KEY_INSERT                 = 521;
const Key KEY_DELETE                 = 522;
const Key KEY_BACKSPACE              = 523;
const Key KEY_SPACE                  = 524;
const Key KEY_ENTER                  = 525;
const Key KEY_ESCAPE                 = 526;
const Key KEY_LEFT_CTRL              = 527;
const Key KEY_LEFT_SHIFT             = 528;
const Key KEY_LEFT_ALT               = 529;
const Key KEY_LEFT_SUPER             = 530;
const Key KEY_RIGHT_CTRL             = 531;
const Key KEY_RIGHT_SHIFT            = 532;
const Key KEY_RIGHT_ALT              = 533;
const Key KEY_RIGHT_SUPER            = 534;
const Key KEY_MENU                   = 535;
const Key KEY_0                      = 536;
const Key KEY_1                      = 537;
const Key KEY_2                      = 538;
const Key KEY_3                      = 539;
const Key KEY_4                      = 540;
const Key KEY_5                      = 541;
const Key KEY_6                      = 542;
const Key KEY_7                      = 543;
const Key KEY_8                      = 544;
const Key KEY_9                      = 545;
const Key KEY_A                      = 546;
const Key KEY_B                      = 547;
const Key KEY_C                      = 548;
const Key KEY_D                      = 549;
const Key KEY_E                      = 550;
const Key KEY_F                      = 551;
const Key KEY_G                      = 552;
const Key KEY_H                      = 553;
const Key KEY_I                      = 554;
const Key KEY_J                      = 555;
const Key KEY_K                      = 556;
const Key KEY_L                      = 557;
const Key KEY_M                      = 558;
const Key KEY_N                      = 559;
const Key KEY_O                      = 560;
const Key KEY_P                      = 561;
const Key KEY_Q                      = 562;
const Key KEY_R                      = 563;
const Key KEY_S                      = 564;
const Key KEY_T                      = 565;
const Key KEY_U                      = 566;
const Key KEY_V                      = 567;
const Key KEY_W                      = 568;
const Key KEY_X                      = 569;
const Key KEY_Y                      = 570;
const Key KEY_Z                      = 571;
const Key KEY_F1                     = 572;
const Key KEY_F2                     = 573;
const Key KEY_F3                     = 574;
const Key KEY_F4                     = 575;
const Key KEY_F5                     = 576;
const Key KEY_F6                     = 577;
const Key KEY_F7                     = 578;
const Key KEY_F8                     = 579;
const Key KEY_F9                     = 580;
const Key KEY_F10                    = 581;
const Key KEY_F11                    = 582;
const Key KEY_F12                    = 583;
const Key KEY_F13                    = 584;
const Key KEY_F14                    = 585;
const Key KEY_F15                    = 586;
const Key KEY_F16                    = 587;
const Key KEY_F17                    = 588;
const Key KEY_F18                    = 589;
const Key KEY_F19                    = 590;
const Key KEY_F20                    = 591;
const Key KEY_F21                    = 592;
const Key KEY_F22                    = 593;
const Key KEY_F23                    = 594;
const Key KEY_F24                    = 595;
const Key KEY_APOSTROPHE             = 596;
const Key KEY_COMMA                  = 597;
const Key KEY_MINUS                  = 598;
const Key KEY_PERIOD                 = 599;
const Key KEY_SLASH                  = 600;
const Key KEY_SEMICOLON              = 601;
const Key KEY_EQUAL                  = 602;
const Key KEY_LEFT_BRACKET           = 603;
const Key KEY_BACKSLASH              = 604;
const Key KEY_RIGHT_BRACKET          = 605;
const Key KEY_GRAVE_ACCENT           = 606;
const Key KEY_CAPS_LOCK              = 607;
const Key KEY_SCROLL_LOCK            = 608;
const Key KEY_NUM_LOCK               = 609;
const Key KEY_PRINT_SCREEN           = 610;
const Key KEY_PAUSE                  = 611;
const Key KEY_KEYPAD0                = 612;
const Key KEY_KEYPAD1                = 613;
const Key KEY_KEYPAD2                = 614;
const Key KEY_KEYPAD3                = 615;
const Key KEY_KEYPAD4                = 616;
const Key KEY_KEYPAD5                = 617;
const Key KEY_KEYPAD6                = 618;
const Key KEY_KEYPAD7                = 619;
const Key KEY_KEYPAD8                = 620;
const Key KEY_KEYPAD9                = 621;
const Key KEY_KEYPAD_DECIMAL         = 622;
const Key KEY_KEYPAD_DIVIDE          = 623;
const Key KEY_KEYPAD_MULTIPLY        = 624;
const Key KEY_KEYPAD_SUBTRACT        = 625;
const Key KEY_KEYPAD_ADD             = 626;
const Key KEY_KEYPAD_ENTER           = 627;
const Key KEY_KEYPAD_EQUAL           = 628;
const Key KEY_APP_BACK               = 629;
const Key KEY_APP_FORWARD            = 630;
const Key KEY_GAMEPAD_START          = 631;
const Key KEY_GAMEPAD_BACK           = 632;
const Key KEY_GAMEPAD_FACE_LEFT      = 633;
const Key KEY_GAMEPAD_FACE_RIGHT     = 634;
const Key KEY_GAMEPAD_FACE_UP        = 635;
const Key KEY_GAMEPAD_FACE_DOWN      = 636;
const Key KEY_GAMEPAD_DPAD_LEFT      = 637;
const Key KEY_GAMEPAD_DPAD_RIGHT     = 638;
const Key KEY_GAMEPAD_DPAD_UP        = 639;
const Key KEY_GAMEPAD_DPAD_DOWN      = 640;
const Key KEY_GAMEPAD_L1             = 641;
const Key KEY_GAMEPAD_R1             = 642;
const Key KEY_GAMEPAD_L2             = 643;
const Key KEY_GAMEPAD_R2             = 644;
const Key KEY_GAMEPAD_L3             = 645;
const Key KEY_GAMEPAD_R3             = 646;
const Key KEY_GAMEPAD_L_STICK_LEFT   = 647;
const Key KEY_GAMEPAD_L_STICK_RIGHT  = 648;
const Key KEY_GAMEPAD_L_STICK_UP     = 649;
const Key KEY_GAMEPAD_L_STICK_DOWN   = 650;
const Key KEY_GAMEPAD_R_STICK_LEFT   = 651;
const Key KEY_GAMEPAD_R_STICK_RIGHT  = 652;
const Key KEY_GAMEPAD_R_STICK_UP     = 653;
const Key KEY_GAMEPAD_R_STICK_DOWN   = 654;
const Key KEY_MOUSE_LEFT             = 655;
const Key KEY_MOUSE_RIGHT            = 656;
const Key KEY_MOUSE_MIDDLE           = 657;
const Key KEY_MOUSE_X1               = 658;
const Key KEY_MOUSE_X2               = 659;
const Key KEY_MOUSE_WHEEL_X          = 660;
const Key KEY_MOUSE_WHEEL_Y          = 661;
const Key KEY_RESERVED_FOR_MOD_CTRL  = 662;
const Key KEY_RESERVED_FOR_MOD_SHIFT = 663;
const Key KEY_RESERVED_FOR_MOD_ALT   = 664;
const Key KEY_RESERVED_FOR_MOD_SUPER = 665;
const Key KEY_NAMED_KEY_END          = 666;
const Key MOD_NONE                   = 0;
const Key MOD_CTRL                   = 1 << 12;
const Key MOD_SHIFT                  = 1 << 13;
const Key MOD_ALT                    = 1 << 14;
const Key MOD_SUPER                  = 1 << 15;
const Key MOD_MASK                   = 0xF000;
const Key KEY_NAMED_KEY_COUNT        = 154;

// ImGuiWindowFlags_
def WindowFlags = int;
const WindowFlags WINDOW_FLAGS_NONE                        = 0;
const WindowFlags WINDOW_FLAGS_NO_TITLE_BAR                = 1 << 0;
const WindowFlags WINDOW_FLAGS_NO_RESIZE                   = 1 << 1;
const WindowFlags WINDOW_FLAGS_NO_MOVE                     = 1 << 2;
const WindowFlags WINDOW_FLAGS_NO_SCROLLBAR                = 1 << 3;
const WindowFlags WINDOW_FLAGS_NO_SCROLL_WITH_MOUSE        = 1 << 4;
const WindowFlags WINDOW_FLAGS_NO_COLLAPSE                 = 1 << 5;
const WindowFlags WINDOW_FLAGS_ALWAYS_AUTO_RESIZE          = 1 << 6;
const WindowFlags WINDOW_FLAGS_NO_BACKGROUND               = 1 << 7;
const WindowFlags WINDOW_FLAGS_NO_SAVED_SETTINGS           = 1 << 8;
const WindowFlags WINDOW_FLAGS_NO_MOUSE_INPUTS             = 1 << 9;
const WindowFlags WINDOW_FLAGS_MENU_BAR                    = 1 << 10;
const WindowFlags WINDOW_FLAGS_HORIZONTAL_SCROLLBAR        = 1 << 11;
const WindowFlags WINDOW_FLAGS_NO_FOCUS_ON_APPEARING       = 1 << 12;
const WindowFlags WINDOW_FLAGS_NO_BRING_TO_FRONT_ON_FOCUS  = 1 << 13;
const WindowFlags WINDOW_FLAGS_ALWAYS_VERTICAL_SCROLLBAR   = 1 << 14;
const WindowFlags WINDOW_FLAGS_ALWAYS_HORIZONTAL_SCROLLBAR = 1<< 15;
const WindowFlags WINDOW_FLAGS_NO_NAV_INPUTS               = 1 << 16;
const WindowFlags WINDOW_FLAGS_NO_NAV_FOCUS                = 1 << 17;
const WindowFlags WINDOW_FLAGS_UNSAVED_DOCUMENT            = 1 << 18;
const WindowFlags WINDOW_FLAGS_NO_NAV                      = WINDOW_FLAGS_NO_NAV_INPUTS | WINDOW_FLAGS_NO_NAV_FOCUS;
const WindowFlags WINDOW_FLAGS_NO_DECORATION               = WINDOW_FLAGS_NO_TITLE_BAR | WINDOW_FLAGS_NO_RESIZE | WINDOW_FLAGS_NO_SCROLLBAR | WINDOW_FLAGS_NO_COLLAPSE;
const WindowFlags WINDOW_FLAGS_NO_INPUTS                   = WINDOW_FLAGS_NO_MOUSE_INPUTS | WINDOW_FLAGS_NO_NAV_INPUTS | WINDOW_FLAGS_NO_NAV_FOCUS;
const WindowFlags WINDOW_FLAGS_CHILD_WINDOW                = 1 << 24;
const WindowFlags WINDOW_FLAGS_TOOLTIP                     = 1 << 25;
const WindowFlags WINDOW_FLAGS_POPUP                       = 1 << 26;
const WindowFlags WINDOW_FLAGS_MODAL                       = 1 << 27;
const WindowFlags WINDOW_FLAGS_CHILD_MENU                  = 1 << 28;

// ImGuiMouseCursor_
def MouseCursor = int;
const MouseCursor MOUSE_CURSOR_NONE        = -1;
const MouseCursor MOUSE_CURSOR_ARROW       = 0;
const MouseCursor MOUSE_CURSOR_TEXT_INPUT  = 1;
const MouseCursor MOUSE_CURSOR_RESIZE_ALL  = 2;
const MouseCursor MOUSE_CURSOR_RESIZE_NS   = 3;
const MouseCursor MOUSE_CURSOR_RESIZE_EW   = 4;
const MouseCursor MOUSE_CURSOR_RESIZE_NESW = 5;
const MouseCursor MOUSE_CURSOR_RESIZE_NWSE = 6;
const MouseCursor MOUSE_CURSOR_HAND        = 7;
const MouseCursor MOUSE_CURSOR_NOT_ALLOWED = 8;
const MouseCursor MOUSE_CURSOR_COUNT       = 9;

// ImGuiComboFlags_
def ComboFlags = int;
const ComboFlags COMBO_FLAGS_NONE              = 0;
const ComboFlags COMBO_FLAGS_POPUP_ALIGN_LEFT  = 1 << 0;
const ComboFlags COMBO_FLAGS_HEIGHT_SMALL      = 1 << 1;
const ComboFlags COMBO_FLAGS_HEIGHT_REGULAR    = 1 << 2;
const ComboFlags COMBO_FLAGS_HEIGHT_LARGE      = 1 << 3;
const ComboFlags COMBO_FLAGS_HEIGHT_LARGEST    = 1 << 4;
const ComboFlags COMBO_FLAGS_NO_ARROW_BUTTON   = 1 << 5;
const ComboFlags COMBO_FLAGS_NO_PREVIEW        = 1 << 6;
const ComboFlags COMBO_FLAGS_WIDTH_FIT_PREVIEW = 1 << 7;
const ComboFlags COMBO_FLAGS_HEIGHT_MASK       = COMBO_FLAGS_HEIGHT_SMALL | COMBO_FLAGS_HEIGHT_REGULAR | COMBO_FLAGS_HEIGHT_LARGE | COMBO_FLAGS_HEIGHT_LARGEST;

// ImDrawListFlags_
def DrawListFlags = int;
const DrawListFlags DRAW_LIST_FLAGS_NONE                       = 0;
const DrawListFlags DRAW_LIST_FLAGS_ANTI_ALIASED_LINES         = 1 << 0;
const DrawListFlags DRAW_LIST_FLAGS_ANTI_ALIASED_LINES_USE_TEX = 1 << 1;
const DrawListFlags DRAW_LIST_FLAGS_ANTI_ALIASED_FILL          = 1 << 2;
const DrawListFlags DRAW_LIST_FLAGS_ALLOW_VTX_OFFSET           = 1 << 3;

// ImGuiMouseSource
def MouseSource = int;
const MouseSource MOUSE_SOURCE_MOUSE        = 0;
const MouseSource MOUSE_SOURCE_TOUCH_SCREEN = 1;
const MouseSource MOUSE_SOURCE_PEN          = 2;
const MouseSource MOUSE_SOURCE_COUNT        = 3;

// ImGuiTabItemFlags_
def TabItemFlags = int;
const TabItemFlags TAB_ITEM_FLAGS_NONE                              = 0;
const TabItemFlags TAB_ITEM_FLAGS_UNSAVED_DOCUMENT                  = 1 << 0;
const TabItemFlags TAB_ITEM_FLAGS_SET_SELECTED                      = 1 << 1;
const TabItemFlags TAB_ITEM_FLAGS_NO_CLOSE_WITH_MIDDLE_MOUSE_BUTTON = 1 << 2;
const TabItemFlags TAB_ITEM_FLAGS_NO_PUSH_ID                        = 1 << 3;
const TabItemFlags TAB_ITEM_FLAGS_NO_TOOLTIP                        = 1 << 4;
const TabItemFlags TAB_ITEM_FLAGS_NO_REORDER                        = 1 << 5;
const TabItemFlags TAB_ITEM_FLAGS_LEADING                           = 1 << 6;
const TabItemFlags TAB_ITEM_FLAGS_TRAILING                          = 1 << 7;
const TabItemFlags TAB_ITEM_FLAGS_NO_ASSUMED_CLOSURE                = 1 << 8;

