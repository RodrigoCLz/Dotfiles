local M = {}
function M.bashls(on_attach_config, capabilities)
  require("lspconfig").bashls.setup({
    on_attach = on_attach_config,
    capabilities = capabilities
  })
end
return M
