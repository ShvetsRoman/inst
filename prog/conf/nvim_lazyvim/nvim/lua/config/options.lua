-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.termguicolors = true -- Убирает ошибку nvim-colorizer
vim.g.ft = "conf" -- Для отображения цвета в *.conf (nvim-colorizer)
vim.g.swapfile = false -- Отключение swapfile
vim.g.scrolloff = 5
vim.g.sidescrolloff = 5
vim.g.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.g.relativenumber = true -- относительная нумерация строк

vim.g.smarttab = true
vim.g.tabstop = 2
vim.g.softtabstop = 2
vim.g.shiftwidth = 2
vim.g.autoindent = true

local opt = vim.opt

opt.wrap = true
