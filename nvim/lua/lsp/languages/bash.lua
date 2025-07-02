local M = {}
function M.bashls(on_attach_config)
  require("lspconfig").bashls.setup({
    on_attach = on_attach_config,
  })
end
return M
