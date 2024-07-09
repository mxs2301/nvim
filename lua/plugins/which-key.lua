return {

	{
		"folke/which-key.nvim",
		int = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,


		config = function()
			local opts = {
				mode = "n", -- NORMAL mode
				-- prefix: use "<leader>f" for example for mapping everything related to finding files
				-- the prefix is prepended to every mapping part of `mappings`
				prefix = "",
				buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
				silent = true, -- use `silent` when creating keymaps
				noremap = true, -- use `noremap` when creating keymaps
				nowait = false, -- use `nowait` when creating keymaps
				expr = false, -- use `expr` when creating keymaps
			}
			local mapping = {
				["<leader>"] = {
					q = {
						name = "Closing/Quitting",
						q = { "<cmd>q<cr>", "Quit" },
						f = { "<cmd>q!<cr>", "Quit forcefully" },

					},
					l = {
						name = "LSP",
						d = { "<cmd>Telescope lsp_definitions<cr>", "Go to Definition" },
						D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to Declaration" },
						i = { "<cmd>Telescope lsp_implementations<cr>", "List implementations" },
						r = { "<cmd>Telescope lsp_references<cr>", "List References" },
						s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Display Signature Information" },
						S = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
						R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename References" },
						f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format Buffer" },
						a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
						l = { "<cmd>Telescope diagnostics<cr>", "Floating Diagnostics" },
						p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Go to previous Diagnostic" },
						n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Go to next Diagnostic" },
					},

					f = {
						name = "File",
						f = { "<cmd>Telescope find_files<cr>", "Find files" },
						b = { "<cmd>Telescope file_browser<cr>", "File Browser" }
					},

					d = {
						name = "Debug/Dap",
						b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
						c = { "<cmd>DapContinue<cr>", "Start Debugger" },
						t = { "<cmd>DapTerminate<cr>", "Stop Debugger" },
						u = { "<cmd>DapUiToggle<cr>", "Toggle UI" },
						o = { "<cmd>DapStepOver<cr>", "Step Over" },
						O = { "<cmd>DapStepOut<cr>", "Step Out" },
						i = { "<cmd>DapStepInto<cr>", "Step Into" },
						e = { "<cmd>DapEval<cr>", "Evaluate position" },
						r = { "<cmd>DapToggleRepl<cr>", "Toggle Repl" },
					},

          b = {
            name = "Buffer",
            d = {"<cmd>bd<cr>", "Buffer delete"},
            n = {"<cmd>bn<cr>", "Buffer next"},
            p = {"<cmd>bp<cr>", "Buffer previous"},
            l = {"<cmd>Telescope buffers<cr>", "Buffer list"},
            w = {"<cmd>w<cr>", "Buffer write"},
            a = {":badd", "Buffer add empty"},
            f = {"<cmd>bd!<cr>", "Buffer delete force"},
          },
        w = {
            name = "Window",
            j = {"<C-w>j<cr>", "Jump down"},
            k = {"<C-w>k<cr>", "Jump up"},
            l = {"<C-w>l<cr>", "Jump left"},
            h = {"<C-w>h<cr>", "Jump right"},
            v = {"<cmd>vsplit<cr>", "Split vertical"},
            s = {"<cmd>split<cr>", "Split horizontal"},
            a = {"<cmd>tabnew<cr>", "Create empty window/tab"},
            t = {"<cmd>term<cr>", "Create new Terminal Window"},
          },
        p = {
            name = "Project",
            a = {":WorkspacesAdd", "Manually add a new Workspace"},
            r = {":WorkspacesRemove", "Remove Workspace"},
            l = {":WorkspacesList<cr>", "List all registered"},
            o = {":WorkspacesOpen<cr>", "Open Workspace"},
          }

				}
			}

			local wk = require "which-key"
			wk.register(mapping, opts)
		end,




	}


}
