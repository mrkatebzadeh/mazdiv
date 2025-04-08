return {
	"mrkatebzadeh/sync.nvim",
	dir = "~/projects/sync.nvim", -- Local path
	name = "sync",
	config = function()
		require("sync").setup({
			auto_start = false,
		})
	end,
}
