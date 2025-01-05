return {

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      local opts = {
        sources = {
        }
      }
      null_ls.setup(opts)
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
  },
}
