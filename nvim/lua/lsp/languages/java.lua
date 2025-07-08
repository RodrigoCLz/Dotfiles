local M = {}
function M.jdtls(on_attach_config, capabilities)
  require("lspconfig").jdtls.setup({
    on_attach = on_attach_config,
    capabilities = capabilities
  })
end
return M
