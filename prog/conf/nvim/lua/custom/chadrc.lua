local M = {}

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
  -- transparency = true,
}

-- Mapping User
M.mappings = require "custom.mappings"

return M
