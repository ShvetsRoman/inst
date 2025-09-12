-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- enter cmd mode with ";"
map({ "n" }, ";", ":", { desc = "CMD enter command mode" })

-- exit insert mode with "jk"
map( { "i" },"jk","<ESC>" )

-- Insert Line Below
map({ "n" }, "<C-CR>", "O<ESC>", { desc = "Insert Insert line below UP" })
map({ "n"}, "<CR>", "o<ESC>", { desc = "Insert Insert line below" })

-- Nvim-tree
map({ "n" }, "<F1>", "<cmd> :NvimTreeToggle <CR>", { desc = "Nvim-tree" })

-- Search Replace
-- map("n","<F4>",":%s///gc<LEFT><LEFT><LEFT><LEFT>",{ desc = "Search Пошук та заміна" })
map({ "n" }, "<F4>", ":%s///gc<LEFT><LEFT><LEFT><LEFT>", { desc = "Search Пошук та заміна" })
map({ "i" }, "<F4>", "<ESC>:%s///gc<LEFT><LEFT><LEFT><LEFT>", { desc = "Search Пошук та заміна" })

-- Mason install all
map({ "n" }, "<F11>", "<cmd> :Mason <CR>", { desc = "Mason install" })

-- Lazy sync
map({ "n" }, "<F12>", "<cmd> :Lazy sync <CR>", { desc = "Lazy sync" })
