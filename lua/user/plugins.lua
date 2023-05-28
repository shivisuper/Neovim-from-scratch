local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require('lazy').setup({

  'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim
  'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins
  'windwp/nvim-autopairs', -- Autopairs, integrates with both cmp and treesitter
  'numToStr/Comment.nvim', -- Easily comment stuff
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',
  'akinsho/bufferline.nvim',
  'moll/vim-bbye',
  'nvim-lualine/lualine.nvim',
  'akinsho/toggleterm.nvim',
  'ahmedkhalf/project.nvim',
  'lewis6991/impatient.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'goolord/alpha-nvim',
  'antoinemadec/FixCursorHold.nvim', -- This is needed to fix lsp doc highlight
  'folke/which-key.nvim',

  'folke/tokyonight.nvim',

  -- cmp plugins
  'hrsh7th/nvim-cmp', -- The completion plugin
  'hrsh7th/cmp-buffer', -- buffer completions
  'hrsh7th/cmp-path', -- path completions
  'hrsh7th/cmp-cmdline', -- cmdline completions
  'saadparwaiz1/cmp_luasnip', -- snippet completions
  'hrsh7th/cmp-nvim-lsp',

  -- neorg
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    opts = {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.concealer'] = {
          config = {
            icon_preset = 'diamond',
          }
        }, -- Adds pretty icons to your documents
        ['core.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              misc = '~/notes/misc',
              work = '~/notes/work'
            },
            index = 'main.norg',
            default_workspace = 'misc',
          },
        },
      },
    },
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },

  -- snippets
  'L3MON4D3/LuaSnip', --snippet engine
  'rafamadriz/friendly-snippets', -- a bunch of snippets to use

  -- LSP
  'neovim/nvim-lspconfig', -- enable LSP
  'williamboman/mason.nvim', -- the new and improved lsp installer
  'williamboman/mason-lspconfig.nvim', -- plugin for mason.nvim
  'tamago324/nlsp-settings.nvim', -- language server settings defined in json for
  'jose-elias-alvarez/null-ls.nvim', -- for formatters and linters
  'simrat39/rust-tools.nvim', -- To enable more of the features of rust-analyzer, such as inlay hints

  -- Java
  'mfussenegger/nvim-jdtls',

  -- Telescope
  'nvim-telescope/telescope.nvim',

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  'nvim-treesitter/playground',
  'nvim-treesitter/nvim-treesitter-refactor', -- Refactor plugin for tree sitter
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- Git
  'lewis6991/gitsigns.nvim',

  -- Clojure
  'Olical/conjure',


  -- Hop: Vim motion on steroids
  {
    'phaazon/hop.nvim',
    branch = 'v2', --optional but strongly recommended
    config = function ()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
})
