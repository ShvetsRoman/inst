require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" }) -- enter cmd mode with ";"
map("i", "jk", "<ESC>")                                 -- exit insert mode with "jk"
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")         -- save using Ctrl+s
-- map("n", "gf", "<CR>") -- go to file with "gf"
map("n", "<C-z>", "<nop>")                              -- prevent force-closing with Ctrl+z
map("n", "<C-S-z>", "<nop>")                            -- prevent force-closing with Ctrl+Z
map("i", "C-BS", "<Esc>cvb")                            -- remove a whole word with Ctrl+Backspace
map("v", "y", "ygv<Esc>")                               -- prevent cursor jumping back to where selection started on yank

--Nvimtree Toggle
map("n", "<F1>", "<cmd> NvimTreeToggle <CR>", { desc = "Nvimtree Toggle window" })

-- Insert Line Below
map("n", "<S-CR>", "O<ESC>", { desc = "Insert Insert line below UP" })
map("n", "<CR>", "o<ESC>", { desc = "Insert Insert line below" })

-- Search Replace
map("n", "<F4>", ":%s///gc<LEFT><LEFT><LEFT><LEFT>", { desc = "Search Пошук та заміна" })
map("i", "<F4>", "<ESC>:%s///gc<LEFT><LEFT><LEFT><LEFT>", { desc = "Search Пошук та заміна" })

-- Mason install all
map("n", "<F10>", "<cmd> :MasonInstallAll <CR>", { desc = "Mason install all" })

-- Lazy sync
map("n", "<F11>", "<cmd> :Lazy sync <CR>", { desc = "Lazy sync" })

--   nvchad themes
map("n", "<F12>", "<cmd> :Telescope themes <CR>", { desc = "Themes   nvchad themes" })
