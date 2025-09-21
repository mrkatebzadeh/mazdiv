return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = function()
			require("neogit").setup({
				disable_insert_on_commit = false,
				graph_style = "unicode",
				process_spinner = true,
				kind = "vsplit",
				signs = {
					section = { "", "" },
					item = { "", "" },
					hunk = { "", "" },
				},
				integrations = { diffview = true, snacks = true },
			})
		end,
	},
}
