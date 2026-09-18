-- Pull in the wezterm API
local wezterm = require "wezterm"
local act = wezterm.action

-- Config builder (важливо: зберігаємо результат!)
local config = wezterm.config_builder and wezterm.config_builder() or {}

-- Wayland / X11
config.enable_wayland = true
config.xcursor_theme = "capitaine-cursors"

-- Зовнішній вигляд
config.color_scheme = "nord"
config.font = wezterm.font "FiraCode Nerd Font"
config.font_size = 16
config.window_background_opacity = 0.9
config.kde_window_background_blur = true

-- Таб-бар
config.enable_tab_bar = true
config.tab_bar_at_bottom = false      -- true — внизу
config.use_fancy_tab_bar = false      -- false = "retro" стиль, легше кастомізувати
config.hide_tab_bar_if_only_one_tab = true -- якщо одна вкладка, то її не показувати
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 32
-- Немає прямої опції висоти кнопок вкладки, але можна вплинути через:
config.window_padding = {
  left = 0, right = 0,
  top = 0, bottom = 0,
}

-- Title | Resize 
config.window_decorations = "TITLE | RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"

config.initial_rows = 35
config.initial_cols = 105

-- Затемнення неактивних панелей (зручно у vim-сплітах)
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5,
}

-- Курсор
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_thickness = "2px"

config.colors = {
  -- колір курсора
  cursor_bg = "#EBCB8B",   -- Nord yellow
  cursor_fg = "#2E3440",   -- Nord0
  cursor_border = "#EBCB8B",
  -- Фон таб-бара
  tab_bar = {
    background = "#2E3440",           -- Nord0
    -- Активна вкладка
    active_tab = {
      bg_color  = "#88C0D0",          -- Nord8 (блакитний)
      fg_color  = "#2E3440",          -- Nord0
      intensity = "Bold",
    },
    -- Неактивна вкладка
    inactive_tab = {
      bg_color = "#3B4252",           -- Nord1
      fg_color = "#D8DEE9",           -- Nord4
    },
    -- Неактивна вкладка під курсором миші
    inactive_tab_hover = {
      bg_color  = "#434C5E",          -- Nord2
      fg_color  = "#ECEFF4",          -- Nord6
      italic    = true,
    },
    -- Кнопка "нова вкладка" (+)
    new_tab = {
      bg_color = "#3B4252",
      fg_color = "#D8DEE9",
    },
    new_tab_hover = {
      bg_color  = "#88C0D0",
      fg_color  = "#2E3440",
      italic    = true,
    },
  },
}

-- ─── Кастомний рендер заголовків вкладок ─────────────────────────
-- Показує: [номер] назва-панелі [🔍 якщо zoom] [● якщо є активність]
wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover, max_width)
  local is_active = tab.is_active
  local is_hover  = hover

  -- Кольори залежно від стану вкладки (Nord-палітра)
  local bg, fg
  if is_active then
    bg, fg = "#88C0D0", "#2E3440"      -- Nord8 / Nord0 — активна
  elseif is_hover then
    bg, fg = "#434C5E", "#ECEFF4"      -- Nord2 / Nord6 — під курсором
  else
    bg, fg = "#3B4252", "#D8DEE9"      -- Nord1 / Nord4 — неактивна
  end

  -- Номер вкладки
  local index = (tab.tab_index + 1) .. ": "

  -- Назва (зазвичай шлях або ім'я процесу)
  local title = tab.active_pane.title or "shell"

  -- Індикатор zoom, якщо панель розгорнута на всю вкладку
  local zoom_icon = ""
  if tab.active_pane.is_zoomed then
    zoom_icon = "  "
  end

  -- Обрізаємо довгу назву під max_width
  local text = " " .. index .. title .. zoom_icon .. " "
  if #text > max_width then
    text = text:sub(1, max_width - 4) .. "... "
  end

  return {
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = text },
  }
end)

