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
          { "<leader>q",  group = "Closing/Quitting" },
          { "<leader>qf", "<cmd>q!<cr>",             desc = "Quit forcefully" },
          { "<leader>qq", "<cmd>q<cr>",              desc = "Quit" },
        },

        {
          mode = "n",
          { "<leader>s", group = "Buffer Special Mappings" }
        },

        {
          mode = "n",
          { "<leader>l",  group = "LSP" },
          { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>",     desc = "Go to Definition" },
          { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to Declaration" },
          { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "List implementations" },
          { "<leader>lr", "<cmd>Telescope lsp_references<cr>",      desc = "List References" },
          {
            "<leader>ls",
            "<cmd>lua vim.lsp.buf.signature_help()<cr>",
            desc = "Display Signature Information",
          },
          { "<leader>lS", "<cmd>Telescope lsp_document_symbols<cr>",                                     desc = "Document Symbols" },
          { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>",                                           desc = "Rename Reference" },
          { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",                                           desc = "Format Buffer" },
          { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                                      desc = "Code Actions" },
          { "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev()<cr>",                                     desc = "Go to previous Diagnostic" },
          { "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<cr>",                                     desc = "Go to next Diagnostic" },
          { "<leader>ll", "<cmd>Telescope diagnostics<cr>",                                              desc = "Floating Diagnostics" },
          { "<leader>lt", "<cmd>Trouble<cr>",                                                            desc = "Trouble Panel" },
          { "<leader>lh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc = "Toggle Inlay Hints" },
        },
        {
          mode = "n",
          { "<leader>f",  group = "File" },
          { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Find Files" },
          { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
          { "<leader>fy", function() vim.cmd.Yazi() end,     desc = "Open Yazi File Browser at current file" },
        },
        {
          mode = "n",
          { "<leader>d",  group = "Debugging" },
          { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
          { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Start Debugging" },
          { "<leader>dt", "<cmd>DapTerminate<cr>",        desc = "Stop Debugging" },
          { "<leader>du", "<cmd>DapUiToggle<cr>",         desc = "Toggle UI" },
          { "<leader>do", "<cmd>DapStepOver<cr>",         desc = "Step Over" },
          { "<leader>dO", "<cmd>DapStepOut<cr>",          desc = "Step Out" },
          { "<leader>di", "<cmd>DapStepInto<cr>",         desc = "Step Into" },
          { "<leader>de", "<cmd>DapEval<cr>",             desc = "Evaluate current", mode = "v" },
          { "<leader>dr", "<cmd>DapToggleRepl<cr>",       desc = "Toggle Repl" },
        },

        {
          mode = "n",
          { "<leader>b",   group = "Buffer" },
          { "<leader>bd",  "<cmd>bd<cr>",                                desc = "Buffer delete" },
          { "<leader>bn",  "<cmd>bn<cr>",                                desc = "Buffer next" },
          { "<leader>bp",  "<cmd>bp<cr>",                                desc = "Buffer Previous" },
          { "<leader>bl",  "<cmd>Telescope buffers<cr>",                 desc = "Buffer list" },
          { "<leader>bw",  "<cmd>w<cr>",                                 desc = "Buffer write" },
          { "<leader>ba",  ":badd",                                      desc = "Buffer add (followed by new Buffername)" },
          { "<leader>bf",  ":bd!<cr>",                                   desc = "Buffer kill" },
          { "<leader>bs",  group = "Buffer Sessions" },
          { "<leader>bss", function() vim.cmd.Autosession("search") end, desc = "Search for specific Buffer Session" },
          { "<leader>bsd", function() vim.cmd.Autosession("delete") end, desc = "Delete specific Buffer Session" },
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
          { "<leader>wa", "<cmd>tabnew<cr>",             desc = "Create empty tab/window" },
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
