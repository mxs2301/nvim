return {

	{
		"EdenEast/nightfox.nvim",
	},
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"akinsho/horizon.nvim",
	},

	{
		"catppuccin/nvim",
		name = "catppucin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				term_colors = true,
				integrations = {
				blink_cmp = false,
					}
			})
		end,
	},
}
