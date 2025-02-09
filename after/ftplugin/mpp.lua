local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	{ "<leader>k", group = "C/C++", nowait = true, remap = false },
	{ "<leader>kB", ":Task start cmake build_all<Cr>", desc = "Build All", nowait = true, remap = false },
	{ "<leader>kC", ":Task start cmake clean<Cr>", desc = "Clean", nowait = true, remap = false },
	{ "<leader>kb", ":Task start cmake build<Cr>", desc = "Build", nowait = true, remap = false },
	{ "<leader>kc", ":Task start cmake configure<Cr>", desc = "Configure", nowait = true, remap = false },
	{ "<leader>kd", ":Task start cmake debug<Cr>", desc = "Debug", nowait = true, remap = false },
	{ "<leader>kh", "<cmd>HeaderguardAdd<Cr>", desc = "Add Headerguard", nowait = true, remap = false },
	{ "<leader>kp", ":Task set_task_param cmake run ", desc = "Set Parameters", nowait = true, remap = false },
	{ "<leader>kr", ":Task start cmake run<Cr>", desc = "Run", nowait = true, remap = false },
	{ "<leader>ks", ":ClangdSwitchSourceHeader<cr>", desc = "Header/Src", nowait = true, remap = false },
	{ "<leader>kt", ":Task set_module_param cmake target<Cr>", desc = "Set Target", nowait = true, remap = false },
}

which_key.add(mappings)
