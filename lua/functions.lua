local M = {}
--- Create Mappings
--- Args needs to have following structure
--- {What to map to, command to execute, Description of Keybind}
--- Second argument is the local buffer it should stick to
function M.create_mappings(args, bufnr)
  for _, entry in ipairs(args) do
    vim.keymap.set(
      "n",
      entry[1],
      entry[2],
      { desc = entry[3], silent = true, buffer = bufnr }
    )
  end
end

--- Wrapper to return current buffer
function M.get_current_buffer()
  local x vim.api.nvim_get_current_buf()
  return x
end

-- Function to toggle the linenumber
function M.toggle_linenumber()
  vim.o.relativenumber = not vim.o.relativenumber
end

return M
