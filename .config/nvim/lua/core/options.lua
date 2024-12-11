
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.wo.wrap = false

vim.filetype.add {
  pattern = {
    ['.*compose.*.ya?ml'] = 'docker-compose',
    ['.*/hypr/.*conf'] = 'hyprlang',
  }
}

