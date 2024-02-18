local null_ls = require"null-ls"

local format = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion


null_ls.setup({
	sources = {
		format.clang_format,
		diagnostic.cpplint,
	}
})