local M = {}
function M.cssls(on_attach_config, capabilities)
  require("lspconfig").cssls.setup({
    on_attach = on_attach_config,
    capabilities = capabilities
  })
end
return M
