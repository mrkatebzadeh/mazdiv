G_GIT = {}

G_GIT.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{
				"<leader>g",
				group = "Git",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gR",
				"<CMD>lua require 'gitsigns'.reset_buffer()<CR>",
				desc = "Reset Buffer",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gS",
				"<CMD>lua require 'gitsigns'.stage_hunk()<CR>",
				desc = "Stage Hunk",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Checkout Branch",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Log",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gd",
				"<CMD>Gitsigns diffthis HEAD<CR>",
				desc = "Diff",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gj",
				"<CMD>lua require 'gitsigns'.next_hunk()<CR>",
				desc = "Next Hunk",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gk",
				"<CMD>lua require 'gitsigns'.prev_hunk()<CR>",
				desc = "Prev Hunk",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gB",
				function()
					Snacks.git.blame_line()
				end,
				desc = "Blame",
				nowait = true,
				remap = false,
			},
			{
				"<leader>go",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Open Changed File",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gp",
				"<CMD>lua require 'gitsigns'.preview_hunk()<CR>",
				desc = "Preview Hunk",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gr",
				"<CMD>lua require 'gitsigns'.reset_hunk()<CR>",
				desc = "Reset Hunk",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gs",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gu",
				"<CMD>lua require 'gitsigns'.undo_stage_hunk()<CR>",
				desc = "Undo Stage Hunk",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return G_GIT
