--[[ obsidian.lua

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
	"obsidian-nvim/obsidian.nvim",
	version = "v.3.11.0",

	-- ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = { "Obsidian" },
	opts = {
		completion = {
			nvim_cmp = false,
			blink = true,
			min_chars = 2,
		},
		picker = {
			name = "snacks.pick",
		},
		workspaces = {
			{
				name = "personal",
				path = "~/Obsidian/Maghz",
			},
		},

		preferred_link_style = "markdown",
		---@param title string|?
		---@return string
		note_id_func = function(title)
			local timestamp = tostring(os.time())
			local suffix = ""

			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end

			return timestamp .. "_" .. suffix
		end,

		---@param spec { id: string, dir: obsidian.Path, title: string|? }
		---@return string|obsidian.Path The full path to the new note.
		note_path_func = function(spec)
			local cleaned_id = spec.id:match("^[^_]+_(.+)$") or spec.id
			local path = spec.dir / cleaned_id
			return path:with_suffix(".md")
		end,
	},
}

--[[ obsidian.lua ends here. ]]
