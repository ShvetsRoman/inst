require "nvchad.options"


-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local o = vim.o

o.termguicolors = true -- Убирает ошибку nvim-colorizer
o.ft = "conf" -- Для отображения цвета в *.conf (nvim-colorizer)
o.swapfile = false -- Отключение swapfile
o.scrolloff = 5
o.sidescrolloff = 5
-- o.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
o.relativenumber = true -- относительная нумерация строк

o.smarttab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true

