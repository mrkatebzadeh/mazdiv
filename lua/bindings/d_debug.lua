D_DEBUG = {}

D_DEBUG.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{ "<leader>d", group = "Debug", nowait = true, remap = false },
			{ "<leader>db", "<CMD>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint", nowait = true, remap = false },
			{ "<leader>dc", "<CMD>DapContinue<CR>", desc = "Continue", nowait = true, remap = false },
			{ "<leader>di", "<CMD>DapStepInto<CR>", desc = "Step Into", nowait = true, remap = false },
			{ "<leader>do", "<CMD>DapStepOver<CR>", desc = "Step Over", nowait = true, remap = false },
			{ "<leader>dq", "<CMD>DapTerminate<CR>", desc = "Terminate", nowait = true, remap = false },
			{ "<leader>du", "<CMD>DapStepOut<CR>", desc = "Step Out", nowait = true, remap = false },
		},
	}

	which_key.add(mappings)
end

return D_DEBUG
