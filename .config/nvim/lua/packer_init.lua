-- utils
function try_require(target)
  local status, module = pcall(require, target)
  return module, status
end


-- main
local packer, installed = try_require 'packer'
if installed then return packer end

-- print 'Installing packer.nvim...'
local stdpath, exec = vim.fn.stdpath, vim.fn.system
local packer_repo = 'wbthomason/packer.nvim'
local install_path = stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local success = exec { 'git', 'clone', '--depth', '1', 'https://github.com/'..packer_repo, install_path }
vim.cmd [[packadd packer.nvim]]
local packer, success = try_require 'packer'

if success then 
  -- print 'Successfully installed packer.nvim!'

  local startup = packer.startup
  packer.startup = function(fn)
    startup(fn)
    packer.sync()
  end

  return packer
else
  print 'Failed to install packer.nvim :('
end
