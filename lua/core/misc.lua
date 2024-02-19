-- CMD commands

vim.cmd.colorscheme "catppuccin-frappe"

local opt = vim.opt

opt.termguicolors = true
opt.cursorline = true
opt.tabstop= 2
opt.softtabstop =2
opt.shiftwidth= 2
opt.smartindent = true
opt.expandtab = true
opt.showcmd = true
opt.incsearch = true
opt.completeopt = {'menu', 'menuone','noselect'}

vim.o.updatetime = 300

