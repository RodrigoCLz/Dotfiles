local M = {}

function M.zk(on_attach_config, capabilities)
  require("lspconfig").zk.setup({
    on_attach = on_attach_config,
    capabilities = capabilities
  })
end

function M.marksman(on_attach_config, capabilities)
  require('lspconfig').marksman.setup({
    on_attach = on_attach_config,
    capabilities = capabilities
  })
end
return M
