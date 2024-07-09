return {

  {
    "chomosuke/typst-preview.nvim",
    ft = {'typst', 'typ'},
    version = '0.3.*',
    build = function ()
     require"typst-preview".update() 
    end

  }

}
