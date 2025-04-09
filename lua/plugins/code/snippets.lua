--[[ snippets.lua

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

	{
		"L3MON4D3/LuaSnip",

		version = "v2.*",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},

		build = "make install_jsregexp",
	},
	{
		"madskjeldgaard/cheeky-snippets.nvim",
		requires = {
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cheeky = require("cheeky")
			cheeky.setup({
				langs = {
					all = true,
					lua = true,
					cpp = true,
					rust = true,
					asm = true,
					cmake = true,
					markdown = true,
					supercollider = true,
				},
			})
		end,
	},
}

--[[ snippets.lua ends here. ]]
