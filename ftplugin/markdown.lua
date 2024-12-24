local mod = require "functions"
local bufnr = vim.api.nvim_get_current_buf()

local args = {
  { "<leader>sv", function() vim.cmd.Vivify() end,                    "Vivify Start" },
  { "<leader>sp", function() require "md-pdf".convert_md_to_pdf() end, "Convert Markdown to PDF" }
}

mod.create_mappings(args, bufnr)
