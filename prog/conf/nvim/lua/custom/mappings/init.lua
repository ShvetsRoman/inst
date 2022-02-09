-- MAPPINGS
local map = require("core.utils").map

map("n", "<CR>", "o <ESC>")

map("n", "<F1>", ":NvimTreeToggle <CR>")

map("n", "<F3>", ":Telescope find_files <CR>")
 
map("n", "<F4>", ":%s ///<LEFT><LEFT>")
map("i", "<F4>", "<ESC>:%s ///<LEFT><LEFT>")

map("n", "<F10>", ":PackerSync <CR>")
 
map("n", "<F12>", ":Telescope themes <CR>")

