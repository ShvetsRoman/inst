-- custom/plugins/configs.lua file

local M = {}

M.masonMy = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- python
    "pyright",
    "python-lsp-server",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "emmet-ls",
    "json-lsp",

    -- shell
    "shfmt",
    "shellcheck",
  },
}

M.statuslineMy = {
  statusline = {
    separator_style = "block",  -- default/round/block/arrow
  },
}

M.nvimtreeMy = {
  git = {
    enable = false,
  },
  view = {
    hide_root_folder = false,
    adaptive_size = false,
    width = 25,
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

return M
