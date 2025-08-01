
require('lspconfig').emmet_language_server.setup {
  cmd = { 'npx', 'emmet-language-server', '--stdio' },
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "vue" }
}

