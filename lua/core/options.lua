vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nofoldenable")
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
  augroup END
]])

vim.o.number = true
vim.o.relativenumber = true

vim.opt.clipboard = "unnamedplus"

-- Normal mode
vim.keymap.set("n", "yy", '"+yy')
vim.keymap.set("n", "dd", '"+dd')
vim.keymap.set("n", "p", '"+p')
vim.keymap.set("n", "P", '"+P')

-- Visual mode
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("v", "d", '"+d')
vim.keymap.set("v", "p", '"+p')

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.wo.number = true

vim.cmd([[ autocmd BufRead,BufNewFile *.mpp set filetype=mpp ]])
