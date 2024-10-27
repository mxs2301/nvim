local mod = require "functions"
local bufnr = vim.api.nvim_get_current_buf()


local args = {
  { "<leader>sc", function() vim.cmd.RustLsp('openCargo') end,   "Open Cargo.toml" },
  { "<leader>se", function() vim.cmd.RustLsp('expandMacro') end, "Expand Macro in Buffer" },
}

mod.create_mappings(args, bufnr)
