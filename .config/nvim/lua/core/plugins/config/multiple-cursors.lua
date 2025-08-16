local autopairs = require('core.plugins.config.autopairs')
local cursors = require('multiple-cursors')
local cmp = require('cmp')

cursors.setup {
  custom_key_maps = {
    { { 'n', 'i' }, 'Cc',    function() vim.cmd('normal gcc') end },
    { 'v',          'Cc',    function() vim.cmd('normal gc') end },
    { { 'n', 'i' }, '<C-/>', function() vim.cmd('normal gcc') end },
    { 'v',          '<C-/>', function() vim.cmd('normal gc') end },
  },

  pre_hook = function()
    autopairs.disable()
    cmp.setup({ enabled = false })
  end,

  post_hook = function()
    autopairs.enable()
    cmp.setup({ enabled = true })
  end
}
