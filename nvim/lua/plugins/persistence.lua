return {
  "folke/persistence.nvim",
  lazy = false,
  config = function()
    require("persistence").setup({})
    -- Opcional: autocarga automática si abres Neovim sin archivos
    if vim.fn.argc() == 0 then
      require("persistence").load()
    end
  end,
}
