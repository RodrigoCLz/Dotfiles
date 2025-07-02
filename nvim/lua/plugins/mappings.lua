local M = {}

function M.telescope()
  local builtin = require("telescope.builtin")
  return {
    { "<leader>ff", builtin.find_files, desc = "Telescope find files" },
    { "<leader>fg", builtin.live_grep,  desc = "Telescope live grep" },
    { "<leader>fb", builtin.buffers,    desc = "Telescope buffers" },
    { "<leader>fh", builtin.help_tags,  desc = "Telescope help tags" },
  }
end

-- Keymaps para git 
function M.vim_fugitive()
  return {
    { "<leader>gs", ":Git status", desc = "Git status"},
    { "<leader>gd", ":Git diff", desc= "Git diff"},
  }
end

-- Keymaps para treesitter
function M.tree_sitter()
  return {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@conditional.outer",
    ["ic"] = "@conditional.inner",
    ["al"] = "@loop.outer",
    ["il"] = "@loop.inner"
  }
end
function M.oil()
  return {
    ["g?"] = "actions.show_help", -- Show help
    ["<CR>"] = "actions.select", -- Select entry
    ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" }, -- Open entry in vertical split
    ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" }, -- Open entry in horizontal split
    ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" }, -- Open entry in new tab
    ["<C-p>"] = "actions.preview", -- Preview entry
    ["<C-c>"] = "actions.close", -- Close oil.nvim
    ["<C-l>"] = "actions.refresh", -- Refresh oil.nvim
    ["-"] = "actions.parent", -- Go to parent directory
    ["_"] = "actions.open_cwd", -- Open current working directory
    ["`"] = "actions.cd", -- Change directory
    ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" }, -- Change directory for the current tab
    ["gs"] = "actions.change_sort", -- Change sorting method
    ["gx"] = "actions.open_external", -- Open entry with external application
    ["g."] = "actions.toggle_hidden", -- Toggle hidden files
    ["g\\"] = "actions.toggle_trash", -- Toggle trash
  }
end
return M
