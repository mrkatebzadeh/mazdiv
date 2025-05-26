--[[ python.lua

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
		"neovim/nvim-lspconfig",
		opts = {
			servers = {

				ruff = {
					mason = true,
				},
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ensure_installed = { "pylint" },
				},
			},
		},
		opts = {
			linters_by_ft = {
				python = { "pylint" },
			},
			linters = {
				pylint = {
					args = {
						"--init-hook",
						venv_path,
						"-f",
						"json",
						"--from-stdin",
						function()
							return vim.api.nvim_buf_get_name(0)
						end,
					},
				},
			},
		},
	},
}

--[[ python.lua ends here. ]]
