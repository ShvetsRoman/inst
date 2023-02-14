-- MAPPINGS
local M = {}

M.NvimTree = {
  n = {
    ["<F1>"] = {"<cmd> NvimTreeToggle <CR>", "NvimTreeToggle"}
  },
}

M.Search = {
  n = {
    ["<F3>"] = {"<cmd> Telescope find_files <CR>", "Search Telescope"}
  },
}

M.SearchReplace = {
  n = {
    ["<F4>"] = {":%s ///g<LEFT><LEFT><LEFT>", "Search with replacement"}
  },
  i = {
    ["<F4>"] = {"<ESC>:%s ///g<LEFT><LEFT><LEFT>", "Search with replacement"}
  },
}

M.Sync = {
  n = {
    ["<F10>"] = {"<cmd> PackerSync <CR>", "Packer Sync"}
  },
}

M.Themes = {
  n = {
    ["<F12>"] = {"<cmd> Telescope themes <CR>", "   nvchad themes"}
  },
}

M.InsertLineBelow= {
  n = {
    ["<C-O>"] = {"O<ESC>", "Insert line below UP"},
    ["<CR>"] = {"o<ESC>", "Insert line below"}
  },
}

M.UndoAction= {
  n = {
    ["<A-z>"] = {"u", "Undo action"}
  },
  i = {
    ["<A-z>"] = {"<ESC>u", "Undo action"}
  },
}

return M
