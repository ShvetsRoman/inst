local opt = vim.opt

opt.termguicolors = true      -- Убирает ошибку nvim-colorizer
opt.ft = "conf"       -- Для отображения цвета в *.conf (nvim-colorizer)
opt.swapfile = false        -- Отключение swapfile
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.langmap =  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,Ж;:"
opt.relativenumber = true
