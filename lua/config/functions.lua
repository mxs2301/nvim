local create = vim.api.nvim_create_user_command
local opts = {}
create("DapUiToggle", ':lua require"dapui".toggle()', opts)
create("ReplCheck", ":lua= require'dap'.sessions().capabilities.supportsCompletionsRequest", opts)




