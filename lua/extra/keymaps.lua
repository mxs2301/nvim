local opts = {
	noremap = true
}

local keymap = vim.api.nvim_set_keymap

keymap('t', '<C-e>', '<ESC><C-\\><C-n>', opts)
