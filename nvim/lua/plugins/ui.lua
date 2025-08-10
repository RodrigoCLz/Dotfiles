return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        globalstatus = true,
        disabled_filetypes = {
        }
      },
      sections = {
        lualine_b = {
          {
            "branch"
          },
          {
            "diff",
            symbols = { added = ' ', modified = ' ', removed = ' ' },
          },
          {
            "diagnostics",
            update_in_insert = true
          }
        },
        lualine_x = {
          {
            "filename",
            path = 1,
          }
        },
        lualine_y = {
          {
            "progress"
          },
          {
            "location"
          },
          {
            "filetype"
          }
        },
        lualine_z = {
          {
            "fileformat",
            symbols = {
              unix = "󰣇 "
            }
          },
        }
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            filetype_name = {
              lazy = 'Lazy'
            }
          },
        },
        lualine_y = {
          {
            "searchcount"
          }
        },
        lualine_z = {
          {
            'lsp_status',
            icon = ' ', -- f013
            symbols = {
              -- Standard unicode symbols to cycle through for LSP progress:
              spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
              -- Standard unicode symbol for when LSP is done:
              done = '✓',
              -- Delimiter inserted between LSP names:
              separator = ' ',
            },
            -- List of LSP names to ignore (e.g., `null-ls`):
            ignore_lsp = {},
          }
        }
      },
      winbar = {
        lualine_b = {
          {
            "navic",
            color_correction = 'dynamic',
            navic_opts = nil,
            --color = { bg = 'transparent'}
          }
        },
      }
    }
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
      highlight = true, -- resalta cada parte con su grupo de LSP
      separator = "  ", -- carácter entre niveles
      depth_limit = 7, -- cuántos niveles mostrar como máximo
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' '
      }
    }
  }
}
