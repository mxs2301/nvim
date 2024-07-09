-- Outside keymaps

vim.keymap.set("n", "i", ":set norelativenumber<CR>:set number<CR>i")
vim.keymap.set('i', '<ESC>', "<ESC><cmd>set nonumber<CR><cmd>set relativenumber<CR>")
vim.keymap.set("t", "<C-e>", "<C-\\><C-n>")

vim.opt.guifont = "FiraCode Nerd Font:14"
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.showtabline = 2
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- Tab

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- UI

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
-- Search

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = false
vim.opt.smartcase = true
