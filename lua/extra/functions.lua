local fn = vim.api.nvim_create_user_command

local opts = {}

fn('DapUIToggle', 'lua require"dapui".toggle()', opts)
vim.api.nvim_create_user_command('HI', 'echo "HI"', {})