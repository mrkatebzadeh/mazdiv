--[[ markdown.lua

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
		opts = {
			ensure_installed = {
				"markdown",
				"markdown_inline",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {

				marksman = {
					mason = true,
				},
			},
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			indent = {
				exclude_filetypes = { "markdown" },
			},
		},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		event = "VeryLazy",
		opts = {
			file_types = { "markdown" },
			change_events = { "DiagnosticChanged" },
			latex = {
				enabled = false,
			},
			heading = {
				sign = false,
				icons = { "󰼏  ", "󰎨  ", "󰼑  ", "󰎲  ", "󰼓  ", "󰎴  " },
			},
			code = {
				sign = false,
				left_margin = 0,
				left_pad = 0,
				right_pad = 0,
			},
			link = {
				wiki = {
					body = function(ctx)
						if ctx.alias then
							return ctx.alias
						end
						local diagnostics = vim.diagnostic.get(ctx.buf, {
							lnum = ctx.row,
							severity = vim.diagnostic.severity.HINT,
						})
						for _, diagnostic in ipairs(diagnostics) do
							if diagnostic.source == "zk" then
								return diagnostic.message
							end
						end
						return nil
					end,
				},
			},
			overrides = {
				buftype = {
					nofile = {
						enabled = false,
					},
				},
			},
		},
	},
	{
		"saghen/blink.cmp",
		opts = {
			sources = {
				providers = {
					markdown = {
						name = "RenderMarkdown",
						module = "render-markdown.integ.blink",
					},
				},
			},
		},
	},
}
--[[ markdown.lua ends here. ]]
