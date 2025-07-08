local M = {}
function M.clangd(on_attach_config, capabilities)
  require("lspconfig").clangd.setup({
    on_attach = on_attach_config,
    capabilities = capabilities
  })
end
return M
