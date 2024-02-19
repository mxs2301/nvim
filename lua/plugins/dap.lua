local dap = require "dap"

local ui = require "dapui"

local signs = {
  Stopped = ' ',
  Breakpoint = ' ',
}

vim.api.nvim_set_hl(0,'DapStopped', { ctermbg=0, fg='#98c379', bg='#31353f' })
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg=0, fg='#993939', bg='#31353f' })

for type, icon in pairs(signs) do
   local hl = "Dap" .. type
   vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl, linehl=hl})
end

ui.setup()

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/home/max/.local/share/nvim/mason/bin/codelldb',
    args = {"--port", "${port}"},
  }
}


dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

