require("core.mappings")
--require("core.lazy")
--Basic settings
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.termguicolors = true

vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes:1" -- siempre reserva una columna para signos

vim.opt.expandtab = true   -- Convierte tabs a espacios
vim.opt.shiftwidth = 2     -- Número de espacios para auto-indentación
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.colorcolumn = "80"          -- Muestra una columna guía en la columna 80
vim.opt.list = true
