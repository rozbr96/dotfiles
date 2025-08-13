require 'lualine'.setup {
  options = {
    theme = 'nightfly'
  },
  tabline = {
    lualine_a = { 'vim.fn.expand("%:.")' },
    lualine_b = { 'lsp_status' },
    lualine_y = { 'tabs' },
    lualine_z = { 'datetime' },
  },
  inactive_sections = {
    lualine_x = { 'location', 'winnr' }
  }
}
