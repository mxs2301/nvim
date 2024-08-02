return {
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		lazy = false,
	},

	{
		"Saecki/crates.nvim",

		config = function()
			local opts = {
				completion = {
					cmp = {
						enabled = true,
					},
				},
			}
			require("crates").setup(opts)
		end,
	},

	{
		"p00f/clangd_extensions.nvim",
	},
	{
		"ranjithshegde/ccls.nvim",
	},

	{
		"mfussenegger/nvim-jdtls",
	},

	{

		"neovim/nvim-lspconfig",

		config = function()
			-- Set icons

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
				virtual_text = {
					prefix = "󰊠 ",
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lsp = require("lspconfig")

			local server = {
				--'clangd',
				"lua_ls",
				"texlab",
				"typst_lsp",
				"ccls",
        "slint_lsp",
				--"scheme-langserver",
			}

			for _, value in pairs(server) do
				lsp[value].setup({
					capabilities = capabilities,
				})
			end

			-- Place to setup server that needs more than standard settings

			lsp["pylyzer"].setup({
				capabilities = capabilities,
				settings = {
					python = {
						checkOnType = true,
						diagnostics = true,
						inlayHints = true,
						smartCompletion = true,
					},
				},
			})

			-- lsp["clangd"].setup({
			--   capabilities = capabilities,
			--   on_attach = function()
			--     require("clangd_extensions.inlay_hints").setup_autocmd()
			--     require("clangd_extensions.inlay_hints").set_inlay_hints()
			--   end,
			-- })
		end,
	},
}
