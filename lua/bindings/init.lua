local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

function my_quit()
	local bufnr = vim.api.nvim_get_current_buf()
	local buf_windows = vim.call("win_findbuf", bufnr)
	local modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })
	if modified and #buf_windows == 1 then
		vim.ui.input({
			prompt = "Unwritten changes. Do you want to quit? (y/n) ",
		}, function(input)
			if input == "y" then
				vim.cmd("qa!")
			end
		end)
	else
		vim.cmd("qa!")
	end
end

local setup = {
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = false,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	preset = "modern",
	icons = {
		breadcrumb = "»",
		separator = "──",
		group = "+",
	},
	mappings = {
		["f"] = { name = "+Files" },
		["w"] = { name = "+Window" },
		["/"] = { name = "+Search" },
		["g"] = { name = "+Git" },
		["l"] = { name = "+LSP" },
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
	show_help = true,
}

local mappings = {
	{
		"<leader>A",
		":Alpha<CR>",
		desc = "Alpha",
		nowait = true,
		remap = false,
	},
	{
		"<leader>H",
		"<CMD>nohlsearch<CR>",
		desc = "No Highlight",
		nowait = true,
		remap = false,
	},
	{
		"<leader>p",
		"<CMD>lua require('telescope').extensions.projects.projects()<CR>",
		desc = "Projects",
		nowait = true,
		remap = false,
	},
	{
		"<leader>q",
		"<CMD>lua my_quit()<CR>",
		desc = "Quit",
		nowait = true,
		remap = false,
	},
	{
		"<leader>x",
		"<CMD>Telescope commands<CR>",
		desc = "M-x",
		nowait = true,
		remap = false,
	},
}

which_key.setup(setup)
which_key.add(mappings)

require("bindings.C_chatgpt").setup()
require("bindings.S_session").setup()
require("bindings.s_terminal").setup()
require("bindings.a_assembly").setup()
require("bindings.b_buffers").setup()
require("bindings.comment").setup()
-- require("bindings.c_contest").setup()
require("bindings.c_config").setup()
require("bindings.d_debug").setup()
require("bindings.f_files").setup()
require("bindings.g_git").setup()
require("bindings.h_goto").setup()
require("bindings.j_generate").setup()
require("bindings.l_lsp").setup()
require("bindings.n_note").setup()
require("bindings.t_toggles").setup()
require("bindings.r_refactor").setup()
require("bindings.q_search").setup()
require("bindings.o_org").setup()
require("bindings.t_test").setup()
require("bindings.w_window").setup()
