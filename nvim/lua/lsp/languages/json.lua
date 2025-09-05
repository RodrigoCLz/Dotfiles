local M = {}
function M.jsonls(on_attach_config, capabilities)
  require("lspconfig").jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach_config,
  })
end
return M
