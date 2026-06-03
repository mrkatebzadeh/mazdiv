local keymap = vim.keymap.set
local s = { silent = true }
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop>")

keymap("n", "j", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true }) -- Move down, but use 'gj' if no count is given
keymap("n", "k", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true }) -- Move up, but use 'gk' if no count is given
keymap("n", "<C-d>", "<C-d>zz") -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz") -- Scroll up and center the cursor
keymap("n", "<Leader>q", "<cmd>q<CR>", s) -- Quit Neovim
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s) -- Open a new tab
keymap("n", "<Leader>ws", "<cmd>split<CR>", s) -- Open a horizontal split
keymap("n", "<Leader>wv", "<cmd>vsplit<CR>", s) -- Split the window vertically
keymap("n", "<Leader>wh", "<C-w>h", s) -- Focus the left window
keymap("n", "<Leader>wl", "<C-w>l", s) -- Focus the right window
keymap("n", "<Leader>wj", "<C-w>j", s) -- Focus the window below
keymap("n", "<Leader>wk", "<C-w>k", s) -- Focus the window above
keymap("n", "<Leader>wd", "<cmd>close<CR>", s) -- Close the current window
keymap("n", "<leader>w<Left>", "<C-w>h", s) -- Focus the left window via arrow key
keymap("n", "<leader>w<Right>", "<C-w>l", s) -- Focus the right window via arrow key
keymap("n", "<leader>w<Down>", "<C-w>j", s) -- Focus the window below via arrow key
keymap("n", "<leader>w<Up>", "<C-w>k", s) -- Focus the window above via arrow key
keymap("n", "<lt>", "<C-W>5>", opts) -- Shrink the current window width
keymap("n", "<gt>", "<C-W>5<", opts) -- Widen the current window width
keymap("n", "<Leader>lf", ":lua vim.lsp.buf.format()<CR>", s) -- Format the current buffer using LSP
keymap("v", "<Leader>p", '"_dP') -- Paste without overwriting the default register
keymap("x", "y", [["+y]], s) -- Yank to the system clipboard in visual mode
keymap("t", "<Esc>", "<C-\\><C-N>") -- Exit terminal mode
-- Change directory to the current file's directory
keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')
keymap("n", "<leader>pu", '<cmd>lua vim.pack.update()<CR>')

keymap("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition
keymap("n", "<Leader>fe", "<cmd>NvimTreeToggle<CR>", s) -- Toggle the file tree
keymap("n", "<Leader>e", "<cmd>NvimTreeFindFile<CR>", s) -- Reveal current file in the tree
keymap("n", "<leader>ff", '<cmd>FzfLua files<CR>')
keymap("n", "<leader>fg", '<cmd>FzfLua live_grep<CR>')
