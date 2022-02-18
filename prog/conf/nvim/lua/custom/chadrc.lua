local M = {}
-- Install plugins
local userPlugins = require "custom.plugins.plugins" -- path to table

M.plugins = {
   
  status = {
    feline = false,
  },
   
  default_plugin_remove = {
    "norcalli/nvim-colorizer.lua",
    "feline-nvim/feline.nvim",
  },
   
  default_plugin_config_replace = {
    nvim_colorizer = "custom.plugins.configs.colorizer",
    nvim_treesitter = "custom.plugins.configs.treesitter",
  },

  install = userPlugins
}

M.ui = {
--   theme = "", -- default theme
}
 
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event','cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough

return M 
