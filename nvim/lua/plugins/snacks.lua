return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dim          = { enabled = false },
    bigfile      = { enabled = true },
    dashboard    = { enabled = true },
    explorer     = { enabled = true },
    indent       = { enabled = true },
    input        = { enabled = false },
    picker       = { enabled = true , sources = { explorer = { layout = { layout = { position = "right"}}}}},
    notifier     = { enabled = false },
    quickfile    = { enabled = true },
    scroll       = { enabled = true },
    term = { enabled = false },
    statuscolumn = { enabled = true },
    words        = { enabled = true },
    scratch      = {
      win_by_ft = {
        python = {
          keys = {
            ["run"] = {
              "<cr>",
              function(self)
                local name = "scratch.python"
                Snacks.debug.run({ buf = self.buf, name = name, cmd = { "python3", vim.api.nvim_buf_get_name(self.buf) } })
              end,
              desc = "Run Python scratch",
              mode = { "n", "x" },
            },
          },
        },
        sh = {
          keys = {
            ["run"] = {
              "<cr>",
              function(self)
                local file = vim.api.nvim_buf_get_name(self.buf)
                local name = "scratch.sh"
                Snacks.debug.run({
                  buf = self.buf,
                  name = name,
                  cmd = { "bash", file },
                })
              end,
              desc = "Run Bash scratch",
              mode = { "n", "x" },
            },
          },
        },
      },
    },
  },
  keys = require("plugins.mappings").snacks_picker()
}
