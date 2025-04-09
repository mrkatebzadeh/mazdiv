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
				'<CMD>:lua vim.diagnostic.open_float({"line "})<CR>',
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
				"<CMD>Telescope lsp_dynamic_workspace_symbols<CR>",
				desc = "Workspace Symbols",
				nowait = true,
				remap = false,
			},
			{
				"<leader>la",
				"<CMD>lua vim.lsp.buf.code_action()<CR>",
				desc = "Code Action",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lb",
				"<CMD>lua require('telescope.builtin').diagnostics({bufnr=0,layout_strategy='vertical',layout_config={width=0.9, height=0.95, preview_cutoff = 0}})<CR>",
				desc = "Buffer Diagnostics",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lc",
				"<CMD>lua vim.lsp.codelens.refresh()<CR>",
				desc = "Codelens Refresh",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ld",
				"<CMD>Telescope diagnostics bufnr=0<CR>",
				desc = "Document Diagnostics",
				nowait = true,
				remap = false,
			},
			{
				"<leader>le",
				"<CMD>lua require('telescope').extensions.notify.notify({bufnr=0,layout_strategy='vertical',layout_config={width=0.9, height=0.95, preview_cutoff = 0},wrap_results=true,})<CR>",
				desc = "Notofication History",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lf",
				"<CMD>lua vim.lsp.buf.format{async=true}<CR>",
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
				"<CMD>lua vim.lsp.diagnostic.goto_next()<CR>",
				desc = "Next Diagnostic",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lk",
				"<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>",
				desc = "Prev Diagnostic",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ll",
				"<CMD>lua vim.lsp.codelens.run()<CR>",
				desc = "CodeLens Action",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lq",
				"<CMD>lua vim.diagnostic.setloclist()<CR>",
				desc = "Quickfix",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lr",
				"<CMD>lua vim.lsp.buf.rename()<CR>",
				desc = "Rename",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ls",
				"<CMD>Telescope lsp_document_symbols<CR>",
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
				"<CMD>Telescope diagnostics<CR>",
				desc = "Workspace Diagnostics",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return L_LSP
