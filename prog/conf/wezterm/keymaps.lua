local wezterm = require "wezterm"

local act = wezterm.action

return {

    -- ============================================================
    -- HELIX / VIM / NEOVIM
    -- ============================================================

    -- Ctrl+W НЕ чіпаємо.
    -- Він повинен повністю передаватися термінальній програмі.
    --
    -- Тобто:
    -- Ctrl+W       -> Helix Window mode
    -- Ctrl+W h     -> Helix window left
    -- Ctrl+W j     -> Helix window down
    -- Ctrl+W k     -> Helix window up
    -- Ctrl+W l     -> Helix window right
    --
    -- Тут спеціально НІЯКОГО binding для Ctrl+W немає.


    -- ============================================================
    -- ВКЛАДКИ WEZTERM
    -- ============================================================

    -- Ctrl+Shift+T — нова вкладка
    {
        key = "t",
        mods = "CTRL|SHIFT",
        action = act.SpawnTab "CurrentPaneDomain",
    },

    -- Ctrl+Shift+W — закрити вкладку
    {
        key = "w",
        mods = "CTRL|SHIFT",
        action = act.CloseCurrentTab {
            confirm = false,
        },
    },

    -- Ctrl+Shift+N — наступна вкладка
    {
        key = "n",
        mods = "CTRL|SHIFT",
        action = act.ActivateTabRelative(1),
    },

    -- Ctrl+Shift+P — попередня вкладка
    {
        key = "p",
        mods = "CTRL|SHIFT",
        action = act.ActivateTabRelative(-1),
    },

    -- Ctrl+Shift+1..5 — вибір вкладки
    {
        key = "1",
        mods = "CTRL|SHIFT",
        action = act.ActivateTab(0),
    },

    {
        key = "2",
        mods = "CTRL|SHIFT",
        action = act.ActivateTab(1),
    },

    {
        key = "3",
        mods = "CTRL|SHIFT",
        action = act.ActivateTab(2),
    },

    {
        key = "4",
        mods = "CTRL|SHIFT",
        action = act.ActivateTab(3),
    },

    {
        key = "5",
        mods = "CTRL|SHIFT",
        action = act.ActivateTab(4),
    },


    -- ============================================================
    -- ПАНЕЛІ
    -- ============================================================

    -- Ctrl+\ — вертикальний split
    {
        key = "\\",
        mods = "CTRL",
        action = act.SplitHorizontal {
            domain = "CurrentPaneDomain",
        },
    },

    -- Ctrl+- — горизонтальний split
    {
        key = "-",
        mods = "CTRL",
        action = act.SplitVertical {
            domain = "CurrentPaneDomain",
        },
    },


    -- ============================================================
    -- НАВІГАЦІЯ МІЖ ПАНЕЛЯМИ
    -- ============================================================

    -- Ctrl+H — вліво
    {
        key = "h",
        mods = "CTRL",
        action = act.ActivatePaneDirection "Left",
    },

    -- Ctrl+L — вправо
    {
        key = "l",
        mods = "CTRL",
        action = act.ActivatePaneDirection "Right",
    },

    -- Ctrl+K — вгору
    {
        key = "k",
        mods = "CTRL",
        action = act.ActivatePaneDirection "Up",
    },

    -- Ctrl+J — вниз
    {
        key = "j",
        mods = "CTRL",
        action = act.ActivatePaneDirection "Down",
    },

    -- Ctrl+стрілки
    {
        key = "LeftArrow",
        mods = "CTRL",
        action = act.ActivatePaneDirection "Left",
    },

    {
        key = "RightArrow",
        mods = "CTRL",
        action = act.ActivatePaneDirection "Right",
    },

    {
        key = "UpArrow",
        mods = "CTRL",
        action = act.ActivatePaneDirection "Up",
    },

    {
        key = "DownArrow",
        mods = "CTRL",
        action = act.ActivatePaneDirection "Down",
    },


    -- ============================================================
    -- РОЗМІР ПАНЕЛІ
    -- ============================================================

    -- Alt+Shift+Left
    {
        key = "LeftArrow",
        mods = "ALT|SHIFT",
        action = act.AdjustPaneSize {
            "Left",
            2,
        },
    },

    -- Alt+Shift+Right
    {
        key = "RightArrow",
        mods = "ALT|SHIFT",
        action = act.AdjustPaneSize {
            "Right",
            2,
        },
    },

    -- Alt+Shift+Up
    {
        key = "UpArrow",
        mods = "ALT|SHIFT",
        action = act.AdjustPaneSize {
            "Up",
            2,
        },
    },

    -- Alt+Shift+Down
    {
        key = "DownArrow",
        mods = "ALT|SHIFT",
        action = act.AdjustPaneSize {
            "Down",
            2,
        },
    },


    -- ============================================================
    -- ЗАКРИТТЯ ПАНЕЛІ
    -- ============================================================

    -- Ctrl+Shift+X
    {
        key = "x",
        mods = "CTRL|SHIFT",
        action = act.CloseCurrentPane {
            confirm = false,
        },
    },


    -- ============================================================
    -- ZOOM
    -- ============================================================

    -- Ctrl+Shift+Z
    {
        key = "z",
        mods = "CTRL|SHIFT",
        action = act.TogglePaneZoomState,
    },


    -- ============================================================
    -- РОЗМІР ШРИФТУ
    -- ============================================================

    {
        key = "+",
        mods = "CTRL|SHIFT",
        action = act.IncreaseFontSize,
    },

    {
        key = "=",
        mods = "CTRL|SHIFT",
        action = act.IncreaseFontSize,
    },

    {
        key = "-",
        mods = "CTRL|SHIFT",
        action = act.DecreaseFontSize,
    },

    {
        key = "0",
        mods = "CTRL|SHIFT",
        action = act.ResetFontSize,
    },


    -- ============================================================
    -- COPY / PASTE
    -- ============================================================

    -- Ctrl+Shift+C
    {
        key = "c",
        mods = "CTRL|SHIFT",
        action = act.CopyTo "Clipboard",
    },

    -- Ctrl+Shift+V
    {
        key = "v",
        mods = "CTRL|SHIFT",
        action = act.PasteFrom "Clipboard",
    },


    -- ============================================================
    -- ПОШУК
    -- ============================================================

    -- Ctrl+Shift+F
    {
        key = "f",
        mods = "CTRL|SHIFT",
        action = act.Search "CurrentSelectionOrEmptyString",
    },


    -- ============================================================
    -- CLEAR SCROLLBACK
    -- ============================================================

    -- Ctrl+Shift+K
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = act.ClearScrollback "ScrollbackAndViewport",
    },


    -- ============================================================
    -- RELOAD CONFIG
    -- ============================================================

    -- Ctrl+Shift+R
    {
        key = "r",
        mods = "CTRL|SHIFT",
        action = act.ReloadConfiguration,
    },


    -- ============================================================
    -- COMMAND PALETTE
    -- ============================================================

    -- Ctrl+Shift+P
    {
        key = "o",
        mods = "CTRL|SHIFT",
        action = act.ActivateCommandPalette,
    },


    -- ============================================================
    -- COPY MODE
    -- ============================================================

    -- Ctrl+Shift+Space
    {
        key = "Space",
        mods = "CTRL|SHIFT",
        action = act.ActivateCopyMode,
    },
}
