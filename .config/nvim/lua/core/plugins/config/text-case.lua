
require('textcase').setup {}
require('telescope').load_extension('textcase')

vim.api.nvim_set_keymap('n', 'cc', ':TextCaseOpenTelescope<CR>', {})
vim.api.nvim_set_keymap('v', 'cc', ':TextCaseOpenTelescope<CR>', {})

