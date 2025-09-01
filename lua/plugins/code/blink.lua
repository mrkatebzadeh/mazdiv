--[[ blink.lua

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
	"saghen/blink.cmp",
	version = "1.6.0",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Kaiser-Yang/blink-cmp-avante",
		{
			"saghen/blink.compat",
			optional = true,
			opts = {},
			version = not vim.g.lazyvim_blink_main and "*",
		},
	},
	event = "InsertEnter",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts_extend = {
		"sources.completion.enabled_providers",
		"sources.compat",
		"sources.default",
	},
	opts = {
		signature = { enabled = true },
		list = { selection = { preselect = false, auto_insert = false } },
		keymap = {
			["<Tab>"] = {
				"select_next",
				"fallback",
			},
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		sources = {
			default = { "avante", "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					opts = {},
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},
}
--[[ blink.lua ends here. ]]
