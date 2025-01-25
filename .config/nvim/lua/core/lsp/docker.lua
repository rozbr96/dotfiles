
require('lspconfig').dockerls.setup {
  cmd = { 'npx', 'docker-langserver', '--stdio' }
}

