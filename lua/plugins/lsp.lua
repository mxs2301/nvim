local cmp = require 'cmp'
local select_opts = { behavior = cmp.SelectBehavior.Select }
local luasnip = require "luasnip"
-- Snippet

local icons = {
	Text = '󱀍  ',
	Method = '󰡱  ',
	Function = '󰊕  ',
	Constructor = '  ',
	Field = '󰽏  ',
	Variable = '󰫧  ',
	Class = '  ',
	Interface = '  ',
	Module = ' ',
	Property = '  ',
	Unit = '  ',
	Value = '󱊧  ',
	Enum = '  ',
	Keyword = '󰌆  ',
	Snippet = '  ',
	Color = '  ',
	File = '  ',
	Reference = '󰬳  ',
	Folder = '  ',
	EnumMember = '  ',
	Constant = '󰀁  ',
	Struct = '  ',
	Event = '  ',
	Operator = '  ',
	TypeParameter = '  ',
}

local signs = {
	Error = ' ',
	Hint = '󰌵 ',
	Warn = ' ',
	Info = ' ',
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end



require "luasnip.loaders.from_vscode".lazy_load()

-- CMP setup
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			--vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = (icons[vim_item.kind] or '') .. vim_item.kind
			vim_item.menu = ({
				buffer = '[Buffer]',
				nvim_lsp = '[LSP]',
				luasnip = '[LuaSnip]',
				nvim_lua = '[Lua]',
				latex_symbols = '[LaTeX]',
				vimtex = '[Vimtex]',
			})[entry.source.name]
			return vim_item
		end,
	},



	mapping = cmp.mapping.preset.insert({
		['<Up>'] = cmp.mapping.select_prev_item(select_opts),
		['<Down>'] = cmp.mapping.select_next_item(select_opts),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<C-u>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }
		),

		['<C-d>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }
		),

		['<Tab>'] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1

			if cmp.visible() then
				cmp.select_next_item(select_opts)
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, { 'i', 's' }
		),

		['<S-Tab>'] = cmp.mapping(
			function(fallback)
				if cmp.visible() then
					cmp.select_prev_item(select_opts)
				else
					fallback()
				end
			end, { 'i', 's' }
		),

	}),
	--[[sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		--{ name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	}),]]

	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'vimtex' },
	},

	--completion = {
	--		completeopt = vim.o.completeopt
	--},

})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Neodev
require "neodev".setup({
	library = { plugins = { "nvim-dap-ui" }, types = true }
})

require "mason".setup()

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.opt.completeopt = "menu,menuone,noselect"

local lsp = require "lspconfig"
local list = {
	'lua_ls',
	'clangd',
}

local function server(name)
	lsp[name].setup {
		capabilities = capabilities
	}
end

for _, name in ipairs(list) do
	server(name)
end
