
require('telescope').setup {
  defaults = {},

  pickers = {
    find_files = {
      find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' }
    }
  }
}

