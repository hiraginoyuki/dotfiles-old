-- imports
local util = require('util')
local set, g = util.assign(vim.opt), util.assign(vim.g)
local in_order = util.in_order
local augroup, autocmd = util.augroup, util.autocmd
local alias, command = util.alias, util.command

require('packer_init').startup {{
  { 'wbthomason/packer.nvim' },
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },
  { 'nathom/filetype.nvim' },

  -- UI
  { 'ms-jpq/chadtree' },

  -- Appearance
  { 'arzg/vim-colors-xcode',
    config = 'vim.cmd [[colorscheme xcodedark]]' },

  -- Motion
  { 'tpope/vim-surround' },
  { 'justinmk/vim-sneak' },

  -- LSP stuff
  in_order {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'ms-jpq/coq.artifacts',
    'ms-jpq/coq_nvim',
  } {
    config = function()
      local servers = {
        'rust_analyzer',
        'sumneko_lua',
        'tsserver',
      }

      require('mason').setup()
      require('mason-lspconfig').setup {
        automatic_installation = true,
        ensure_installed = servers
      }

      local lsp = require('lspconfig')
      local coq = require('coq')
      for _, server in ipairs(servers) do
        lsp[server].setup(coq.lsp_ensure_capabilities {})
      end
    end
  },
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
  relativenumber = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  scrolloff = 2,
  termguicolors = true,
  completeopt = "menu,menuone,noselect",
}

alias 'W' 'w'
alias 'Q' 'q'
alias 'Wq' 'wq'
alias 'WQ' 'wq'

vim.keymap.set('n', '<Left>', '<C-w>h', { remap = false })
vim.keymap.set('n', '<Down>', '<C-w>j', { remap = false })
vim.keymap.set('n', '<Up>', '<C-w>k', { remap = false })
vim.keymap.set('n', '<Right>', '<C-w>l', { remap = false })

-- Centering
vim.keymap.set({'n', 'i'}, '<C-c>', function() set { scrolloff = 999 - vim.opt.scrolloff:get() } end, { remap = false })

-- LSP
vim.keymap.set('n', '<C-k>', vim.lsp.buf.code_action, { remap = false })
vim.keymap.set('n', '<S-k>', vim.lsp.buf.hover, { remap = false })

-- CHADtree
vim.keymap.set('n', '<Space>f', ':CHADopen<CR>', { silent = true, remap = false })

augroup 'PackerAutoCompile' {
  autocmd 'BufWritePost' { pattern = '*/nvim/init.lua', command = 'PackerCompile' }
}
