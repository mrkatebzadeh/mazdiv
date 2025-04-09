T_TEST = {}

T_TEST.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{
				"<leader>T",
				group = "Test",
				nowait = true,
				remap = false,
			},
			{
				"<leader>TS",
				"<CMD>lua require('neotest').run.stop()<CR>",
				desc = "Stop",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Tc",
				"<CMD>lua require('neotest').run.run()<CR>",
				desc = "Run Current Test",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Tf",
				"<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
				desc = "Run File",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Tl",
				"<CMD>lua require('neotest').run.run_last()<CR>",
				desc = "Run Last",
				nowait = true,
				remap = false,
			},
			{
				"<leader>To",
				"<CMD>lua require('neotest').output.open({ enter = true, auto_close = true })<CR>",
				desc = "Output",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Ts",
				"<CMD>lua require('neotest').summary.toggle()<CR>",
				desc = "Summary",
				nowait = true,
				remap = false,
			},
			{
				"<leader>Tt",
				"<CMD>lua require('neotest').output_panel.toggle()<CR>",
				desc = "Toggle",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return T_TEST
