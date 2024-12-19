return {

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      "echasnovski/mini.icons",
    },
    config = function()
      local wk = require("which-key")
      local mappings = {


        {
          mode = "n",
          { "<C-j>", "<cmd>Treewalker Down<cr>",  desc = "Jump down one Treesitter object" },
          { "<C-k>", "<cmd>Treewalker Up<cr>",    desc = "Jump Up one Treesitter object" },
          { "<C-l>", "<cmd>Treewalker Left<cr>",  desc = "Jump left one Treesitter object" },
          { "<C-h>", "<cmd>Treewalker Right<cr>", desc = "Jump right one Treesitter object" },
        },
        {
          mode = "n",
          { "<leader>q",  group = "Closing/Quitting" },
          { "<leader>qf", "<cmd>q!<cr>",             desc = "Quit forcefully" },
          { "<leader>qq", "<cmd>q<cr>",              desc = "Quit" },
          { "<leader>qa", "<cmd>qa<cr>",             desc = "Quit all" },
        },

        {
          mode = "n",
          { "<leader>s", group = "Buffer Special Mappings" }
        },

        {
          mode = "n",
          { "<leader>l",  group = "LSP" },
          { "<leader>ld", function() vim.cmd.FzfLua("lsp_definitions") end,     desc = "Go to Definition" },
          { "<leader>lD", function() vim.cmd.FzfLua("declaration") end,         desc = "Go to Declaration" },
          { "<leader>li", function() vim.cmd.FzfLua("lsp_implementations") end, desc = "List implementations" },
          { "<leader>lr", function() vim.cmd.FzfLua("lsp_references") end,      desc = "List References" },
          {
            "<leader>ls",
            "<cmd>lua vim.lsp.buf.signature_help()<cr>",
            desc = "Display Signature Information",
          },
          { "<leader>lS", function() vim.cmd.FzfLua("lsp_document_symbols") end,                         desc = "Document Symbols" },
          { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>",                                           desc = "Rename Reference" },
          { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",                                           desc = "Format Buffer" },
          { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                                      desc = "Code Actions" },
          { "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev()<cr>",                                     desc = "Go to previous Diagnostic" },
          { "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<cr>",                                     desc = "Go to next Diagnostic" },
          { "<leader>ll", function() vim.cmd.FzfLua("diagnostics_documents") end,                        desc = "Floating Diagnostics" },
          { "<leader>lt", "<cmd>Trouble<cr>",                                                            desc = "Trouble Panel" },
          { "<leader>lh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc = "Toggle Inlay Hints" },
        },

        {
          mode = "n",
          {
            "<leader>m",
            group = "Miscellaneous",
          },
          { "<leader>ml", function() vim.cmd.ToggleLineNumber() end, desc = "Toggle Linenumber" }
        },

        {
          mode = "n",
          { "<leader>f",  group = "File" },
          { "<leader>ff", function() vim.cmd.FzfLua("files") end,   desc = "Find Files" },
          { "<leader>ft", function() vim.cmd.Neotree("toggle") end, desc = "File Browser" },
        },
        {
          mode = "n",
          { "<leader>d",  group = "Debugging" },
          { "<leader>db", "<cmd>DapToggleBreakpoint<cr>",          desc = "Toggle Breakpoint" },
          { "<leader>dc", "<cmd>DapContinue<cr>",                  desc = "Start Debugging" },
          { "<leader>dt", "<cmd>DapTerminate<cr>",                 desc = "Stop Debugging" },
          { "<leader>du", function() require "dapui".toggle() end, desc = "Toggle UI" },
          { "<leader>do", "<cmd>DapStepOver<cr>",                  desc = "Step Over" },
          { "<leader>dO", "<cmd>DapStepOut<cr>",                   desc = "Step Out" },
          { "<leader>di", "<cmd>DapStepInto<cr>",                  desc = "Step Into" },
          { "<leader>de", "<cmd>DapEval<cr>",                      desc = "Evaluate current", mode = "v" },
          { "<leader>dr", "<cmd>DapToggleRepl<cr>",                desc = "Toggle Repl" },
        },

        {
          mode = "n",
          { "<leader>b",  group = "Buffer" },
          { "<leader>bd", function() Snacks.bufdelete() end,        desc = "Buffer delete" },
          { "<leader>bq", function() Snacks.bufdelete.all() end,    desc = "Buffer delete all" },
          { "<leader>bn", "<cmd>bn<cr>",                            desc = "Buffer next" },
          { "<leader>bp", "<cmd>bp<cr>",                            desc = "Buffer Previous" },
          { "<leader>bl", function() vim.cmd.FzfLua("buffers") end, desc = "Buffer list" },
          { "<leader>bw", "<cmd>w<cr>",                             desc = "Buffer write" },
          {
            "<leader>ba",
            function()
              vim.ui.input({ prompt = "Buffername" }, function(input)
                vim.cmd.badd(input)
              end)
            end,
            desc = "Buffer add (followed by new Buffername)"
          },

          { "<leader>bf",  ":bd!<cr>",                             desc = "Buffer kill" },
          { "<leader>bs",  group = "Sessions" },
          { "<leader>bss", function() vim.cmd.SessionSearch() end, desc = "Search for specific Session" },
          { "<leader>bsd", function() vim.cmd.SessionDelete() end, desc = "Delete current Session" },
          { "<leader>bsu", function() vim.cmd.SessionSave() end,   desc = "Update Session entry" },
        },

        {
          mode = "n",
          { "<leader>w",  group = "Window" },
          { "<leader>wj", "<C-w>j<cr>",                  desc = "Jump down" },
          { "<leader>wk", "<C-w>k<cr>",                  desc = "Jump up" },
          { "<leader>wl", "<C-w>l<cr>",                  desc = "Jump left" },
          { "<leader>wh", "<C-w>h<cr>",                  desc = "Jump right" },
          { "<leader>wb", "<Plug>(WormholeLabels)",      desc = "Wormhole Labels" },
          { "<leader>wc", "<Plug>(WormholeCloseLabels)", desc = "Wormhole Close Labels" },
          { "<leader>wv", "<cmd>vsplit<cr>",             desc = "Split vertical" },
          { "<leader>ws", "<cmd>split<cr>",              desc = "Split horizontal" },
          {
            "<leader>wa",
            function()
              vim.ui.input({ prompt = "Please enter Tabname" }, function(input)
                vim.cmd.tabnew(input)
              end)
            end,
            desc = "Create tab"
          },
          { "<leader>wn", "<cmd>tabnext<cr>",           desc = "Next Tab" },
          { "<leader>wp", "<cmd>tabprevious<cr>",       desc = "Previous Tab" },
          { "<leader>wt", "<cmd>Tabby jump_to_tab<cr>", desc = "Jump to specific Tab" },
          { "<leader>wd", "<cmd>tabclose<cr>",          desc = "Close Tab" },
          {
            "<leader>wr",
            function()
              vim.ui.input({ prompt = "Enter new name for tab" }, function(input)
                vim.cmd.Tabby({ "rename_tab", input })
              end)
            end,
            desc = "Rename tab"
          }

        },

        {
          mode = "n",
          { "<leader>p",  group = "Project" },
          { "<leader>pa", ":WorkspacesAdd",      desc = "Manually add a new Workspace" },
          { "<leader>pr", ":WorkspacesRemove",   desc = "Remove Workspace" },
          { "<leader>pl", ":WorkspacesList<cr>", desc = "List Workspaces" },
          { "<leader>po", ":WorkspacesOpen<cr>", desc = "Open Workspace" },
        },

        {
          mode = "n",
          { "<leader>g",  group = "Git" },
          { "<leader>gc", ":Fugit2<cr>",                   desc = "Open Git Client" },
          { "<leader>gl", ":LazyGit<cr>",                  desc = "Open LazyGit" },
          { "<leader>gn", function() vim.cmd.Neogit() end, desc = "Open Neogit" },
        },
        {
          mode = "n",
          { "<leader>t",  group = "Tools" },
          { "<leader>td", ":DBUIToggle<cr>", desc = "Toggle Databaseclient" },
          { "<leader>tt", ":FTerm<cr>",      desc = "Open Terminal" },
          { "<leader>tv", ":VTerm<cr>",      desc = "Open vertical Terminal" },
          { "<leader>ts", ":STerm<cr>",      desc = "Open horizontal Terminal" },
        },

        { "<C-e>", "<C-\\><C-n>", desc = "Exit terminal", mode = "t" },
      }

      wk.add(mappings)
    end,
  },
}
