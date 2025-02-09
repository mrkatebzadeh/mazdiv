local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	{
		"<leader>k",
		group = "Rust",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kC",
		"<cmd>:RustLsp openCargo<Cr>",
		desc = "Open Cargo",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kR",
		"<cmd>:RustLsp reloadWorkspace<Cr>",
		desc = "Reload Workspace",
		nowait = true,
		remap = false,
	},
	{
		"<leader>ka",
		"<cmd>:RustLsp codeAction<Cr>",
		desc = "Actions",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kc",
		group = "Crate",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kcd",
		"<cmd>lua require'crates'.show_dependencies_popup()<cr>",
		desc = "Show Dependencies",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kcf",
		"<cmd>lua require'crates'.show_features_popup()<cr>",
		desc = "Show Features",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kci",
		"<cmd>lua require'crates'.show_crate_popup()<cr>",
		desc = "Show Info",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kcp",
		"<cmd>lua require'crates'.show_popup()<cr>",
		desc = "Show Popup",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kcy",
		"<cmd>lua require'crates'.open_repository()<cr>",
		desc = "Open Repository",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kd",
		"<cmd>:RustLsp debuggables<Cr>",
		desc = "Debuggables",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kh",
		"<cmd>:RustLsp externalDocs<Cr>",
		desc = "Open Docs",
		nowait = true,
		remap = false,
	},
	{
		"<leader>km",
		"<cmd>:RustLsp expandMacro<Cr>",
		desc = "Expand Macro",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kp",
		"<cmd>:RustLsp parentModule<Cr>",
		desc = "Parent Module",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kr",
		"<cmd>:RustLsp runnables<Cr>",
		desc = "Runnables",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kt",
		"<cmd>:RustLsp testables<cr>",
		desc = "Cargo Test",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kv",
		"<cmd>:RustLsp crateGraph<Cr>",
		desc = "View Crate Graph",
		nowait = true,
		remap = false,
	},
}

which_key.add(mappings)
