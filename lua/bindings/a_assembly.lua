A_ASSEMBLY = {}

A_ASSEMBLY.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{ "<leader>a", group = "Assembly", nowait = true, remap = false },
			{
				"<leader>aa",
				"<CMD>Godbolt<CR>",
				desc = "Godbolt",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ac",
				"<CMD>GodboltCompiler telescope<CR>",
				desc = "Godbolt Custom Compiler",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return A_ASSEMBLY
