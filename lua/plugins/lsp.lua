return {

  {
    "nvim-flutter/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim"
    },
    config = function()
      require "flutter-tools".setup {}
    end
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
        },
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(true, { 0 })
            -- you can also put keymaps in here
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
              diagnostics = {
                enable = true,
              },
              check = {
                command = "clippy"
              }
            },
          },
        },
        -- DAP configuration
        dap = {
        },
      }
    end
  },

  {
    "Saecki/crates.nvim",

    config = function()
      local opts = {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("crates").setup(opts)
    end,
  },

  {
    url = "https://git.sr.ht/~p00f/clangd_extensions.nvim",
  },
  {
    "ranjithshegde/ccls.nvim",
  },

  {
    "mfussenegger/nvim-jdtls",
  },

  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "numToStr/Comment.nvim",
    },
    opts = {
      lsp = {
        auto_attach = true,
      }
    }
  },




  {

    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp"
    },

    config = function()
      local lsp = require "lspconfig"
      local blink = require "blink.cmp".get_lsp_capabilities()
      local nav = require "nvim-navbuddy".attach

      --- Set up inlay_hints for servers that support it
      local function inlay_hint()
        if vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true, { 0 })
        end
      end
      --- Setup function to see if document symbols are supported by the Server
      local function navbuddy(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          nav(client, bufnr)
        else
          print("No")
        end
      end

      -- Set basic server
      -- Write list of servers
      -- The list should include servers which work without special settings
      local server = {}

      -- Setup of basic server, which need no special settings
      for index, name in ipairs(server) do
        lsp[name].setup({
          capabilities = require "blink.cmp".get_lsp_capabilities(),
          on_attach = function(client, bufnr)
            inlay_hint()
            navbuddy(client, bufnr)
          end,
        })
      end



      -- Setup of special servers
      -- Lua LS as an example on how it could look like
      lsp["lua_ls"].setup {
        capabilities = blink,
        on_attach = function(client, bufnr)
          navbuddy(client, bufnr)
          inlay_hint()
        end,
        settings = {
          Lua = {
            hint = {
              enable = true
            },
          }
        }
      }


      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        virtual_text = {
          prefix = "󰊠 ",
        },
      })
    end,
  },
}
