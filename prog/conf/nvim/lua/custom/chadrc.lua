local M = {}

M.options = {
  user = function()
    require("custom.options")
  end,
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

M.ui = {

-- Default Theme
  -- theme = "onedark",
}

-- Mapping User
M.mappings = require "custom.mappings"

return M
