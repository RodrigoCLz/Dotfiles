return {
  {
    "tpope/vim-fugitive",
    cmd = {"G", "Git"},
    keys = require("plugins.mappings").vim_fugitive(), 
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      numhl = true,
      max_file_length = 10000,
    }, 
  },
}
