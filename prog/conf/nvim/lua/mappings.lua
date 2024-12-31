require "nvchad.mappings"

local map = vim.keymap.set

-- enter cmd mode with ";"
map("n",";",":",{ desc = "CMD enter command mode" })

-- exit insert mode with "jk"
map("i","jk","<ESC>")

-- save using Ctrl+s
map({ "n","i","v" },"<C-s>","<cmd> :w <CR>")

-- Insert Line Below
--map("n","<C-CR>","O<ESC>",{ desc = "Insert Insert line below UP" })
map("n","<CR>","o<ESC>",{ desc = "Insert Insert line below" })

-- Nvim-tree
map("n","<F1>","<cmd> :NvimTreeToggle <CR>",{ desc = "Nvim-tree" })

-- Search Replace
map("n","<F4>",":%s///gc<LEFT><LEFT><LEFT><LEFT>",{ desc = "Search Пошук та заміна" })
map("i","<F4>","<ESC>:%s///gc<LEFT><LEFT><LEFT><LEFT>",{ desc = "Search Пошук та заміна" })

map("n","<F8>","<cmd> :NvCheatsheet <CR>",{ desc = "Mappings" })
map("n","<laeder> + <F8>","<cmd> :Telescope keymaps <CR>",{ desc = "Mappings" })

map("n", "<F9>", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })


-- Mason install all
map("n","<F11>","<cmd> :MasonInstallAll <CR>",{ desc = "Mason install all" })

-- Lazy sync
map("n","<F12>","<cmd> :Lazy sync <CR>",{ desc = "Lazy sync" })
