S_TERMINAL = {}

S_TERMINAL.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{
				"<leader>s",
				group = "Terminal",
				nowait = true,
				remap = false,
			},
			{
				"<leader>sf",
				"<CMD>ToggleTerm direction=float<CR>",
				desc = "Float Terminal",
				nowait = true,
				remap = false,
			},
			{
				"<leader>sh",
				"<CMD>lua _HTOP_TOGGLE()<CR>",
				desc = "Htop",
				nowait = true,
				remap = false,
			},
			{
				"<leader>sp",
				"<CMD>lua _PYTHON_TOGGLE()<CR>",
				desc = "Python",
				nowait = true,
				remap = false,
			},
			{
				"<leader>st",
				"<CMD>ToggleTerm size=10 direction=horizontal<CR>",
				desc = "Horizontal Terminal",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return S_TERMINAL
