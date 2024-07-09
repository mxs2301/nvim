return {

  {
    "natecraddock/workspaces.nvim",

    config = function()
      local opts = {
        hooks = {
          open = { "Telescope find_files" }
        }
      }

      require "workspaces".setup(opts)
    end
  }

}
