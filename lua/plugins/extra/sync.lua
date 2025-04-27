return {
	"mrkatebzadeh/sync.nvim",
	config = function()
		require("sync").setup({
			auto_start = false,
		})
	end,
}
