
local cursors = require('multiple-cursors')

cursors.setup {
  custom_key_maps = {
    {'n', '<Leader>a', function() cursors.align() end},
    {{'n', 'i'}, 'Cc', function() vim.cmd('normal gcc') end},
    {'v', 'Cc', function() vim.cmd('normal gc') end},
    {{'n', 'i'}, '<C-/>', function() vim.cmd('normal gcc') end},
    {'v', '<C-/>', function() vim.cmd('normal gc') end},
  },

  pre_hook = function()
    require('nvim-autopairs').disable()
    require('cmp').setup({ enabled = false })
  end,

  post_hook = function()
    require('nvim-autopairs').enable()
    require('cmp').setup({ enabled = true })
  end
}
