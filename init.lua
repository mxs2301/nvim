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
		'nanozuki/tabby.nvim',
		event = 'VimEnter',
		dependencies = 'nvim-tree/nvim-web-devicons',

	},
	-- LSP
	{ 'neovim/nvim-lspconfig' },
	{ 'nvimtools/none-ls.nvim' },


	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- LSP(completion)
	{
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'saadparwaiz1/cmp_luasnip',
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

	{
		"tris203/hawtkeys.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = {
			-- an empty table will work for default config
			--- if you use functions, or whichkey, or lazy to map keys
			--- then please see the API below for options
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
		tag = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
	},

	-- Misc
	{ 'akinsho/toggleterm.nvim', version = "*", config = true },
	{
		'2kabhishek/termim.nvim',
		cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' }
	},
	-- Language specific
	-- Rust
	{ 'saecki/crates.nvim', }



}

require "lazy".setup(plugins)
require "core"
require "extra"
require "plugins"
