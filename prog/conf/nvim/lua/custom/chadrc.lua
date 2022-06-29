local M = {}

M.options = {
  user = function()
    require("custom.settings.options")
  end,
}

M.plugins = {
  remove = {
    -- "feline-nvim/feline.nvim",
  },

-- Install User Plugins
  -- user = require "custom.plugins",
}

M.ui = {

-- Default Theme
--   theme = "",

-- Settings StatusLine
  statusline = {
    separator_style = "block", -- default/round/block/arrow
    config = "%!v:lua.require('custom.settings.statusline').run()",
  }
}

-- Mapping User
M.mappings = require "custom.mappings"

return M
