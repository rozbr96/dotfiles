
require('lspconfig').volar.setup {
  cmd = { "vue-language-server", "--stdio" },
  on_new_config = function (new_config, new_root_dir)
    local lib_path = vim.fs.find('node_modules/typescript/lib', { path = new_root_dir, upward = true})[1]

    if lib_path then
      new_config.init_options.typescript.tsdk = lib_path
    end
  end
}

