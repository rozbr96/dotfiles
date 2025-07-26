
require('lspconfig').docker_compose_language_service.setup {
  filetypes = { 'docker-compose' },
  cmd = { 'docker-compose-langserver', '--stdio' }
}

