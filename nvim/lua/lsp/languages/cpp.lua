local M = {}
function M.clangd(on_attach_config)
  require("lspconfig").clangd.setup({
    on_attach = on_attach_config,
  })
end
return M
