--[[ treesitter.lua

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
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"dockerfile",
				"html",
				"lua",
				"markdown",
				"python",
				"rust",
				"toml",
				"vim",
			},
		},
		config = function(_, opts)
			-- Work around broken nu highlight queries shipped by LhKipp/nvim-nu.
			-- Neovim reports: "Invalid node type \"register\"".
			-- nvim-nu overrides the runtime query; force nvim-treesitter's query instead.
			do
				local files = vim.api.nvim_get_runtime_file("queries/nu/highlights.scm", true)
				local ts_file
				for _, f in ipairs(files) do
					if f:find("/nvim%-treesitter/") then
						ts_file = f
					end
				end

				if ts_file then
					local ok_read, lines = pcall(vim.fn.readfile, ts_file)
					if ok_read and type(lines) == "table" then
						vim.treesitter.query.set("nu", "highlights", table.concat(lines, "\n"))
					end
				end
			end

			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},
}
--[[ treesitter.lua ends here. ]]
