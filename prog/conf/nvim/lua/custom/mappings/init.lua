-- MAPPINGS
local M = {}

M.NvimTree = {
  n = {
    ["<F1>"] = {"<cmd> NvimTreeToggle <CR>", "NvimTreeToggle"}
  },
}

M.UpdateNvCad = {
  n = {
    ["<F2>"] = {"<cmd> :NvChadUpdate <CR>", "Обновление NvChad"}
  },
}

M.Search = {
  n = {
    ["<F3>"] = {"<cmd> Telescope find_files <CR>", "Search Telescope"}
  },
}

M.SearchReplace = {
  n = {
    ["<F4>"] = {":%s///gc<LEFT><LEFT><LEFT><LEFT>", "Поиск и замена"}
  },
  i = {
    ["<F4>"] = {"<ESC>:%s///gc<LEFT><LEFT><LEFT><LEFT>", "Поиск и замена"}
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

M.Terminal = {
  n = {
    ["<C-h>"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    ["<C-v>"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  }
}

M.MoveCurrentLine = {
  n = {
    ["<A-j>"] = {":m .+1<CR>==>", "Перемистить строку вниз"},
    ["<A-k>"] = {":m .-2<CR>==>", "Перемистить строку вверх"}
  },
  i = {
    ["<A-j>"] = {"<Esc>:m .+1<CR>==>gi", "Перемистить строку вниз"},
    ["<A-k>"] = {"<Esc>:m .-2<CR>==>gi", "Перемистить строку вверх"}
  },
}

M.NewFile_NewDir = {
  n = {
    ["<A-d>"] = {":!mkdir -p ", "Новий папка"},
    ["<A-f>"] = {":e ", "Новий файл"}
  },
}

return M
