local create = vim.api.nvim_create_user_command
local mod = require("functions")

create("ToggleLineNumber", function() mod.toggle_linenumber() end, {})

