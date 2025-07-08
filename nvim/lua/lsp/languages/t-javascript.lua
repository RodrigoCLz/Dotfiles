local M = {}
function M.ts_ls(on_attach_config, capabilities)
  require("lspconfig").ts_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach_config,
  })
end
return M
