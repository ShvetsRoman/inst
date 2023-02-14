local M = {}

local pluginConf = require "custom.plugins.configs"

M.plugins = {
-- Install plugin
  ["lewis6991/hover.nvim"] = pluginConf.hoverMy,

-- remove plugin
  -- ["neovim/nvim-lspconfig"] = false

-- Override plugin config
  ["NvChad/ui"] = pluginConf.statuslineMy,
  ["nvim-tree/nvim-tree.lua"] = pluginConf.nvimtreeMy,
}

-- Default Theme
M.ui = {
  -- theme = "gatekeeper",
  -- transparency = true,
}

-- Mapping User
M.mappings = require "custom.mappings"

return M
