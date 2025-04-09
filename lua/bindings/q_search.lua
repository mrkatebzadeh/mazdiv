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
				"<CMD>Telescope commands<CR>",
				desc = "Commands",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?M",
				"<CMD>Telescope man_pages<CR>",
				desc = "Man Pages",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?R",
				"<CMD>Telescope registers<CR>",
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
				"<CMD>Telescope colorscheme<CR>",
				desc = "Colorscheme",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?f",
				"<CMD>lua require('spectre').open_file_search()<CR>",
				desc = "Replace Buffer",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?h",
				"<CMD>Telescope help_tags<CR>",
				desc = "Find Help",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?k",
				"<CMD>Telescope keymaps<CR>",
				desc = "Keymaps",
				nowait = true,
				remap = false,
			},
			{
				"<leader>?r",
				"<CMD>lua require('spectre').open()<CR>",
				desc = "Replace",
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
			{
				"<leader>?w",
				"<CMD>lua require('spectre').open_visual({select_word=true})<CR>",
				desc = "Replace Word",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return Q_SEARCH
