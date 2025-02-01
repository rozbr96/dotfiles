
require('lspconfig').pyright.setup {
  cmd = { 'poetry', 'run', 'pyright-langserver', '--stdio' },
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

