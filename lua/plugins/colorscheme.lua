return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				transparent_background = false,
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
				color_overrides = {
					frappe = {
						rosewater = "#d4c4b4",
						flamingo = "#6b757f",
						pink = "#7c9f85",
						mauve = "#c4865e",
						red = "#c67f79",
						maroon = "#9b7575",
						peach = "#c5a47b",
						yellow = "#c3c0a2",
						green = "#359b75",
						teal = "#5e8a83",
						sky = "#5c6d7a",
						sapphire = "#51797a",
						blue = "#c69f99",
						lavender = "#7c9dab",
						text = "#cee2cd",
						subtext1 = "#c1c7c6",
						subtext0 = "#b1b8b7",
						overlay2 = "#777d7e",
						overlay1 = "#484e4f",
						overlay0 = "#767676",
						surface2 = "#3b4242",
						surface1 = "#454e4e",
						surface0 = "#292f2f",
						base = "#23282b",
						mantle = "#1d2124",
						crust = "#17191b",
					},
				},
			})

			vim.o.termguicolors = true
			vim.o.background = "dark"
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
