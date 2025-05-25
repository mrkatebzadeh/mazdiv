return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
    enabled = false,
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
    enabled = false,
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
