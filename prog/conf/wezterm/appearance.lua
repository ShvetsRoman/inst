-- WEZTERM — ЗОВНІШНІЙ ВИГЛЯД
local wezterm = require "wezterm"

local appearance = {}

-- THEME
appearance.color_scheme = "nord"
-- appearance.color_scheme = "OneDark (base16)"

-- FONT
appearance.font = wezterm.font "FiraCode Nerd Font"
appearance.font_size = 16

-- BACKGROUND
appearance.window_background_opacity = 0.7

-- Розмиття фону для Wayland
appearance.wayland_window_background_blur = true

-- TAB BAR
appearance.enable_tab_bar = true
appearance.tab_bar_at_bottom = false
appearance.use_fancy_tab_bar = false
appearance.hide_tab_bar_if_only_one_tab = true
appearance.show_new_tab_button_in_tab_bar = false
appearance.tab_max_width = 32

-- WINDOW PADDING
appearance.window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
}

-- CURSOR
appearance.default_cursor_style = "SteadyBlock"
appearance.cursor_blink_rate = 0
appearance.cursor_blink_ease_in = "Constant"
appearance.cursor_blink_ease_out = "Constant"
appearance.cursor_thickness = "2px"

-- COLORS
appearance.colors = {
    -- Cursor
    cursor_bg = "#EBCB8B",
    cursor_fg = "#2E3440",
    cursor_border = "#EBCB8B",

    -- Tab bar
    tab_bar = {
        background = "#2E3440",

        -- Активна вкладка
        active_tab = {
            bg_color = "#88C0D0",
            fg_color = "#2E3440",
            intensity = "Bold",
        },

        -- Неактивна вкладка
        inactive_tab = {
            bg_color = "#3B4252",
            fg_color = "#D8DEE9",
        },

        -- Неактивна вкладка під курсором
        inactive_tab_hover = {
            bg_color = "#434C5E",
            fg_color = "#ECEFF4",
            italic = true,
        },

        -- Кнопка нової вкладки
        new_tab = {
            bg_color = "#3B4252",
            fg_color = "#D8DEE9",
        },

        -- Кнопка нової вкладки під курсором
        new_tab_hover = {
            bg_color = "#88C0D0",
            fg_color = "#2E3440",
            italic = true,
        },
    },
}

-- CUSTOM TAB TITLE
appearance.format_tab_title = function(
    tab,
    tabs,
    panes,
    cfg,
    hover,
    max_width
)
    local is_active = tab.is_active
    local is_hover = hover

    -- Кольори вкладки
    local bg, fg

    if is_active then
        bg, fg = "#88C0D0", "#2E3440"
    elseif is_hover then
        bg, fg = "#434C5E", "#ECEFF4"
    else
        bg, fg = "#3B4252", "#D8DEE9"
    end

    -- Номер вкладки
    local index = (tab.tab_index + 1) .. ": "

    -- Назва вкладки
    local title = tab.active_pane.title or "shell"

    -- Zoom indicator
    local zoom_icon = ""

    if tab.active_pane.is_zoomed then
        zoom_icon = "  "
    end

    -- Формуємо текст
    local text = " " .. index .. title .. zoom_icon .. " "

    -- Обмеження довжини
    if #text > max_width then
        text = text:sub(1, max_width - 4) .. "... "
    end

    -- Результат
    return {
        { Background = { Color = bg } },
        { Foreground = { Color = fg } },
        { Text = text },
    }
end

return appearance
