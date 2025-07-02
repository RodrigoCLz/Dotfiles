local M = {}
function M.html(on_attach_config)
  require("lspconfig").clangd.setup({
    on_attach = on_attach_config,
  })
end
return M
