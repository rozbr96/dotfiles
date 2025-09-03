local lsp_dir = vim.fn.stdpath('config') .. '/lua/core/lsp'

for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
  local server = file:gsub('%.lua$', '')

  if server ~= 'init' then
    local ok, config = pcall(require, 'core.lsp.' .. server)

    if ok then
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    else
      vim.notify('Failed to load LSP config for ' .. server .. ': ' .. config, vim.log.levels.ERROR)
    end
  end
end
