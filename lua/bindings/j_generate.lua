J_GENERATE = {}

J_GENERATE.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{
			"<leader>j",
			group = "Generate",
			mode = "v",
			nowait = true,
			remap = false,
		},
		{
			"<leader>ja",
			"<CMD>lua require('neogen').generate()<CR>",
			desc = "Annotations",
			mode = "v",
			nowait = true,
			remap = false,
		},
	}

	which_key.add(mappings)
end

return J_GENERATE
