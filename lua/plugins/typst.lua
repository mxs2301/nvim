return {

  {
    "chomosuke/typst-preview.nvim",
    ft = {'typst', 'typ'},
    version = '1.*',
    build = function ()
     require"typst-preview".update() 
    end

  }

}
