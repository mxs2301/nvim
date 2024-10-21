return {
  {
    "declancm/cinnamon.nvim",
    version = "*",
    opts = {}
    ,
    config = function()
      local opts = {
        keymaps = {
          basic = true,
          extra = true,
        }
      }
      require "cinnamon".setup(opts)
    end
  }
}
