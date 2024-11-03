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

  --{
  --  "jedrzejboczar/exrc.nvim",
  --  dependencies = { "neovim/nvim-lspconfig" }, -- (optional)
  --  config = function()
  --    local opts = {}
  --    require("exrc").setup(opts)
  --  end,
  --},

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
