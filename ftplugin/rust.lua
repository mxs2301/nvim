local bufnr = vim.api.nvim_get_current_buf()
function create_mappings(args)
  for _, entry in ipairs(args) do
    vim.keymap.set(
      "n",
      entry[1],
      entry[2],
      { desc = entry[3], silent = true, buffer = bufnr }
    )
  end
end

local args = {

  { "<leader>sc", function() vim.cmd.RustLsp('openCargo') end,   "Open Cargo.toml" },
  { "<leader>se", function() vim.cmd.RustLsp('expandMacro') end, "Expand Macro in Buffer" },


}

create_mappings(args)
