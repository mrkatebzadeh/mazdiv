function EditFromCurrentBufferDir()
	local current_dir = vim.fn.expand("%:p:h")
	vim.api.nvim_feedkeys(":edit " .. current_dir .. "/", "n", false)
end

vim.api.nvim_create_user_command("EditBufferDir", EditFromCurrentBufferDir, {})

function EditNvimConfig()
	vim.cmd(":Neotree reveal ~/.config/nvim")
end

vim.api.nvim_create_user_command("EditNvimConfig", EditNvimConfig, {})

-- Check if a buffer is a real, listed buffer
local function is_real_buffer(bufnr)
	return vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, "buflisted")
end

-- Open a scratch buffer
local function open_scratch_buffer()
	vim.cmd("enew")
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "hide"
	vim.bo.swapfile = false
	vim.bo.buflisted = false
	vim.bo.filetype = "scratch"
	vim.api.nvim_buf_set_lines(0, 0, -1, false, { "-- Scratch buffer --" })
end

-- Close buffer and check for scratch
local function close_buffer_or_scratch()
	local bufs = vim.tbl_filter(is_real_buffer, vim.api.nvim_list_bufs())

	if #bufs <= 1 then
		vim.cmd("bd")
		vim.defer_fn(function()
			open_scratch_buffer()
		end, 50)
	else
		vim.cmd("bp | bd #")
	end
end

-- Create a user command :CloseBuffer
vim.api.nvim_create_user_command("CloseBuffer", close_buffer_or_scratch, {})
