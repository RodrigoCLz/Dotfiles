local M = {}
function M.jdtls(on_attach_config)
  require("lspconfig").jdtls.setup({
    on_attach = on_attach_config,
  })
end
return M
