-- MAPPINGS
local M = {}

M.NvimTree = {
  n = {
    ["<F1>"] = {":NvimTreeToggle <CR>", "NvimTreeToggle"}
  },
}

M.Search = {
  n = {
    ["<F3>"] = {":Telescope find_files <CR>", "Search Telescope"}
  },
}

M.SearchReplace = {
  n = {
    ["<F4>"] = {":%s ///<LEFT><LEFT>", "Search with replacement"}
  },
  i = {
    ["<F4>"] = {"<ESC>:%s ///<LEFT><LEFT>", "Search with replacement"}
  }
}

M.InsertLineBelow= {
  n = {
    ["<CR>"] = {"o<ESC>", "Insert line below"}
  },
}

return M
