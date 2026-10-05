return {
	"akinsho/toggleterm.nvim",
	config = function()
		local term = require("toggleterm")
		local Terminal = require("toggleterm.terminal").Terminal
		local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float", float_opts = { border = "rounded"} })

		function _HTOP_TOGGLE()
			htop:toggle()
		end

		local python = Terminal:new({ cmd = "python3", hidden = true, direction = "float", float_opts = {border = "rounded"} })

		function _PYTHON_TOGGLE()
			python:toggle()
		end

		term.setup({
			active = true,
			on_config_done = nil,

			size = 20,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = false,

			direction = "vertical",
			close_on_exit = true,
			shell = nil,

			float_opts = {

				border = "curved",

				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},

			execs = {},
		})
	end,
}
