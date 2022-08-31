vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_man = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1

util = require('util')
set = util.set
augroup, autocmd = util.augroup, util.autocmd
cmd = vim.cmd
stdpath = vim.fn.stdpath
init_lua = stdpath('config')..'/init.lua'

require('packer_init').startup {{
  { 'wbthomason/packer.nvim' },
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },
  { 'nathom/filetype.nvim' },

  -- Appearance
  { 'arzg/vim-colors-xcode',
    config = 'vim.cmd [[colorscheme xcodedark]]' },

  -- Motion
  { 'tpope/vim-surround' },
  { 'justinmk/vim-sneak' },

  { 'leafgarland/typescript-vim', ft = { 'js', 'jsx', 'ts', 'tsx' } },
  { 'williamboman/mason.nvim' },
}}

set {
  mouse = 'a',
  number = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  scrolloff = 2,
  termguicolors = true,
}

cmd [[command W w]]
cmd [[command Wq wq]]

augroup 'PackerAutoCompile' {
  autocmd 'BufWritePost' { pattern = init_lua, command = 'PackerCompile' }
} 
