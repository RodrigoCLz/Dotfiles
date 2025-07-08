local M = {}
function M.lua_ls_config(on_attach_config, capabilities)
  require("lspconfig").lua_ls.setup({
    on_attach = on_attach_config,
    settings = {
      Lua = {
        telemetry = false
      }
    },
    capabilities = capabilities
  })
end
return M
