--[[ init.lua

Author: M.R. Siavash Katebzadeh <mr@katebzadeh.xyz>
Keywords: Lua, Neovim
Version: 0.0.1

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

return {
	{ import = "plugins.editor.autopairs" },
	{ import = "plugins.editor.barbecue" },
	{ import = "plugins.editor.bqf" },
	{ import = "plugins.editor.bufferline" },
	{ import = "plugins.editor.comments" },
	{ import = "plugins.editor.devicons" },
	{ import = "plugins.editor.harpoon" },
	{ import = "plugins.editor.hop" },
	{ import = "plugins.editor.hover" },
	{ import = "plugins.editor.illuminate" },
	{ import = "plugins.editor.indent_highlight" },
	{ import = "plugins.editor.lastplace" },
	{ import = "plugins.editor.leap" },
	{ import = "plugins.editor.lualine" },
	{ import = "plugins.editor.numbers" },
	{ import = "plugins.editor.rainbow" },
	{ import = "plugins.editor.spectre" },
	{ import = "plugins.editor.treesitter" },
	{ import = "plugins.editor.trouble" },
	{ import = "plugins.editor.undo" },
	{ import = "plugins.editor.whichkey" },
	{ import = "plugins.editor.yanky" },
	{ import = "plugins.editor.zen" },

	{
		"cappyzawa/trim.nvim",
		opts = {},
	},
	{
		"hedyhli/outline.nvim",
		config = function()
			require("outline").setup({})
		end,
	},
	{
		-- The fastest Neovim colorizer.
		"norcalli/nvim-colorizer.lua",
	},
	{
		"chentoast/marks.nvim",
		commit = "74e8d01",
		config = function()
			require("marks").setup({})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "3.1.0",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}

--[[ init.lua ends here. ]]
