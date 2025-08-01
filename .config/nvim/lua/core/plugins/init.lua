
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  use 'windwp/nvim-autopairs'

  use 'lewis6991/gitsigns.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function ()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = {
      {
        'nvim-lua/plenary.nvim'
      }
    }
  }

  use 'neovim/nvim-lspconfig'

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline'
    }
  }

  use 'elkowar/yuck.vim'
  use 'gpanders/nvim-parinfer'

  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'echasnovski/mini.surround'

  use 'johmsalas/text-case.nvim'

  use 'brenton-leighton/multiple-cursors.nvim'

  use 'rozbr96/spec_runner'

  use 'sindrets/diffview.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use 'nvim-treesitter/nvim-treesitter-context'

  use 'emmet-language-server'
end)

require('core.plugins.config')
