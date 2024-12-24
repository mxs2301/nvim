local mod = require("functions")
local bufnr = mod.get_current_buffer()
local args = {
  { "<leader>sc", function() vim.cmd.VimtexCompile() end, "Compile Latex File" },
  { "<leader>st", function ()
    vim.cmd.VimtexStop()
  end, "Stop Compiling Latex File"},
  {"<leader>se", function() vim.cmd.VimtexError() end, "Show Latex errors"},
  {"<leader>sv", function() vim.cmd.VimtexView() end, "View Latex File"},
  {"<leader>sr", function() vim.cmd.VimtexClean() end, "Clean Vimtex Files"}
}

mod.create_mappings(args, bufnr)
