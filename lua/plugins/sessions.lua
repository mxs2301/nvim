local M = {

  {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    config = function()
      local opts = {
        autosave = true,
        autoload = true,
        autoswap = {
          enable = true
        },
      }
      require "nvim-possession".setup(opts)
    end,
  }

}

return M
