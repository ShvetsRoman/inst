-- This is an example chadrc file , its supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "monokai",
   transparency = false,
}

-- Install plugins
--local userPlugins = require "custom.user.plugins" -- path to table
local userPlugins = require "custom.plugins" -- path to table

M.plugins = {
   install = userPlugins,
}

-- Nvim-colorizer 
-- local colorizerConf = require "custom.configs.nvim-colorizer"
--  
-- M.plugins = {
--   status = {
--     colorizer = true,
--   },
--   default_config = {
--     nvim_colorizer = colorizerConf.colorizer,
--    },
-- }

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event','cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough

return M
