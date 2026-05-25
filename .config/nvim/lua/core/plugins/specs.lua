return {
  { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'windwp/nvim-autopairs' },
  { 'lewis6991/gitsigns.nvim' },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  },
  { 'ibhagwan/fzf-lua' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
  },
  { 'elkowar/yuck.vim' },
  { 'gpanders/nvim-parinfer' },
  { 'numToStr/Comment.nvim' },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  { 'echasnovski/mini.surround' },
  { 'johmsalas/text-case.nvim',                   dependencies = { 'ibhagwan/fzf-lua' } },
  { 'brenton-leighton/multiple-cursors.nvim',     dependencies = { 'windwp/nvim-autopairs', 'hrsh7th/nvim-cmp' } },
  { 'rozbr96/spec_runner' },
  { 'sindrets/diffview.nvim' },
  { 'nvim-lualine/lualine.nvim',                  dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'nvim-treesitter/nvim-treesitter-context' },
  { 'olrtg/emmet-language-server' },
  { 'stevearc/conform.nvim' },
  { 'catppuccin/nvim',                            name = 'catppuccin',                                           priority = 1000 },
  { 'kevinhwang91/nvim-bqf',                      dependencies = { 'junegunn/fzf' } },
  { 'mistweaverco/kulala.nvim' },
  { 'shortcuts/no-neck-pain.nvim',                version = '*' },
  { 'folke/which-key.nvim' },
  { 'folke/noice.nvim',                           dependencies = { 'MunifTanjim/nui.nvim' } },
  { 'hat0uma/csvview.nvim' },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  },
}
