function try_require(target)
  local status, module = pcall(require, target)
  return module, status
end

local jetpack, installed = try_require('jetpack')

if not installed then
  local exec = vim.fn.system
  local jetpack_path = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
  local jetpack_url = 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'

  -- exec { 'curl', '-fsSL', '--create-dirs', jetpack_url, '-o', jetpack_path }
  print(exec { 'mkdir', '-p', '/Users/yuki/.local/share/nvim/site/pack/jetpack/opt/vim-jetpack/plugin' })
  print(exec { 'cp', '/Users/yuki/jetpack.vim', jetpack_path })
end

vim.cmd.packadd 'vim-jetpack'
jetpack = require('jetpack')

return function(options)
  require('jetpack.paq')(options)

  if installed then return end

  for _, name in ipairs(jetpack.names()) do
    if not jetpack.tap(name) then
      jetpack.sync()
      break
    end
  end
end
