return {

	{
		"EdenEast/nightfox.nvim",
	},

	{
		"catppuccin/nvim",
		name = "catppucin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				term_colors = true,
			})
		end,
	},
}
