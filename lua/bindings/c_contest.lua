C_CONTEST = {}

C_CONTEST.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}

	local mappings = {
		c = {
			name = "Contest",
			r = { "<CMD>CphReceive<CR>", "Receive" },
			t = { "<CMD>CphTest<CR>", "Run Test" },
			e = { "<CMD>CphEdit<CR>", "Edit Test" },
			s = { "<CMD>CphStop<CR>", "Stop Test" },
		},
	}

	which_key.register(mappings, opts)
end

return C_CONTEST
