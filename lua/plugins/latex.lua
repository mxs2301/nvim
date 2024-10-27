return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      -- Uncomment the engine to use
      -- If none is uncommented latexmk with pdflatex will be used
      -- vim.g.vimtex_compiler_method = 'arara'
      -- vim.g.vimtex_compiler_method = 'tectonic' -- Just compiler
    end
  }
}
