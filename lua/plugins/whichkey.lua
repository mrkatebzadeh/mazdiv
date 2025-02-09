return {
	"echasnovski/mini.icons",
	"folke/which-key.nvim",
	event = "VeryLazy",
	tag = "v3.16.0",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 50
	end,
	opts = {},
}