-- -- Бел
-- config.audible_bell = "Disabled"
-- config.visual_bell = {
--   fade_in_function = "EaseIn",
--   fade_in_duration_ms = 100,
--   fade_out_function = "EaseOut",
--   fade_out_duration_ms = 100,
-- }

-- Продуктивність
config.front_end = "WebGpu"   -- на Wayland зазвичай швидше за OpenGL
config.max_fps = 120
config.animation_fps = 120

-- Гарячі клавіші (vim-friendly)
-- Логіка: усі дії — на Ctrl+Shift+..., щоб не красти Ctrl+h/j/k/l у vim/tmux.
config.keys = {
  -- Вкладки
  { key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab "CurrentPaneDomain" },
  { key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentTab { confirm = false } },
  { key = "n", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
  { key = "p", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
  { key = "1", mods = "CTRL|SHIFT", action = act.ActivateTab(0) },
  { key = "2", mods = "CTRL|SHIFT", action = act.ActivateTab(1) },
  { key = "3", mods = "CTRL|SHIFT", action = act.ActivateTab(2) },
  { key = "4", mods = "CTRL|SHIFT", action = act.ActivateTab(3) },
  { key = "5", mods = "CTRL|SHIFT", action = act.ActivateTab(4) },

  -- Панелі (спліти)
  -- Ctrl+Shift+\ — вертикальний спліт (|)
  { key = "\\", mods = "CTRL", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  -- Ctrl+Shift+- — горизонтальний спліт (—)
  { key = "-",  mods = "CTRL", action = act.SplitVertical { domain = "CurrentPaneDomain" } },

  -- Навігація між панелями (з Shift — не заважає vim Ctrl+h/j/k/l)
  { key = "h", mods = "CTRL", action = act.ActivatePaneDirection "Left" },
  { key = "l", mods = "CTRL", action = act.ActivatePaneDirection "Right" },
  { key = "k", mods = "CTRL", action = act.ActivatePaneDirection "Up" },
  { key = "j", mods = "CTRL", action = act.ActivatePaneDirection "Down" },

  -- Зміна розміру панелі (Alt+Shift+стрілки — не конфліктує з vim)
  { key = "LeftArrow",  mods = "ALT|SHIFT", action = act.AdjustPaneSize { "Left", 2 } },
  { key = "RightArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize { "Right", 2 } },
  { key = "UpArrow",    mods = "ALT|SHIFT", action = act.AdjustPaneSize { "Up", 2 } },
  { key = "DownArrow",  mods = "ALT|SHIFT", action = act.AdjustPaneSize { "Down", 2 } },

  -- Закрити панель
  { key = "x", mods = "CTRL|SHIFT", action = act.CloseCurrentPane { confirm = false } },

  -- Zoom панелі (як <C-w>o у vim)
  { key = "z", mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },

  -- Розмір шрифту
  { key = "+", mods = "CTRL", action = act.IncreaseFontSize },
  { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
  { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
  { key = "0", mods = "CTRL", action = act.ResetFontSize },

  -- Копіювати / вставити (у стилі vim: Ctrl+Shift+C/V як у більшості терміналів)
  { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo "Clipboard" },
  { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom "Clipboard" },

  -- Швидкий пошук (як / у vim)
  { key = "f", mods = "CTRL|SHIFT", action = act.Search "CurrentSelectionOrEmptyString" },

  -- Очистити екран і скролбек (як :!clear)
  { key = "k", mods = "CTRL|SHIFT", action = act.ClearScrollback "ScrollbackAndViewport" },

  -- Перезавантажити конфіг без рестарту (дуже зручно при редагуванні)
  { key = "r", mods = "CTRL|SHIFT", action = act.ReloadConfiguration },

  -- Command Palette (як : у vim) — доступ до всіх дій WezTerm
  { key = "P", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },

  -- Копіювальний режим (як visual mode) — навігація стрілками/PgUp/PgDn
  { key = "Space", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },
}

-- Фінал
return config
