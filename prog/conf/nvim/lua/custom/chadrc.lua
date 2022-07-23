local M = {}

M.options = {
  user = function()
    require("custom.options")
  end,
}

local pluginConfs = require "custom.plugins.configs"
local pluginConfsUI = require "custom.plugins.configs_ui"
M.plugins = {
  remove = {
    -- "feline-nvim/feline.nvim",
  },

  override = {
    ["NvChad/ui"] = pluginConfsUI.statusline,
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
  },

}

M.ui = {

-- Default Theme
  -- theme = "one_light",
}

-- Mapping User
M.mappings = require "custom.mappings"

return M
