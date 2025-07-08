local M = {}
function M.pyright_config(on_attach_config, capabilities)
  require("lspconfig").pyright.setup({
    on_attach = on_attach_config,
    capabilities = capabilities,
    settings = {
      {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true
          }
        }
      }
    }
  })
end
return M
