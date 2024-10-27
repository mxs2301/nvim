local mod = require("functions")
local bufnr = mod.get_current_buffer()
local args = {
  { "<leader>sc", function() vim.cmd.VimtexCompile() end, "Compile Latex File" },
  { "<leader>st", function ()
    vim.cmd.VimtexStop()
  end, "Stop Compiling Latex File"}
}

mod.create_mappings(args, bufnr)
