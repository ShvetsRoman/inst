-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig

local M = {}

M.ui = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },

  statusline = {
    separator_style = "block",  -- default/round/block/arrow
  },

  nvdash = {
    load_on_startup = true,

    header = {
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    },

    buttons = {
      { "  Find File", "leader ff", "Telescope find_files" },
      { "󰈚  Recent Files", "leader fo", "Telescope oldfiles" },
      { "󰈭  Find Word", "leader fw", "Telescope live_grep" },
      { "  Bookmarks", "leader ma", "Telescope marks" },
      { "  Themes", "leader th", "Telescope themes" },
      { "  Mappings", "leader ch", "NvCheatsheet" },
    },
  },

}

return M
