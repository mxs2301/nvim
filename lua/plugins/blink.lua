return {

  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {
      impersonate_nvim_cmp = true,
    },
    config = true,
  },

  {
    'saghen/blink.cmp',
    version = 'v0.*',
    build = "rustup default nightly && cargo build --release",
    -- !Important! Make sure you're using the latest release of LuaSnip
    -- `main` does not work at the moment
    dependencies = { { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      { 'rafamadriz/friendly-snippets' },
      { "ray-x/cmp-sql" },
      { "Saecki/crates.nvim", },
      { "micangl/cmp-vimtex", }
    },
    opts = {
      snippets = {
        expand = function(snippet) require "luasnip".lsp_expand(snippet) end,
        active = function(filter)
          if filter and filter.direction then
            return require "luasnip".jumpable(filter.direction)
          end
          return require "luasnip".in_snippet()
        end,
        jump = function(direction) require "luasnip".jump(direction) end,
      },
      -- If luasnip is not working, use native snippets
      -- snippets = {
      --   expand = function(snippet)
      --     vim.snippet.expand(snippet)
      --   end,
      --   active = function(filter)
      --     return vim.snippet.active(filter)
      --   end,
      --   jump = function(direction)
      --     vim.snippet.jump(direction)
      --   end
      -- },
      sources = {
        default = { 'lsp', 'path', 'luasnip', 'buffer', 'crates', 'sql', 'vimtex' },
        providers = {
          sql = {
            name = 'sql',
            enabled = false,
            async = true,
            module = 'blink.compat.source',
            score_offset = -3,
          },
          crates = {
            enabled = false,
            async = true,
            name = 'crates',
            module = 'blink.compat.source'
          },
          vimtex = {
            name = 'vimtex',
            async = true,
            enabled = true,
            module = 'blink.compat.source'
          }

        },
        cmdline = {},
      },
      enabled = function() return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false end,
      signature = {
        enabled = true
      },
      completion = {

        ghost_text = {
          enabled = true,
        },

        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              label = {
                text = require "colorful-menu".blink_components_text,
                highlight = require "colorful-menu".blink_components_highlight,
              },
            },

          }
        }

      },
      keymap = {
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
      },
    },
    opts_extend = { "sources.default", "sources.providers" }
  }
}
