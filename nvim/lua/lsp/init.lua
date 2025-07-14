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

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local servers = {
        lua = "lua_ls_config",
        python = "pyright_config",
        java = "jdtls",
        bash = "bashls",
        cpp = "clangd",
        html = "html",
        css = "cssls",
        ["t-javascript"] = "ts_ls",
        markdown = "marksman"
      }

      for lang, config_fn in pairs(servers) do
        local ok, lang_module = pcall(require, "lsp.languages." .. lang)
        if ok and lang_module[config_fn] then
          lang_module[config_fn](on_attach_config, capabilities)
        else
          vim.notify("No se pudo cargar: lsp.languages." .. lang, vim.log.levels.WARN)
        end
      end

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
      'windwp/nvim-autopairs',
      'chrisgrieser/cmp-nerdfont',
      'JMarkin/cmp-diag-codes',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-omni'
    },
    event = "VeryLazy",
    main = "lsp.cmp",
    config = true
  },
  {
	  "L3MON4D3/LuaSnip",
	  version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    main = "lsp.luasnip",
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    lazy = true,
    config = true,
  },
}
