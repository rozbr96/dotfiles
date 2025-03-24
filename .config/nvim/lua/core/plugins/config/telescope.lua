
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-S-q>'] = actions.send_selected_to_qflist + actions.open_qflist
      }
    }
  },

  pickers = {
    find_files = {
      find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' }
    }
  }
}
