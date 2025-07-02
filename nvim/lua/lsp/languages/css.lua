local M = {}
function M.cssls(on_attach_config)
  require("lspconfig").cssls.setup({
    on_attach = on_attach_config,
  })
end
return M
