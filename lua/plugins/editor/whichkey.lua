return {
	"folke/which-key.nvim",
	lazy = false,
	tag = "v3.16.0",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 50
	end,
	opts = {},
}
