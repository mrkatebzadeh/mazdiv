--[[ mason.lua

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

		"mason-org/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"selene",
				"shellcheck",
				"shfmt",
				"codespell",
				"ruff",
				"marksman",
				"rnix-lsp",
				"nixpkgs-fmt",
				"rust-analyzer",
				"shellcheck",
			},
		},
		config = function(_, opts)
			local notify = vim.notify
			require("mason").setup(opts)
			local mr = require("mason-registry")
			mr:on("package:install:success", function()
				notify("Mason: Successfully installed " .. pkg.name, vim.log.levels.INFO)
			end)

			mr.refresh(function()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						notify("Mason: Installing " .. tool .. "...", vim.log.levels.INFO)

						p:install()
					end
				end
			end)
		end,
	},
}

--[[ mason.lua ends here. ]]
