--Mappings
vim.g.mapleader = " "

vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)

vim.keymap.set("v", "<", "<gv", { desc = "select after tabulation" })
vim.keymap.set("v", ">", ">gv", { desc = "select after untabulation" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Cursor middle in the search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Cursor middle in the search" })

--Oil
vim.keymap.set("n", "<leader><Space>", "<cmd>Oil<CR>", { desc = "Abrir Oil" })

--Terminal
vim.api.nvim_set_keymap('t', '<C-Space>', [[<C-\><C-n><C-w>k]], { noremap = true })


vim.keymap.set('n', '<leader>t', function ()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_get_option_value('buftype', { buf = buf}) == 'terminal' then
      vim.api.nvim_set_current_win(win)
      vim.cmd('startinsert')
      return
    end
  end
  vim.cmd('ToggleTerm size=15 direction=horizontal')
end, {desc = 'Toggle horizontal Term'})

-- run and build

vim.keymap.set('n','<leader>r', function ()
  local ft = vim.bo.filetype
  local file = vim.fn.exepath('%')
  local fname_noext = vim.fn.expand('%:t:r')

  if ft == 'java' then 
    local cmd = string.format(
      [[
DIR="/tmp/%s_$(date +%%Y%%m%%d_%%H%%M%%S)";
mkdir -p "$DIR";
javac --enable-preview --release 24 "%s" -d "$DIR" &&
cd "$DIR" &&
java --enable-preview -XX:+ShowCodeDetailsInExceptionMessages %s
        ]], fname_noext, file, fname_noext)
  elseif ft == "python" then
    vim.cmd("2TermExec cmd='git status'")
  end

end)
