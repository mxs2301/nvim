return {

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },

  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    branch = '0.1.x',
    config = function()
      local telescope = require "telescope"
      local opts = {
        pickers = {
          find_files = {
            hidden = true
          },

        },
        extensions = {
          file_browser = {
            select_buffer = true,
            hidden = { file_browser = true, folder_browser = true },
          }
        }

      }
      telescope.setup(opts)
      telescope.load_extension "file_browser"
      telescope.load_extension "neoclip"
    end
  },


}
