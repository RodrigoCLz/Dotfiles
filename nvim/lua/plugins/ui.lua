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
            symbols = {added = ' ', modified = ' ', removed = ' '},
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
      }
    }
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
    },
  }
}

