--[[ L_leetcode.lua

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

L_LEETCODE = {}

L_LEETCODE.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{

			mode = { "v", "n" },
			{ "<leader>L", group = "Leetcode", nowait = true, remap = false },
			{
				"<leader>gR",
				"<CMD>lua require 'gitsigns'.reset_buffer()<CR>",
				desc = "Reset Buffer",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Lc",
				"<CMD>Leet console<CR>",
				desc = "Console",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Lr",
				"<CMD>Leet<CR>",
				desc = "Run",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Lt",
				"<CMD>Leet run<CR>",
				desc = "Test",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Li",
				"<CMD>Leet info<CR>",
				desc = "Info",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Lo",
				"<CMD>Leet open<CR>",
				desc = "Open",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Lm",
				"<CMD>Leet menu<CR>",
				desc = "Menu",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Ls",
				"<CMD>Leet submit<CR>",
				desc = "Submit",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Ll",
				"<CMD>Leet list<CR>",
				desc = "List",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return L_LEETCODE
--[[ L_leetcode.lua ends here. ]]
