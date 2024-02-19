local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {


  -- Appearance
  { "catppuccin/nvim",       name = "catppuccin", priority = 1000 },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
	{
		"willothy/nvim-cokeline",
		dependencies ={
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'stevearc/resession.nvim',
		},
		config = true,
	},
	  -- LSP
  { 'neovim/nvim-lspconfig' },
  { 'nvimtools/none-ls.nvim' },


  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

	{'nvimdev/epo.nvim'},

  -- LSP(completion)
  {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',
		'micangl/cmp-vimtex',
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" }
  },

  -- Keymaps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    {
      'mrjones2014/legendary.nvim',
      -- since legendary.nvim handles all your keymaps/commands,
      -- its recommended to load legendary.nvim before other plugins
      priority = 10000,
      lazy = false,
      -- sqlite is only needed if you want to use frecency sorting
      dependencies = { 'kkharji/sqlite.lua' }
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  -- DAP
  {
    "rcarriga/nvim-dap-ui",
    dependencies =
    {
      "mfussenegger/nvim-dap"
    },
  },

  -- Mason
  {
    "williamboman/mason.nvim",
  },

  -- DEV lua
  { "folke/neodev.nvim",       opts = {} },

  -- File Tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  {
    "m4xshen/autoclose.nvim",
  },


  -- Git
  {
    "lewis6991/gitsigns.nvim"
  },

  {
    "tanvirtin/vgit.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },
  -- Fuzzy Finder
  {
    'ibhagwan/fzf-lua',
  },

  {
    'nvim-telescope/telescope.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },
  {
    'nvim-telescope/telescope-dap.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap',
    }
  },

  -- Misc
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  {
    '2kabhishek/termim.nvim',
    cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' }
  },
  -- Language specific
  -- Rust
  { 'saecki/crates.nvim', },


  -- Latex
  {
    'lervag/vimtex'
  },


}

require "lazy".setup(plugins)
require "core"
require "extra"
require "plugins"
