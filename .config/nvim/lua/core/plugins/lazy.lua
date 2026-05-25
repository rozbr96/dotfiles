local M = {}

local function ensure_lazy()
  local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

  ---@diagnostic disable-next-line: undefined-field
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
    })
  end

  vim.opt.rtp:prepend(lazypath)
end

function M.setup()
  ensure_lazy()
  require('lazy').setup(require('core.plugins.specs'))
  require('core.plugins.config')
end

return M
