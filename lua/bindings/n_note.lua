N_NOTE = {}

N_NOTE.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{
				"<leader>n",
				group = "Note",
				nowait = true,
				remap = false,
			},
			{
				"<leader>nc",
				"<CMD>Neorg toggle-concealer<CR>",
				desc = "Toggle",
				nowait = true,
				remap = false,
			},
			{
				"<leader>nf",
				"<CMD>Neorg roam node<CR>",
				desc = "Roam",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ng",
				"<CMD>Neorg keybind all core.looking-glass.magnify-code-block<CR>",
				desc = "Glass",
				nowait = true,
				remap = false,
			},
			{
				"<leader>nh",
				"<CMD>Neorg workspace home<CR>",
				desc = "Home",
				nowait = true,
				remap = false,
			},
			{
				"<leader>nq",
				"<CMD>Neorg return<CR>",
				desc = "Quit/Return",
				nowait = true,
				remap = false,
			},
			{
				"<leader>nr",
				"<CMD>Neorg workspace research<CR>",
				desc = "Research",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ns",
				"<CMD>Neorg roam select_workspace<CR>",
				desc = "Roam Workspace",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return N_NOTE
