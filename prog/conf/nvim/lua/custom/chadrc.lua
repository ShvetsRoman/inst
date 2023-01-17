local M = {}

M.options = {
  require "custom.options",
}

local pluginConfs = require "custom.plugins.configs"
M.plugins = {
  remove = {
    -- "feline-nvim/feline.nvim",
  },

  override = {
    ["NvChad/ui"] = pluginConfs.statusline,
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
  },

}

-- Default Theme
M.ui = {
  -- theme = "onedark",
}

-- Mapping User
M.mappings = require "custom.mappings"

return M
