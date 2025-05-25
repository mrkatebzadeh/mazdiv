B_BUFFERS = {}

B_BUFFERS.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	function toggle_qf()
		local qf_exists = false
		for _, win in pairs(vim.fn.getwininfo()) do
			if win["quickfix"] == 1 then
				qf_exists = true
			end
		end
		if qf_exists == true then
			vim.cmd("cclose")
			return
		end
		if not vim.tbl_isempty(vim.fn.getqflist()) then
			vim.cmd("copen")
		end
	end

	local mappings = {
		{
			mode = { "v", "n" },
			{
				"<leader>b",
				group = "Buffers",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "List Buffers",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bd",
				"<CMD>CloseBuffer<CR>",
				desc = "Close Buffer",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bo",
				'<CMD>%bdelete|edit #|normal`"<CR>',
				desc = "Delete Others",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bt",
				function()
					toggle_qf()
				end,
				desc = "Toggle Quickfix",
				nowait = true,
				remap = false,
			},
		},
	}

	which_key.add(mappings)
end

return B_BUFFERS
