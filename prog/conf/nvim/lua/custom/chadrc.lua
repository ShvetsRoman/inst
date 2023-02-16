local M = {}

local pluginConf = require "custom.plugins.configs"

M.plugins = {
-- Install plugin
  -- ["lewis6991/hover.nvim"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function() require "custom.plugins.null-ls" end,
  },

-- remove plugin
  -- ["neovim/nvim-lspconfig"] = false

-- Override plugin config
  ["NvChad/ui"] = { override_options = pluginConf.statuslineMy, },
  ["nvim-tree/nvim-tree.lua"] = { override_options = pluginConf.nvimtreeMy, },
  ["williamboman/mason.nvim"] = { override_options = pluginConf.masonMy, },
}

-- Default Theme
M.ui = {
  -- theme = "gatekeeper",
  -- transparency = true,
}

-- Mapping User
M.mappings = require "custom.mappings"

return M
