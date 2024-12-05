
function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^core') or name:match('^lsp') or name:match('^ui') or name:match('^git') then
      package.loaded[name] = nil
    end
  end
  dofile(vim.fn.stdpath('config') .. '/init.lua')
end

