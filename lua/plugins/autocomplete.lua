return {

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",

      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },

  {

    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {

      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "SergioRibera/cmp-dotenv",
      --"hrsh7th/cmp-path",
      "FelipeLema/cmp-async-path",
      "hrsh7th/cmp-cmdline",
      "rcarriga/cmp-dap",
      "ray-x/cmp-sql",
      "micangl/cmp-vimtex",

      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },

    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      --local lspkind = require("lspkind")
      local icons = {
        Text = "󱀍  ",
        Method = "󰡱  ",
        Function = "󰊕  ",
        Constructor = "  ",
        Field = "󰽏  ",
        Variable = "󰫧  ",
        Class = "  ",
        Interface = "  ",
        Module = " ",
        Property = "  ",
        Unit = "  ",
        Value = "󱊧  ",
        Enum = "  ",
        Keyword = "󰌆  ",
        Snippet = "  ",
        Color = "  ",
        File = "  ",
        Reference = "󰬳  ",
        Folder = "  ",
        EnumMember = "  ",
        Constant = "󰀁  ",
        Struct = "  ",
        Event = "  ",
        Operator = "  ",
        TypeParameter = "  ",
        Version = "  ",
        sql = "  ",
      }
      local cmp_settings = {

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),

          ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  select = true,
                })
              end
            else
              fallback()
            end
          end),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "snippets" },
          { name = "buffer" },
          { name = "dotenv" },
          { name = "async_path" },
          { name = "crates" },
          { name = "vim-dadbod-completion" },
        }),

        formatting = {
          -- LSP Kind icons
          --format = lspkind.cmp_format({
          --	mode = "symbol_text",
          --	preset = "codicons",
          --	maxwidth = 50,
          --	ellipsis_char = "...",
          --	show_labelDetails = true,
          --}),
          fields = { "kind", "abbr", "menu" },

          format = function(entry, vim_item)
            vim_item.kind = (icons[vim_item.kind] or "") .. vim_item.kind
            vim_item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              vimtex = "[Vimtex]",
              luasnip = "[LuaSnip]",
              sql = "[SQL]",
              crates = "[Crates]",
              vim_dadbod_completion = "[VIMDB]",
            })[entry.source.name]
            return vim_item
          end,
        },
      }

      local cmp_path = {
        {
          "/",
          "?",
        },
        {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        },
      }

      local cmp_double_quote = {
        { ":" },
        {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            --{ name = "path" },
            { name = "async_path" },
          }, {
            { name = "cmdline" },
          }),
          matching = { disallow_symbol_nonprefix_matching = false },
        },
      }

      local cmp_dap = {
        { "dap-repl", "dapui_watches", "dapui_hover" },
        {
          sources = {
            { name = "dap" },
          },
        },
      }

      local cmp_sql = {
        {
          "sql",
        },

        {
          sources = {
            { name = "sql" },
          },
        },
      }

      cmp.setup(cmp_settings)
      cmp.setup.cmdline(cmp_path[1], cmp_path[2])
      cmp.setup.cmdline(cmp_double_quote[1], cmp_double_quote[2])
      cmp.setup.filetype(cmp_dap[1], cmp_dap[2])
      cmp.setup.filetype(cmp_sql[1], cmp_sql[2])
    end,
  },
}
