local M = {

  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    opts = {
      rocks = { "magick" },
    },
    config = function()
      require "luarocks-nvim".setup()
    end
  }

}

return M
