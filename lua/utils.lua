function EditFromCurrentBufferDir()
	local current_dir = vim.fn.expand("%:p:h")
	vim.api.nvim_feedkeys(":edit " .. current_dir .. "/", "n", false)
end

vim.api.nvim_create_user_command("EditBufferDir", EditFromCurrentBufferDir, {})


function EditNvimConfig()
	vim.cmd(":Neotree reveal ~/.config/nvim")
end

vim.api.nvim_create_user_command("EditNvimConfig", EditNvimConfig, {})
