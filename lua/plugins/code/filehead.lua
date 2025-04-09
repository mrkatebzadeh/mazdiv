return {
	{
		"motosir/skel-nvim",
		config = function()
			require("skel-nvim").setup({
				mappings = {
					["*.cpp"] = "cpp.skel",
					["*.c"] = "c.skel",
					["*.h"] = "h.skel",
					["*.rs"] = "rs.skel",
					["*.lua"] = "lua.skel",
					["LICENSE"] = { "license.mit.skel", "license.gpl.skel" },
				},
			})
		end,
	},
	{
		"drmikehenry/vim-headerguard",
	},
}
