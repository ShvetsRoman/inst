-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

-- M.base46 = {
-- 	theme = "onedark",
-- 	hl_override = {
-- 		Comment = { italic = true },
-- 		["@comment"] = { italic = true },
-- 	},
-- }

-- BASE46
M.base46 = {
    theme = "onedark",

    hl_override = {

        -- EDITOR
        Normal = {
            bg = "NONE",
        },

        NormalNC = {
            bg = "NONE",
        },

        SignColumn = {
            bg = "NONE",
        },

        EndOfBuffer = {
            bg = "NONE",
        },

        NonText = {
            bg = "NONE",
        },

        -- CURSOR
        CursorLine = {
            bg = "NONE",
        },

        CursorColumn = {
            bg = "NONE",
        },

        -- FLOATING WINDOWS
        NormalFloat = {
            bg = "NONE",
        },

        FloatBorder = {
            bg = "NONE",
            bold = true,
        },

        FloatTitle = {
            bg = "NONE",
            bold = true,
        },

        -- COMPLETION MENU
        Pmenu = {
            bg = "NONE",
        },

        PmenuSel = {
            bg = "NONE",
            bold = true,
        },

        PmenuSbar = {
            bg = "NONE",
        },

        PmenuThumb = {
            bg = "NONE",
        },

        -- STATUSLINE
        StatusLine = {
            bg = "NONE",
        },

        StatusLineNC = {
            bg = "NONE",
        },

        -- TABLINE
        TabLine = {
            bg = "NONE",
        },

        TabLineFill = {
            bg = "NONE",
        },

        TabLineSel = {
            bg = "NONE",
            bold = true,
        },

        -- WINDOW SEPARATORS
        WinSeparator = {
            bg = "NONE",
        },

        VertSplit = {
            bg = "NONE",
        },

        -- TELESCOPE
        TelescopeNormal = {
            bg = "NONE",
        },

        TelescopeBorder = {
            bg = "NONE",
            bold = true,
        },

        TelescopePromptNormal = {
            bg = "NONE",
        },

        TelescopePromptBorder = {
            bg = "NONE",
            bold = true,
        },

        TelescopeResultsNormal = {
            bg = "NONE",
        },

        TelescopeResultsBorder = {
            bg = "NONE",
        },

        TelescopePreviewNormal = {
            bg = "NONE",
        },

        TelescopePreviewBorder = {
            bg = "NONE",
        },

        -- WHICH-KEY
        WhichKeyFloat = {
            bg = "NONE",
        },

        WhichKeyBorder = {
            bg = "NONE",
            bold = true,
        },

        -- LSP
        DiagnosticSignError = {
            bg = "NONE",
        },

        DiagnosticSignWarn = {
            bg = "NONE",
        },

        DiagnosticSignInfo = {
            bg = "NONE",
        },

        DiagnosticSignHint = {
            bg = "NONE",
        },

        -- COMMENTS
        Comment = {
            italic = true,
        },

        ["@comment"] = {
            italic = true,
        },
    },
}

-- NVCHAD UI
M.ui = {
    -- STATUSLINE
    statusline = {
    -- theme = "default", -- default/vscode/vscode_colored/minimal
    -- theme = "vscode", -- default/vscode/vscode_colored/minimal
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    -- theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "block",
    },

    -- NVIMTREE
    nvimtree = {
    sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 20,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    },

    -- TABUF
    -- tabufline = {
    --     enabled = true,
    --
    --     lazyload = true,
    --
    --     modules = {
    --         tabufline = {
    --             enabled = true,
    --         },
    --     },
    -- },

    -- DASHBOARD
    nvdash = {
        load_on_startup = true,
    },

    -- CMP
    cmp = {
        style = "default",
    },
}

return M
