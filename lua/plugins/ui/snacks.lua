--[[ snacks.lua

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
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
	},
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				---@type fun(cmd:string, opts:table)|nil
				pick = nil,
				---@type snacks.dashboard.Item[]
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				-- Used by the `header` section
				header = [[
███╗   ███╗ █████╗ ███████╗██████╗ ██╗██╗   ██╗
████╗ ████║██╔══██╗╚══███╔╝██╔══██╗██║██║   ██║
██╔████╔██║███████║  ███╔╝ ██║  ██║██║██║   ██║
██║╚██╔╝██║██╔══██║ ███╔╝  ██║  ██║██║╚██╗ ██╔╝
██║ ╚═╝ ██║██║  ██║███████╗██████╔╝██║ ╚████╔╝..
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═══╝...
]],
			},
		},
		animate = { enabled = true },
		explorer = {
			enabled = true,
		},
		indent = {
			enabled = true,
			animate = {
				enabled = false,
			},
		},
		input = {
			enabled = true,
			icon = " ",
			icon_hl = "SnacksInputIcon",
			icon_pos = "left",
			prompt_pos = "title",
			win = { style = "input" },
			expand = true,
		},
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = { layout = {
						width = 30,
						position = "left",
					} },
					follow_file = true,
					tree = true,
					focus = "list",
					jump = { close = false },
					auto_close = false,
					win = {
						list = {
							keys = {
								["."] = "explorer_focus",
								["<tab>"] = "confirm",
							},
						},
					},
				},
			},
		},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = {
			left = { "mark", "sign" },
			right = { "fold", "git" },
		},
		toggle = { enabled = true },
		words = { enabled = true },
	},
}

--[[ snacks.lua ends here. ]]
