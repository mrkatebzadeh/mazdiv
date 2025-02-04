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
      { "<leader>t", group = "toggles", nowait = true, remap = false },
      { "<leader>tT", '<cmd>lua require("theme-picker").open_theme_picker()<cr>', desc = " Theme Picker", nowait = true, remap = false },
      { "<leader>tb", "<cmd>lua require('edgy').toggle()<cr>", desc = "Toggle Bars", nowait = true, remap = false },
      { "<leader>tc", "<cmd>ColorizerToggle<CR>", desc = "Toggle Colorizer", nowait = true, remap = false },
      { "<leader>ti", "<cmd>IBLToggle<cr>", desc = "Indent Hints", nowait = true, remap = false },
      { "<leader>to", "<cmd>Outline<CR>", desc = "Toggle Outline", nowait = true, remap = false },
      { "<leader>ts", "<cmd>lua SatelliteToggle()<cr>", desc = "Scrollbar", nowait = true, remap = false },
      { "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "TODOs", nowait = true, remap = false },
      { "<leader>tu", "<cmd>Telescope undo<cr>", desc = "Undo", nowait = true, remap = false },
      { "<leader>tw", "<cmd>set wrap!<CR>", desc = "Soft Wrap Text", nowait = true, remap = false },
      { "<leader>tz", "<cmd>ZenMode<CR>", desc = "Zend Mode", nowait = true, remap = false },
    },
  }

	which_key.add(mappings)

end

return T_TOGGLES
