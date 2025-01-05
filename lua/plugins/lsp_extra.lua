return {

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
        },
      })
    end,
  },

  {
    "zeioth/none-ls-autoload.nvim",
    enabled = false,
    event = "BufEnter",
    dependencies = {
      "williamboman/mason.nvim",
      "zeioth/none-ls-external-sources.nvim",
    },

    opts = {
      external_sources = {
        'none-ls-external-sources.diagnostics.cpplint'

      },
    },
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
  },
}
