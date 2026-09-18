local wezterm = require "wezterm"

local act = wezterm.action

return {

    -- ВКЛАДКИ
    { key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab "CurrentPaneDomain" },
    { key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentTab { confirm = false } },

    { key = "n", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
    { key = "p", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },

    { key = "1", mods = "CTRL|SHIFT", action = act.ActivateTab(0) },
    { key = "2", mods = "CTRL|SHIFT", action = act.ActivateTab(1) },
    { key = "3", mods = "CTRL|SHIFT", action = act.ActivateTab(2) },
    { key = "4", mods = "CTRL|SHIFT", action = act.ActivateTab(3) },
    { key = "5", mods = "CTRL|SHIFT", action = act.ActivateTab(4) },

    -- ПАНЕЛІ
    -- Ctrl+\ — вертикальний спліт
    {
        key = "\\",
        mods = "CTRL",
        action = act.SplitHorizontal {
            domain = "CurrentPaneDomain",
        },
    },

    -- Ctrl+- — горизонтальний спліт
    {
        key = "-",
        mods = "CTRL",
        action = act.SplitVertical {
            domain = "CurrentPaneDomain",
        },
    },

    -- НАВІГАЦІЯ МІЖ ПАНЕЛЯМИ
    { key = "h", mods = "CTRL", action = act.ActivatePaneDirection "Left" },
    { key = "l", mods = "CTRL", action = act.ActivatePaneDirection "Right" },
    { key = "k", mods = "CTRL", action = act.ActivatePaneDirection "Up" },
    { key = "j", mods = "CTRL", action = act.ActivatePaneDirection "Down" },

    -- РОЗМІР ПАНЕЛІ
    {
        key = "LeftArrow",
        mods = "ALT|SHIFT",
        action = act.AdjustPaneSize { "Left", 2 },
    },

    {
        key = "RightArrow",
        mods = "ALT|SHIFT",
        action = act.AdjustPaneSize { "Right", 2 },
    },

    {
        key = "UpArrow",
        mods = "ALT|SHIFT",
        action = act.AdjustPaneSize { "Up", 2 },
    },

    {
        key = "DownArrow",
        mods = "ALT|SHIFT",
        action = act.AdjustPaneSize { "Down", 2 },
    },

    -- ЗАКРИТИ ПАНЕЛЬ
    {
        key = "x",
        mods = "CTRL|SHIFT",
        action = act.CloseCurrentPane {
            confirm = false,
        },
    },

    -- ZOOM
    {
        key = "z",
        mods = "CTRL|SHIFT",
        action = act.TogglePaneZoomState,
    },

    -- РОЗМІР ШРИФТУ
    { key = "+", mods = "CTRL", action = act.IncreaseFontSize },
    { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
    { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
    { key = "0", mods = "CTRL", action = act.ResetFontSize },

    -- COPY / PASTE
    {
        key = "c",
        mods = "CTRL|SHIFT",
        action = act.CopyTo "Clipboard",
    },

    {
        key = "v",
        mods = "CTRL|SHIFT",
        action = act.PasteFrom "Clipboard",
    },

    -- ПОШУК
    {
        key = "f",
        mods = "CTRL|SHIFT",
        action = act.Search "CurrentSelectionOrEmptyString",
    },

    -- CLEAR SCROLLBACK
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = act.ClearScrollback "ScrollbackAndViewport",
    },

    -- RELOAD CONFIG
    {
        key = "r",
        mods = "CTRL|SHIFT",
        action = act.ReloadConfiguration,
    },

    -- COMMAND PALETTE
    {
        key = "P",
        mods = "CTRL|SHIFT",
        action = act.ActivateCommandPalette,
    },

    -- COPY MODE
    {
        key = "Space",
        mods = "CTRL|SHIFT",
        action = act.ActivateCopyMode,
    },
}
