local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "windwp/nvim-autopairs" },
  { "lewis6991/gitsigns.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline"
    }
  },
  { "elkowar/yuck.vim" },
  { "gpanders/nvim-parinfer" },
  { "numToStr/Comment.nvim" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "echasnovski/mini.surround" },
  { "johmsalas/text-case.nvim" },
  { "brenton-leighton/multiple-cursors.nvim" },
  { "rozbr96/spec_runner" },
  { "sindrets/diffview.nvim" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "olrtg/emmet-language-server" },
  { "stevearc/conform.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd "colorscheme catppuccin"
    end
  },
  { "kevinhwang91/nvim-bqf",       dependencies = { "junegunn/fzf" } },
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = " "
    }
  },
  { "shortcuts/no-neck-pain.nvim", version = "*" }
})

require("core.plugins.config")
