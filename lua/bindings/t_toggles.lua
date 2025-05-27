T_TOGGLES = {}

T_TOGGLES.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end
	function toggle_hints()
		if vim.g.diagnostics_active then
			vim.diagnostic.config({ virtual_text = false })
		else
			vim.diagnostic.config({ virtual_text = true })
		end
	end

	local satelliteEnabled = true

	function SatelliteToggle()
		if satelliteEnabled then
			vim.api.nvim_command("SatelliteDisable")
			satelliteEnabled = false
		else
			vim.api.nvim_command("SatelliteEnable")
			vim.api.nvim_command("SatelliteRefresh")
			satelliteEnabled = true
		end
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{
				"<leader>t",
				group = "toggles",
				nowait = true,
				remap = false,
			},
			{
				"<leader>tT",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = " Theme Picker",
				nowait = true,
				remap = false,
			},
			{
				"<leader>tb",
				"<CMD>lua require('edgy').toggle()<CR>",
				desc = "Toggle Bars",
				nowait = true,
				remap = false,
			},
			{
				"<leader>tc",
				"<CMD>ColorizerToggle<CR>",
				desc = "Toggle Colorizer",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ti",
				function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
				end,
				desc = "Indent Hints",
				nowait = true,
				remap = false,
			},
			{
				"<leader>to",
				"<CMD>Outline<CR>",
				desc = "Toggle Outline",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ts",
				"<CMD>lua SatelliteToggle()<CR>",
				desc = "Scrollbar",
				nowait = true,
				remap = false,
			},
			{
				"<leader>tt",
				function()
					Snacks.picker.todo_comments()
				end,
				desc = "TODOs",
				nowait = true,
				remap = false,
			},
			{
				"<leader>tu",
				function()
					Snacks.picker.undo()
				end,
				desc = "Undo",
				nowait = true,
				remap = false,
			},
			{
				"<leader>tw",
				"<CMD>set wrap!<CR>",
				desc = "Soft Wrap Text",
				nowait = true,
				remap = false,
			},
			{
				"<leader>tz",
				"<CMD>ZenMode<CR>",
				desc = "Zend Mode",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return T_TOGGLES
