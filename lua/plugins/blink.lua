return {

  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {}
  },

  {
    'saghen/blink.cmp',
    version = 'v0.*',
    -- !Important! Make sure you're using the latest release of LuaSnip
    -- `main` does not work at the moment
    dependencies = { { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      { 'rafamadriz/friendly-snippets' },
      {"ray-x/cmp-sql"},
    },
    opts = {
      snippets = {
        expand = function(snippet)
          vim.snippet.expand(snippet)
        end,
        active = function(filter)
          return vim.snippet.active(filter)
        end,
        jump = function(direction)
          vim.snippet.jump(direction)
        end
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        cmdline = {},
        optionals = {"sql"}
      },
      providers = {
        sql = {
          name = 'sql',
          module = 'blink.compat.source',
          score_offset = -3,
        }
      },
      -- enabled = function() return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false end,
      signature = {
        enabled = true
      },
      ghost_text = {
        enabled = true,
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
      opts_extend = { "sources.default", "sources.cmdline", "sources.optionals" }
    }
  }
}
