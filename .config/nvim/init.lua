-- imports
local util = require('util')
local set, g = util.assign(vim.opt), util.assign(vim.g)
local augroup, autocmd, command = util.augroup, util.autocmd, util.command

local cmd = vim.cmd
local stdpath = vim.fn.stdpath

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
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim", after = 'mason.nvim' },
  { "neovim/nvim-lspconfig", after = 'mason-lspconfig.nvim',
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup {
        automatic_installation = true,
        ensure_installed = {
          'rust_analyzer',
          'sumneko_lua',
          'tsserver',
        }
      }
      require('lspconfig').rust_analyzer.setup {}
      require('lspconfig').sumneko_lua.setup {}
      require('lspconfig').tsserver.setup {}
    end },
}}

g {
  loaded_2html_plugin = 1,
  loaded_gzip = 1,
  loaded_man = 1,
  loaded_netrwPlugin = 1,
  loaded_remote_plugins = 1,
  loaded_spellfile_plugin = 1,
  loaded_tarPlugin = 1,
  loaded_tutor_mode_plugin = 1,
  loaded_zipPlugin = 1,
}

set {
  mouse = 'a',
  number = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  scrolloff = 2,
  termguicolors = true,
}

command 'W' 'w'
command 'Q' 'q'
command 'Wq' 'wq'
command 'WQ' 'wq'

augroup 'PackerAutoCompile' {
  autocmd 'BufWritePost' { pattern = '*/nvim/init.lua', command = 'PackerCompile' }
}
