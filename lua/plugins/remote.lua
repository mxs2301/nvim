local M = {

  {
    "amitds1997/remote-nvim.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },

  {
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
      require "distant":setup()
    end
  }
}

return M
