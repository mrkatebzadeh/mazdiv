Q_SEARCH = {}

Q_SEARCH.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{
				"<leader>?",
				group = "Search",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?C",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?M",
				function()
					Snacks.picker.man()
				end,
				desc = "Man Pages",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?R",
				function()
					Snacks.picker.registers()
				end,
				desc = "Registers",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?S",
				"<Plug>(leap-backward)",
				desc = "Search Backward Leap",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?c",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "Colorscheme",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?f",
				function()
					require("spectre").open_file_search()
				end,
				desc = "Replace Buffer",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?h",
				function()
					Snacks.picker.help()
				end,
				desc = "Find Help",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?k",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?s",
				"<Plug>(leap-forward)",
				desc = "Search Forward Leap",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return Q_SEARCH
