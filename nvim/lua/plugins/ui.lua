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
        lualine_c = {
        },
        lualine_x = {
        },
        lualine_y = {
          {
            "progress"
          },
          {
            "location"
          },
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
        lualine_x = {
          {
            "filename",
            path = 4,
          }
        },
        lualine_y = {
          {
            "searchcount"
          },
          {
            "filetype"
          }
        },
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
        lualine_y = {
          {
            'lsp_status',
            icon = ' ', -- f013
            symbols = {
              -- Standard unicode symbols to cycle through for LSP progress:
              spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
              -- Standard unicode symbol for when LSP is done:
              done = '✓',
              -- Delimiter inserted between LSP names:
              separator = '|',
            },
            -- List of LSP names to ignore (e.g., `null-ls`):
            ignore_lsp = {},
          }
        }
      }
    }
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function ()
      require('colorizer').setup({
        user_default_options = {
          names = false,
          RRGGBBAA = true,
          rgb_fn = true,
          xtem = true
        }
      })
    end
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
      depth_limit = 6, -- cuántos niveles mostrar como máximo
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
