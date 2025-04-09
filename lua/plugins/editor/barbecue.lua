return {
	-- Visual Studio Code inspired breadcrumbs plugin for the Neovim editor
	"utilyre/barbecue.nvim",
	version = "v1.*",
	lazy = true,
	opts = {
		show_modified = true,
		symbols = {
			modified = "󰽃",
		},
	},
	event = "BufReadPre",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	config = true,
}
