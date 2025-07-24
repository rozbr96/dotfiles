
require'lualine'.setup {
  options = {
    theme = 'nightfly'
  },
  tabline = {
    lualine_a = { 'filename' },
    lualine_b = { 'lsp_status' },
    lualine_y = { 'tabs' },
    lualine_z = { 'datetime' },
  }
}
