COMMENT = {}

COMMENT.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		mode = { "v", "n" },
		{
			"<leader>/",
			function()
				vim.cmd.norm("gcc")
			end,
			desc = "Comment",
			nowait = true,
			remap = false,
		},
	}
	which_key.add(mappings)
end

return COMMENT
