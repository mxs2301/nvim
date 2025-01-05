return {

  {
    "natecraddock/workspaces.nvim",

    config = function()
      local opts = {
        hooks = {
          open = { "Telescope find_files" },
        },
      }

      require("workspaces").setup(opts)
    end,
  },
  {
    'brymer-meneses/project-config.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter'
    },
    opts = {},
  }

}
