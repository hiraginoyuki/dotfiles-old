-- imports
util = require('util')
set = util.set
augroup, autocmd = util.augroup, util.autocmd
api, cmd, fn = vim.api, vim.cmd, vim.fn
stdpath = fn.stdpath


require('packer_init').startup {{
  -- Packer itself
  { 'wbthomason/packer.nvim',
    config = function()
      local init_lua = vim.fn.stdpath('config')..'/init.lua'
      augroup 'PackerAutoCompile' {
        autocmd 'BufWritePost' { pattern = init_lua, command = 'PackerCompile' }
      } 
    end
  },

  -- Appearance
  { 'arzg/vim-colors-xcode',
    config = 'vim.cmd [[colorscheme xcodedark]]' },

  -- Motion
  { 'tpope/vim-surround' },
  { 'justinmk/vim-sneak' },

  -- Completion, Highlighting
  -- { 'neoclide/coc.nvim', branch = 'release' },
  { 'nathom/filetype.nvim' },
  { 'leafgarland/typescript-vim' }
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
