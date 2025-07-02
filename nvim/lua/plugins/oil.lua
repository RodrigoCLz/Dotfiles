return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      --Key mappings for oil.nvim actions
      keymaps = require("plugins.mappings").oil(),
      use_default_keymaps = false, -- Do not use default key mappings
    },
  }
}
