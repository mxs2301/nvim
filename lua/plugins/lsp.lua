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
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local opts = {}
      require("mason-lspconfig").setup(opts)

      require("mason-lspconfig").setup_handlers({


        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = require "blink.cmp".get_lsp_capabilities(),
            -- capabilities = require "cmp_nvim_lsp".default_capabilities(),
            on_attach = function()
              if vim.lsp.inlay_hint then
                vim.lsp.inlay_hint.enable(true, { 0 })
              end
            end
          })
        end,
        ["rust_analyzer"] = function() end,

        ["lua_ls"] = function()
          require "lspconfig"["lua_ls"].setup {
            capabilities = require "blink.cmp".get_lsp_capabilities(),
            -- capabilities = require "cmp_nvim_lsp".default_capabilities(),
            on_attach = function()
              vim.lsp.inlay_hint.enable(true, { 0 })
            end,
            settings = {
              Lua = {
                hint = {
                  enable = true
                },
              }
            }
          }
        end,

        ["harper_ls"] = function()
          capabilities = require "blink.cmp".get_lsp_capabilities(),
              require "lspconfig"["harper_ls"].setup({
                capabilities = capabilities,
                filetypes = {
                  "markdown", "latex", "tex"
                }
              })
        end,

        ["typos_lsp"] = function()
          require "lspconfig"["typos_lsp"].setup({
            capabilities = require "blink.cmp".get_lsp_capabilities(),
            filetypes = {
              "markdown", "latex", "tex"
            }
          })
        end,


        ["clangd"] = function()
          require("lspconfig")["clangd"].setup({
            capabilities = require "blink.cmp".get_lsp_capabilities(),
            -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = function()
              require("clangd_extensions.inlay_hints").setup_autocmd()
              require("clangd_extensions.inlay_hints").set_inlay_hints()
            end,
          })
        end,
      })
    end,
  },

  {

    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp"
    },

    config = function()
      -- Set icons
      require "lspconfig"["sourcekit"].setup({

        capabilities = require "blink.cmp".get_lsp_capabilities(),
        -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
        filetypes = {
          "swift", "objc", "objcpp"
        }
      })

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
