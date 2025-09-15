local M = {}
function M.qmlls(on_attach_config, capabilities)
  require("lspconfig").qmlls.setup({
    capabilities = capabilities,
    on_attach = on_attach_config,
  })
end
return M

