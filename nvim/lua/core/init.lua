require("core.mappings")
--require("core.lazy")
--Basic settings
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.conceallevel = 2
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes:1" -- siempre reserva una columna para signos
vim.o.foldenable = false
vim.o.foldlevelstart = 99
vim.o.foldlevel = 99
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
vim.opt.colorcolumn = "80"          -- Muestra una columna guía en la columna 8

vim.opt.list = true


-- Ir al siguiente tab
vim.keymap.set("n", "<C-Tab>", ":tabnext<CR>", { noremap = true, silent = true })
-- Ir al tab anterior
vim.keymap.set("n", "<C-S-Tab>", ":tabprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true          -- habilita corrección ortográfica
    vim.opt_local.spelllang = "es,en"   -- idiomas que usarás
  end,
})
