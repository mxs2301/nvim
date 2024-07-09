return {


  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "lualine".setup()
    end
  },


  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-lua/plenary.nvim",           -- Required for v0.4.0+
      "nvim-tree/nvim-web-devicons",     -- If you want devicons
      "stevearc/resession.nvim"          -- Optional, for persistent history
    },
    config = true
  },

  {
    "rachartier/tiny-devicons-auto-colors.nvim",

    event = "VeryLazy",
    config = function()
      local theme_colors = require "catppuccin.palettes".get_palette("frappe")
      require "tiny-devicons-auto-colors".setup(
        { colors = theme_colors }
      )
    end
  }

}
