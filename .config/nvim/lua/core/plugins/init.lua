
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter'
  }

  use 'lewis6991/gitsigns.nvim'

  use 'nvim-treesitter/nvim-treesitter'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = {
      {
        'nvim-lua/plenary.nvim'
      }
    }
  }
end)

require('core.plugins.config')

