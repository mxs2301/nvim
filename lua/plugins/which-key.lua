local wk = require "which-key"





wk.register({
	["<leader>"] = {
		q = {
			name = "Quit",
			f = { "<cmd>q!<cr>", "Force" },
			q = { "<cmd>q<cr>", "Normal" },
			a = { "<cmd>qa<cr>", "All" },
			x = { "<cmd>x<cr>", "Write + Quit" }
		},
		b = {
			name = "Buffer",
			n = { ":bnext<CR>", "Next Buffer" },
			p = { ":bprevious<CR>", "Previous Buffer" },
			w = { ":write<CR>", "Write Buffer" },
			f = { ":lua vim.lsp.buf.format()<CR>", "Buffer format(LSP)" },
			d = { ":bdelete<CR>", "Delete Buffer" },
		},
		w = {
			name = "Window",
			j = { "<C-w>j", "Jump down" },
			k = { "<C-w>k", "Jump up" },
			h = { "<C-w>h", "Jump to left" },
			l = { "<C-w>l", "Jump to right" },
		},
		d = {
			name = "Debugging",
			u = { "<cmd>DapUIToggle<CR>", "Toggle UI for Debugging" },
			c = { "<cmd>DapContinue<CR>", "Start Debugging" },
			t = { "<cmd>DapTerminate<CR>", "Stop Debugging" },
			i = { "<cmd>DapStepInto<CR>", "Step Into" },
			o = { "<cmd>DapStepOuto<CR>", "Step Out" },
			b = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
			v = { "<cmd>DapStepOver<CR>", "Step Over" },
		},
		l = {
			name = "LSP",
			d = { ":lua vim.lsp.buf.definition()<CR>", "Definition" },
			D = { ":lua vim.lsp.buf.declaration()<CR>", "Declaration" },
			h = { ":lua vim.lsp.buf.hover()<CR>", "Hover" },
			i = { ":lua vim.lsp.buf.implementation()<CR>", "Implementation" },
			s = { ":lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
			w = {
				name = "Workspace Folder",
				a = { ":lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace" },
				d = { ":lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace" }
			},
			t = { ":lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
			n = { ":lua vim.lsp.buf.rename()<CR>", "Buffer rename" },
			c = { ":lua vim.lsp.buf.code_action()<CR>", "Code action" },
			r = { ":lua vim.lsp.buf.references()<CR>", "References" },
			g = {
				name = "Go to",
				n = { ":lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
				p = { ":lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic" },
				f = { ":lua vim.diagnostic.open_float()<CR>", "Open float" },
				l = { ":lua vim.diagnostic.setloclist()<CR>", "Loclist" },
			},
			e = { ":TroubleToggle<CR>", "Errorlist" },
		},
		m = {
			name = "Miscellaneous",
			f = { ":NvimTreeToggle()<CR>", "Treelike File Explorer" },
			t = { ":ToggleTerm()<CR>", "ToggleTerm" },
		},
		t = {
			name = "Telescope",
			b = { ":Telescope buffers<CR>", "List Buffers"},
			f = { ":Telescope find_files<CR>", "Find Files"},
		}
	},
})
