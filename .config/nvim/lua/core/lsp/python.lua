
require('lspconfig').pyright.setup {
  cmd = { 'pyright-langserver', '--stdio' },
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

