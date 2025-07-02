local M = {}
function M.ts_ls(on_attach_config)
  require("lspconfig").ts_ls.setup({
    on_attach = on_attach_config,
  })
end
return M
