
require'lualine'.setup {
  options = {
    theme = 'material'
  },
  tabline = {
    lualine_a = { 'filename' },
    lualine_y = { 'tabs' },
    lualine_z = { 'datetime' },
  }
}
