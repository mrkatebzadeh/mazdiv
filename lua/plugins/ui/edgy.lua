return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	version = "1.10.2",
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"
	end,
	opts = {
		animate = {
			enabled = false,
		},
		bottom = {
			{
				ft = "neotest-output-panel",
				title = "NeoTest",
				size = { height = 0.4 },
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
			{
				ft = "toggleterm",
				title = "LazyTerm",
				size = { height = 0.4 },
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
			{
				ft = "lazyterm",
				title = "LazyTerm",
				size = { height = 0.4 },
				filter = function(buf)
					return not vim.b[buf].lazyterm_cmd
				end,
			},
			"Trouble",
			{
				ft = "qf",
				title = "QuickFix",
			},
			"trouble",
			{
				ft = "qf",
				title = "QuickFix",
			},
			{
				ft = "help",
				title = "Help",
				size = { height = 40 },
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{
				ft = "spectre_panel",
				size = { height = 0.4 },
			},
		},
		left = {
			{
				title = "Files",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "filesystem"
				end,
				pinned = true,
				size = { height = 0.5 },
			},
		},
		right = {
			{
				ft = "Outline",
				pinned = true,
				open = "Outline",
			},
			{
				ft = "neotest-summary",
				pinned = true,
				open = "Neotest summary",
			},
		},
	},
}
