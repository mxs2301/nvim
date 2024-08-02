--vim.g.maplocalleader = "\\"
--vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {

    { import = "plugins" },
  },

  install = { colorscheme = { "catppuccin-latte" } },
  checker = { enabled = false },
})

-- Set theme

if vim.g.neovide then
  vim.cmd.colorscheme("horizon")
  vim.o.guifont = "JetBrainsMono Nerd Font"
  vim.o.background = "dark"
else
  vim.cmd.colorscheme("catppuccin")
end
