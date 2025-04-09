H_GOTO = {}

H_GOTO.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{
				"<leader>h",
				group = "Goto",
				nowait = true,
				remap = false,
			},
			{
				"<leader>hc",
				"<CMD>lua require('goto-preview').close_all_win()<CR>",
				desc = "Close All Windows",
				nowait = true,
				remap = false,
			},
			{
				"<leader>hd",
				"<CMD>lua require('goto-preview').goto_preview_definition()<CR>",
				desc = "Definition",
				nowait = true,
				remap = false,
			},
			{
				"<leader>hi",
				"<CMD>lua require('goto-preview').goto_preview_implementation()<CR>",
				desc = "Implementation",
				nowait = true,
				remap = false,
			},
			{
				"<leader>hl",
				"<CMD>lua require('goto-preview').goto_preview_declaration()<CR>",
				desc = "Declaration",
				nowait = true,
				remap = false,
			},
			{
				"<leader>hr",
				"<CMD>lua require('goto-preview').goto_preview_references()<CR>",
				desc = "References",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ht",
				"<CMD>lua require('goto-preview').goto_preview_type_definition()<CR>",
				desc = "Type Definition",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return H_GOTO
