-- imports
local util = require('util')
local assign = util.assign
local augroup, autocmd = util.augroup, util.autocmd
local alias, command = util.alias, util.command

require('packer_init').startup {{
  { 'wbthomason/packer.nvim' },
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },
  { 'nathom/filetype.nvim' },

  -- Git
  { 'tpope/vim-fugitive' },

  -- Training
  { 'ThePrimeagen/vim-be-good', cmd = 'VimBeGood' },

  -- Appearance
  { 'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
  { 'arzg/vim-colors-xcode',
    setup = function()
      require('util').assign(vim.g) {
        xcodedark_dim_punctuation = true,
      }
    end,
    config = function()
      local cmd, opt = vim.cmd, vim.opt

      opt.termguicolors = true
      cmd.colorscheme 'xcodedark'
      cmd.highlight('VertSplit', 'guifg=#ffffff', 'guibg=#393b44', 'gui=NONE', 'cterm=NONE')
    end
  },
  { 'psliwka/vim-smoothie',
    setup = function()
      require('util').assign(vim.g) {
        smoothie_experimental_mappings = false,
        smoothie_update_interval = 25,
        smoothie_speed_constant_factor = 32,
        smoothie_speed_exponentiation_factor = 0.925,
      }
    end
  },

  -- Motion
  { 'tpope/vim-surround' },
  { 'justinmk/vim-sneak' },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update { with_sync = true }
      ts_update()
    end,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'cpp', 'lua', 'rust', 'typescript' },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end
  },

  -- LSP stuff
  { 'williamboman/mason-lspconfig.nvim', requires = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',

      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',

      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require('mason').setup {}
      require('mason-lspconfig').setup {
        automatic_installation = true,
        ensure_installed = {
          'rust_analyzer',
          'sumneko_lua',
          'tsserver',
        },
      }

      local cmp = require('cmp')
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert {
          ['<C-k>'] = cmp.mapping.complete(), -- should have been named show_completions or smth
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-u>'] = cmp.mapping.scroll_docs(4),
          ['<C-g>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },

          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            else fallback() end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            else fallback() end
          end, { 'i', 's' }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      }

      -- border injection
      local option = { border = 'rounded' }

      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, option)
      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, option)

      local lspconfig = require('lspconfig')
      local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('mason-lspconfig').setup_handlers {
        function (server_name)
          lspconfig[server_name].setup {
            capabilities = default_capabilities,
          }
        end,
        rust_analyzer = function()
          lspconfig.rust_analyzer.setup {
            capabilities = default_capabilities,
            root_dir = lspconfig.util.root_pattern('Cargo.lock'),
          }
        end
      }
    end
  },
}}

assign(vim.g) {
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

assign(vim.opt) {
  list = true,
  listchars = 'trail:-',
  mouse = 'a',
  number = true,
  relativenumber = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  scrolloff = 5,
  termguicolors = true,
  completeopt = "menu,menuone,noselect",
}

alias 'W' 'w'
alias 'Q' 'q'
alias 'Wq' 'wq'
alias 'WQ' 'wq'

alias 'Hitest' 'so $VIMRUNTIME/syntax/hitest.vim'

vim.keymap.set({'n', 'v'}, '<Left>', '<C-w>h', { remap = false })
vim.keymap.set({'n', 'v'}, '<Down>', '<C-w>j', { remap = false })
vim.keymap.set({'n', 'v'}, '<Up>', '<C-w>k', { remap = false })
vim.keymap.set({'n', 'v'}, '<Right>', '<C-w>l', { remap = false })

-- Centering
-- vim.keymap.set({'n', 'i'}, '<C-c>', function() set { scrolloff = 999 - vim.opt.scrolloff:get() } end, { remap = false })

-- LSP
vim.keymap.set('n', '<C-k>', vim.lsp.buf.code_action, { remap = false })
vim.keymap.set('n', '<S-k>', vim.lsp.buf.hover, { remap = false })

-- CHADtree
vim.keymap.set('n', '<Space>f', ':CHADopen<CR>', { silent = true, remap = false })

augroup 'PackerAutoCompile' {
  autocmd 'BufWritePost' { pattern = '*/nvim/init.lua', command = 'PackerCompile' }
}
