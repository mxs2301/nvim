local M = {

  {
    "olimorris/persisted.nvim",
    lazy = false,
    opts = {
      autoload = true,
      use_git_branch = true,
    },
    config = function(_,opts)
      require"persisted".setup(opts)
    end,
  }

}

return M
