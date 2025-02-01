
require('lspconfig').ts_ls.setup {
  cmd = { 'npx', 'typescript-language-server', '--stdio' },
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = 'it seems location can be anything, so what about it being your heart, baby?',
        languages = { 'javascript', 'typescript', 'vue' }
      }
    }
  },
  filetypes = { 'javascript', 'javascript.jsx', 'typescript', 'typescript.tsx', 'vue' }
}

