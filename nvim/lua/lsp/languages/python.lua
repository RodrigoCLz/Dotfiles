local M = {}
function M.pyright_config(on_attach_config)
  require("lspconfig").pyright.setup({
    on_attach = on_attach_config,
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
