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
	{ import = "plugins.code.cmp" },
	{ import = "plugins.code.debug" },
	{ import = "plugins.code.filehead" },
	{ import = "plugins.code.godbolt" },
	{ import = "plugins.code.lsp" },
	{ import = "plugins.code.mason" },
	{ import = "plugins.code.neogen" },
	{ import = "plugins.code.neotest" },
	{ import = "plugins.code.nonels" },
	{ import = "plugins.code.refactor" },
	{ import = "plugins.code.snippets" },
	{ import = "plugins.code.tasks" },
}

--[[ init.lua ends here. ]]
