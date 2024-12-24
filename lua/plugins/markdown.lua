return {

  {
    "MeanderingProgrammer/markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function()
      require("render-markdown").setup({})
    end,
  },

  {
    "jannis-baum/vivify.vim",
  },

  {
    "axieax/urlview.nvim",
    opts = {
      default_picker = "telescope"
    },
    config = function (_, opts)
      require"urlview".setup(opts)
    end
  },

  {
    "3rd/image.nvim",
    enabled = false,
    config = function()
      local opts = {
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
          }
        }
      }
      require 'image'.setup(opts)
    end
  },
  {
    "3rd/diagram.nvim",
    enabled = false,
    dependencies = {
      "3rd/image.nvim",
    },
    opts = { -- you can just pass {}, defaults below
      renderer_options = {
        mermaid = {
          background = nil, -- nil | "transparent" | "white" | "#hex"
          theme = nil,    -- nil | "default" | "dark" | "forest" | "neutral"
          scale = 1,      -- nil | 1 (default) | 2  | 3 | ...
        },
        plantuml = {
          charset = nil,
        },
        d2 = {
          theme_id = nil,
          dark_theme_id = nil,
          scale = nil,
          layout = nil,
          sketch = nil,
        },
      }
    },
  },

  {
    'arminveres/md-pdf.nvim',
    branch = 'main',
    lazy = true,
    opts = {}
  }

}
