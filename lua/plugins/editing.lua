return {

  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      { "kkharji/sqlite.lua", module = "sqlite" },
    },

    config = function()
      require("neoclip").setup()
    end,
  },

  {
    "doctorfree/cheatsheet.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local ctactions = require("cheatsheet.telescope.actions")
      local opts = {
        bundled_cheatsheet = {
          enabled = { "default", "nerd-fonts", "unicode", "regex", "markdown" },
          disabled = {},
        },
        bundles_plugin_cheatsheets = {
          enabled = {
            "nvim-dap",
          },
        },
        telescope_mappings = {
          ["<CR>"] = ctactions.select_or_fill_commandline,
          ["<A-CR>"] = ctactions.select_or_execute,
          ["<C-Y>"] = ctactions.copy_cheat_value,
          ["<C-E>"] = ctactions.edit_user_cheatsheet,
        },
      }

      require("cheatsheet").setup(opts)
    end,
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
}
