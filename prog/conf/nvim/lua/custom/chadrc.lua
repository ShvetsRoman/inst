local M = {}

local pluginConf = require "custom.plugins.configs"
M.plugins = {
-- Install plugin
  install = {
    -- ["Pocco81/TrueZen.nvim"] = {},
  },
-- remove plugin
  remove = {
    -- "feline-nvim/feline.nvim",
  },
-- Override plugin config
  override = {
    ["NvChad/ui"] = pluginConf.statuslineMy,
    ["nvim-tree/nvim-tree.lua"] = pluginConf.nvimtreeMy,
  },
}

-- Default Theme
M.ui = {
  -- theme = "gatekeeper",
  -- transparency = true,
}

-- Mapping User
M.mappings = require "custom.mappings"

return M
