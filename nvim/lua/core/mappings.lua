--Mappings
vim.g.mapleader = " "

vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)

vim.keymap.set("v", "<", "<gv", { desc = "select after tabulation"})
vim.keymap.set("v", ">", ">gv", { desc = "select after untabulation"})
vim.keymap.set("n", "n", "nzzzv", { desc = "Cursor middle in the search"})
vim.keymap.set("n", "N", "Nzzzv", { desc = "Cursor middle in the search"})

--Oil
vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Abrir Oil" })

