local lsnip = require("luasnip")
local types = require("luasnip.util.types")

local M = {}

function M.setup()
  lsnip.config.set_config {
    history = true,
    updateevents = "TextChanged, TextChangedI",
    -- Autosnippets
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "<- Choice", "Error" } },
        },
      },
    },
  }
  vim.keymap.set({ 'i', 's'}, "<c-k>", function()
    if lsnip.expand_or_jumpable() then
      lsnip.expand_or_jump()
    end
  end, { silent = true})
  vim.keymap.set({ 'i', 's' }, "<c-j>", function()
    if lsnip.jumpable(-1) then
      lsnip.jump(-1)
    end
  end, { silent = true})
  vim.keymap.set( 'i', "<c-l>", function()
    if lsnip.choice_active() then
      lsnip.change_choice(1)
    end
  end)
end
return M
