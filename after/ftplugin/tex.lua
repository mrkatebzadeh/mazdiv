local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	{ "<leader>k", group = "Latex", nowait = true, remap = false },
	{ "<leader>kc", "<cmd>VimtexCompile<cr>", desc = "Toggle Compilation Mode", nowait = true, remap = false },
	{ "<leader>ki", "<cmd>VimtexInfo<cr>", desc = "Project Information", nowait = true, remap = false },
	{ "<leader>ks", "<cmd>VimtexStop<cr>", desc = "Stop Project Compilation", nowait = true, remap = false },
	{ "<leader>kt", "<cmd>VimtexTocToggle<cr>", desc = "Toggle Table Of Content", nowait = true, remap = false },
	{ "<leader>kv", "<cmd>VimtexView<cr>", desc = "View PDF", nowait = true, remap = false },
}

which_key.add(mappings)
