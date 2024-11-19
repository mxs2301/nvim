return {
  {
    'nanozuki/tabby.nvim',
    -- event = 'VimEnter', -- if you want lazy load, see below
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local opts = {}
      require "tabby".setup(opts)
    end,
  },


  {
    -- Calls `require('slimline').setup({})`
    "sschleemilch/slimline.nvim",
    dependencies = {
      "echasnovski/mini.icons",
      "lewis6991/gitsigns.nvim"
    },
    opts = {},
    config = function(_, opts)
      require "slimline".setup(opts)
    end
  },

  {
    "rachartier/tiny-devicons-auto-colors.nvim",

    event = "VeryLazy",
    config = function()
      local theme_colors = require("catppuccin.palettes").get_palette("frappe")
      require("tiny-devicons-auto-colors").setup({ colors = theme_colors })
    end,
  },

}
