return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false,
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
