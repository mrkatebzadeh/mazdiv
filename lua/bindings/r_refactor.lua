R_REFACTOR = {}

R_REFACTOR.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{ "<leader>r", group = "Refactor", nowait = true, remap = false },
			{
				"<leader>rB",
				"<CMD>Refactor extract_block_to_file<CR>",
				desc = "Extract Block to File",
				nowait = true,
				remap = false,
			},
			{
				"<leader>rI",
				"<CMD>Refactor inline_func<CR>",
				desc = "Inline Function",
				nowait = true,
				remap = false,
			},
			{
				"<leader>rb",
				"<CMD>Refactor extract_block<CR>",
				desc = "Extract Block",
				nowait = true,
				remap = false,
			},
			{
				"<leader>re",
				"<CMD>Refactor extract ",
				desc = "Extract",
				nowait = true,
				remap = false,
			},
			{
				"<leader>rf",
				"<CMD>Refactor extract_to_file ",
				desc = "Extract to File",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ri",
				"<CMD>Refactor inline_var<CR>",
				desc = "Inline Variable",
				nowait = true,
				remap = false,
			},
			{
				"<leader>rv",
				"<CMD>Refactor extract_var ",
				desc = "Extract Variable",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return R_REFACTOR
