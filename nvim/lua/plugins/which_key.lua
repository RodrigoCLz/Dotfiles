return {
  "folke/which-key.nvim",

  event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300 -- Set the timeout length to 300 milliseconds
  end,
  opts = {
    preset = "helix"
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false }) -- Show the which-key popup for local keybindings
      end,
    },
  },
}
