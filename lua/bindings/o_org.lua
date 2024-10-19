O_ORG = {}

O_ORG.setup = function()
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
		o = {
			name = "Org",
			r = {
				name = "Roam",
				f = { "<cmd>lua require('org-roam').api.find_node()<cr>", "Find Node" },
				i = { "<cmd>lua require('org-roam').api.insert_node()<cr>", "Find Node" },
			},
		},
	}

	which_key.register(mappings, opts)

	opts = {
		mode = "v",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}

	which_key.register(mappings, opts)
end

return O_ORG
