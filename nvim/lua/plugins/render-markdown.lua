return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",         -- o "nvim-tree/nvim-web-devicons"
    },
    ft = { "markdown", "quarto", "org" }, -- activar solo en estos ft
    opts = {
      enabled = true,
      render_modes = { "i","n", "c", "t" },
      max_file_size = 10.0,
      debounce = 100,
      preset = "none",
    },
  }
}
