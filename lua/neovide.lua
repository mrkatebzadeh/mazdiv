vim.g.neovide_padding_top = 15
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 10
vim.g.neovide_padding_left = 10

vim.g.neovide_transparency = 0.8
vim.g.neovide_window_blurred = true
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

local default_path = vim.fn.expand("~")
vim.api.nvim_set_current_dir(default_path)
vim.o.guifont = "FiraCode Nerd Font Propo:h12"
