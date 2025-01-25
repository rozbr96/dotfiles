
require('lspconfig').pyright.setup {
  cmd = { 'poetry', '-C', '..', 'run', 'pyright-langserver', '--stdio' },
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

