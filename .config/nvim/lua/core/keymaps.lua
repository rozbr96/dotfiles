
vim.g.mapleader = '\\'

bindings_per_mode = {
  ['n'] = {
    -- reload config
    {keys = '<leader>r', command = ':lua ReloadConfig()<CR>'},

    -- saving
    {keys = '<leader>ww', command = ':w<CR>'},
    {keys = '<leader>wa', command = ':wa<CR><ESC>'},
    {keys = '<leader>Ww', command = ':w!<CR>'},
    {keys = '<leader>Wa', command = ':wa!<CR>'},

    -- quiting
    {keys = '<leader>qq', command = ':q<CR>'},
    {keys = '<leader>qa', command = ':qa<CR>'},
    {keys = '<leader>Qq', command = ':q!<CR>'},
    {keys = '<leader>Qa', command = ':qa!<CR>'},

    -- tree
    {keys = '<leader>t', command = ':NvimTreeToggle<CR>'},
    {keys = '<Tab>', command = ':NvimTreeFocus<CR>'},

    -- telescope
    {keys = '<leader>ff', command = ':Telescope find_files<CR>'},
    {keys = '<leader>fh', command = ':Telescope search_history<CR>'},
    {keys = '<leader>fg', command = ':Telescope live_grep<CR>'},
    {keys = '<leader>fs', command = ':Telescope live_grep<CR>'},
    {keys = '<leader>fb', command = ':Telescope buffers<CR>'},

    -- commands
    {keys = '<leader>cc', command = ':Telescope commands<CR>'},
    {keys = '<leader>ch', command = ':Telescope command_history<CR>'},
    {keys = '<leader>cm', command = ':Telescope man_pages<CR>'},

    -- buffers
    {keys = '<leader>v', command = ':split<CR>'},
    {keys = '<leader>h', command = ':vsplit<CR>'},
    {keys = '<leader>#', command = ':#wincmd w<CR>'},

    -- code
    {keys = '<leader>Cp', command = ':Telescope treesitter<CR>'},

    -- git
    {keys = '<leader>gl', command = ':Telescope git_commits<CR>'},
    {keys = '<leader>gs', command = ':Telescope git_status<CR>'},
    {keys = '<leader>gb', command = ':Telescope git_branches<CR>'},
    {keys = '<leader>gf', command = ':Telescope git_bcommits<CR>'},
  },

  ['v'] = {
    {keys = '>', command = '>gv'},
    {keys = '<Tab>', command = '>gv'}
  },
}

for mode, bindings in pairs(bindings_per_mode) do
  for _, value in pairs(bindings) do
    is_numeric = string.find(value.keys, '#')

    if is_numeric then
      for i = 1, 9 do
        keys = string.gsub(value.keys, '#', i)
        cmd = string.gsub(value.command, '#', i)

        vim.api.nvim_set_keymap(mode, keys, cmd, {})
      end
    else
      vim.api.nvim_set_keymap(mode, value.keys, value.command, {})
    end
  end
end

