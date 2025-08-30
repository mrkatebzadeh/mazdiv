--[[ neorg.lua

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
		"nvim-neorg/neorg",
		dependencies = {
			{
				"benlubas/neorg-interim-ls",
				version = "v2.1.1",
			},
		},
		lazy = false,
		version = "v9.3.0",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.completion"] = {
						config = { engine = { module_name = "external.lsp-completion" } },
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/Nextcloud/norg/notes",
								research = "~/Nextcloud/norg/research",
							},
							default_workspace = "notes",
						},
					},
					["external.interim-ls"] = {
						config = {
							-- default config shown
							completion_provider = {
								-- Enable or disable the completion provider
								enable = true,

								-- Show file contents as documentation when you complete a file name
								documentation = true,

								-- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
								categories = false,

								-- suggest heading completions from the given file for `{@x|}` where `|` is your cursor
								-- and `x` is an alphanumeric character. `{@name}` expands to `[name]{:$/people:# name}`
								people = {
									enable = false,

									-- path to the file you're like to use with the `{@x` syntax, relative to the
									-- workspace root, without the `.norg` at the end.
									-- ie. `folder/people` results in searching `$/folder/people.norg` for headings.
									-- Note that this will change with your workspace, so it fails silently if the file
									-- doesn't exist
									path = "people",
								},
							},
						},
					},
				},
			})
		end,
	},
}
--[[ neorg.lua ends here. ]]
