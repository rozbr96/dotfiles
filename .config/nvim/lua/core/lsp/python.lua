
require('lspconfig').pyright.setup {
  settings = {
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = 'workspace',
      },
    },
  }
}

