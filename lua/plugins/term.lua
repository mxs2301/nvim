return {

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      local opts = {
      }
      require "toggleterm".setup(opts)
    end
  },

   {
        '2kabhishek/termim.nvim',
        cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' },
    },
}
