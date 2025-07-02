return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    lazy = false,
      opts = {
        PATH = "prepend",
      },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      require("lsp.mappings").default_keys()
      local on_attach_config = function(_, bufnr)
        vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
        require("lsp.mappings").keys_on_attach()
      end

      require("lsp.languages.lua").lua_ls_config(on_attach_config)
      require("lsp.languages.python").pyright_config(on_attach_config)
      require("lsp.languages.java").jdtls(on_attach_config)
      require("lsp.languages.bash").bashls(on_attach_config)
      require("lsp.languages.cpp").clangd(on_attach_config)
      require("lsp.languages.html").html(on_attach_config)
      require("lsp.languages.css").cssls(on_attach_config)
      require("lsp.languages.t-javascript").ts_ls(on_attach_config)

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = true,
        severity_sort = true,
        underline = true,
        show_code = true
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',--conectar el lsp con el autocompletado
      'hrsh7th/cmp-buffer',--contexto de archivos abiertos
      'hrsh7th/cmp-path',--para los archivo 
      'hrsh7th/cmp-cmdline',--para la linea de comandos
      'petertriho/cmp-git',--para git
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      "onsails/lspkind-nvim",
      'windwp/nvim-autopairs'
    },
    event = "VeryLazy",
    main = "lsp.cmp",
    config = true
  },
  {
	  "L3MON4D3/LuaSnip",
	  version = "v2.*",
    main = "lsp.luasnip",
    config = true
  },
  {
    "windwp/nvim-autopairs",
    lazy = true,
    config = true,
  }
}
