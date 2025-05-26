--[[ latex.lua

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
		opts = function(_, opts)
			opts.highlight = opts.highlight or {}
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "bibtex" })
			end
			if type(opts.highlight.disable) == "table" then
				vim.list_extend(opts.highlight.disable, { "latex" })
			else
				opts.highlight.disable = { "latex" }
			end
		end,
	},
	{
		"lervag/vimtex",
		lazy = false,
		config = function()
			vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
			vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
		end,
		keys = {
			{ "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ensure_installed = { "texlab" },
				},
			},
		},
		opts = {
			servers = {
				texlab = {
					keys = {
						{ "<Leader>kd", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
					},
				},
			},
		},
	},
}
--[[ latex.lua ends here. ]]
