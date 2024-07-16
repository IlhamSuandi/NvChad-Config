local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_attach = require("nvchad.configs.lspconfig").on_attach

-- Flutter tools setup
require("flutter-tools").setup {
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}
