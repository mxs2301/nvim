return { 

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    cmd = {
      "DiffviewFileHistory",
      "DiffviewOpen",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local opts = {}
      require("gitsigns").setup(opts)
    end,
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "jjcxdev/gitsignal",
  },

  {
    "tpope/vim-fugitive"
  }
}
