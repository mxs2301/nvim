return {

	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
      "rcasia/neotest-java",
		},
		config = function()
			require("neotest").setup({
      adapters = {
          require"rustaceanvim.neotest",
          require"neotest-java",
        }
      })
		end,
	},
}
