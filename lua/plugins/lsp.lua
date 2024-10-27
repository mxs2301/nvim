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
    "p00f/clangd_extensions.nvim",
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
          require("lspconfig")[server_name].setup({})
        end,
        ["rust_analyzer"] = function() end,



        ["clangd"] = function()
          require("lspconfig")["clangd"].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
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

    config = function()
      -- Set icons
      require "lspconfig"["sourcekit"].setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
