--[[ i_insert.lua

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

I_INSERT = {}

I_INSERT.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{ "<leader>i", group = "Insert", nowait = true, remap = false },
		{ "<leader>ie", "<CMD>Emoji<CR>", desc = "Emoji", nowait = true, remap = false },
	}

	which_key.add(mappings)
end

return I_INSERT
--[[ i_insert.lua ends here. ]]
