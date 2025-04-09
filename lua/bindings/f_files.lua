F_FILES = {}

F_FILES.setup = function()
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
		{
			mode = { "v", "n" },
			{ "<leader>f", group = "Files", nowait = true, remap = false },
			{
				"<leader>fE",
				":SudoEdit ",
				desc = "SudoEdit",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fF",
				"<CMD>EditBufferDir<CR>",
				desc = "Find File",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fN",
				"<CMD>Telescope file_browser <CR>",
				desc = "File Browser",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fW",
				":SudoWrite<CR>",
				desc = "SudoWrite",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fb",
				"<CMD>Neotree buffers reveal float<CR>",
				desc = "Buffers",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fc",
				":Chmod ",
				desc = "Chmod",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fd",
				":Delete<CR>",
				desc = "Delete",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fe",
				"<CMD>Neotree toggle filesystem<CR>",
				desc = "NeoTree",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fn",
				"<CMD>FindFilesCwd<CR>",
				desc = "File Browser",
				nowait = true,
				remap = false,
			},

			{
				"<leader>fg",
				"<CMD>Telescope live_grep theme=ivy<CR>",
				desc = "Find Text",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fh",
				"<CMD>Telescope help_tags theme=ivy<CR>",
				desc = "Help Tags",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fk",
				"<CMD>Mkdir ",
				desc = "Mkdir",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fm",
				"<CMD>Move ",
				desc = "Move",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ff",
				"<CMD>Telescope find_files<CR>",
				desc = "Find File Fuzzy",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fo",
				"<CMD>Telescope oldfiles theme=ivy<CR>",
				desc = "Old Files",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fr",
				":Rename ",
				desc = "Rename",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fw",
				":cmd>w!<CR>",
				desc = "Save",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return F_FILES
