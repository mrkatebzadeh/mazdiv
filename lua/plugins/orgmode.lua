return {
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		config = function()
			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/Dropbox/org/agenda/**/*",
				org_default_notes_file = "~/Dropbox/org/agenda/notes.org",
			})

			-- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
			-- add ~org~ to ignore_install
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				ignore_install = { "org" },
			})
		end,
	},
	{
		"akinsho/org-bullets.nvim",
		config = function()
			require("org-bullets").setup({
				concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
				symbols = {
					list = "•",
					headlines = { "◉", "○", "✸", "✿" },
					checkboxes = {
						half = { "", "@org.checkbox.halfchecked" },
						done = { "✓", "@org.keyword.done" },
						todo = { "˟", "@org.keyword.todo" },
					},
				},
			})
		end,
	},
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
	},
	{
		"michaelb/sniprun",
		branch = "master",

		build = "sh install.sh",

		config = function()
			require("sniprun").setup({
				selected_interpreters = { "Python3_jupyter" },
			})
		end,
	},
	{
		"chipsenkbeil/org-roam.nvim",
		tag = "0.1.0",
		dependencies = {
			{
				"nvim-orgmode/orgmode",
				tag = "0.3.4",
			},
		},
		config = function()
			require("org-roam").setup({
				directory = "~/Dropbox/org/roam",
				database = {
					path = "~/Dropbox/org/roam/org-roam.db",
				},
			})
		end,
	},
}
