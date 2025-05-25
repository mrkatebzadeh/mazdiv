L_LSP = {}

L_LSP.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{
				"<leader>l",
				group = "LSP",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lD",
				function()
					vim.diagnostic.open_float({ "line " })
				end,
				desc = "Show Line diagnostics",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lH",
				vim.lsp.buf.signature_help,
				desc = "Signature Help",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lI",
				"<CMD>LspInstallInfo<CR>",
				desc = "Installer Info",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "Workspace Symbols",
				nowait = true,
				remap = false,
			},
			{
				"<leader>la",
				function()
					vim.lsp.buf.code_action()
				end,
				desc = "Code Action",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lc",
				function()
					vim.lsp.codelens.refresh()
				end,
				desc = "Codelens Refresh",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lb",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "Buffer Diagnostics",
				nowait = true,
				remap = false,
			},
			{
				"<leader>le",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notofication History",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lf",
				function()
					vim.lsp.buf.format({ async = true })
				end,
				desc = "Format",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lh",
				vim.lsp.buf.hover,
				desc = "Help",
				nowait = true,
				remap = false,
			},
			{
				"<leader>li",
				"<CMD>LspInfo<CR>",
				desc = "Info",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lj",
				function()
					vim.lsp.diagnostic.goto_next()
				end,
				desc = "Next Diagnostic",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lk",
				function()
					vim.lsp.diagnostic.goto_prev()
				end,
				desc = "Prev Diagnostic",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ll",
				function()
					vim.lsp.codelens.run()
				end,
				desc = "CodeLens Action",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lq",
				function()
					vim.diagnostic.setloclist()
				end,
				desc = "Quickfix",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lr",
				function()
					vim.lsp.buf.rename()
				end,
				desc = "Rename",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ls",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "Document Symbols",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lt",
				"<CMD>Trouble diagnostics toggle<CR>",
				desc = "Trouble",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lw",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Workspace Diagnostics",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return L_LSP
