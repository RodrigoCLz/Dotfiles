---@diagnostic disable: missing-fields
local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')
local compare = require('cmp.config.compare')
local M = {}

function M.setup()
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    completion = {
      completeopt = 'menu,menuone,noinsert',
      keyword_length = 2
    },
    mapping = require("lsp.mappings").cmp_keys(cmp, luasnip),
    sources = {
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "luasnip" },
      { name = "buffer"},
      { name = 'nerdfont'},
      { name = 'diag-codes'},
      { name = 'nvim_lsp_signature_help' },
      { name = 'treesitter' }
    },
    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[ ]",
          nvim_lua = "[api]",
          path = "[path]",
          luasnip = "[snip]",
        },
      },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        compare.kind,
        compare.sort_text,
      }
    }
  })
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done{ map_char = { text = ""}} )
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
      {
        { name = 'cmp_git' }
      },
      {
        {name = 'buffer' }
      })
  })

  cmp.setup.cmdline({ '/' },{
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(' : ', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {
        { name = 'path' }
      },
      {
        { name = 'cmdline'}
      })
  })
end

return M
