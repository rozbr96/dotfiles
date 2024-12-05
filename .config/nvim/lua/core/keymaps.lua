
vim.g.mapleader = '\\'

bindings_per_mode = {
  ['n'] = {
    {keys = '<leader>r', command = ':lua ReloadConfig()<CR>'},
    {keys = '<leader>w', command = ':w<CR>'},
    {keys = '<leader>ww', command = ':w!<CR>'},
    {keys = '<leader>W', command = ':w!<CR>'},
    {keys = '<leader>q', command = ':q<CR>'},
    {keys = '<leader>qq', command = ':q!<CR>'},
    {keys = '<leader>Q', command = ':q!<CR>'},
    {keys = '<leader>qa', command = ':qa<CR>'},
    {keys = '<leader>qqa', command = ':qa!<CR>'},
    {keys = '<leader>Qa', command = ':qa!<CR>'},
    {keys = '<leader>t', command = ':NvimTreeToggle<CR>'},
    {keys = '<Tab>', command = ':NvimTreeFocus<CR>'},
  },

  ['v'] = {
    {keys = '>', command = '>gv'},
    {keys = '<Tab>', command = '>gv'}
  },
}

for mode, bindings in pairs(bindings_per_mode) do
  for _, value in pairs(bindings) do
    vim.api.nvim_set_keymap(mode, value.keys, value.command, {})
  end
end

