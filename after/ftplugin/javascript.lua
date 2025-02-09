local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {

	{ "<leader>k", group = "Javascript", nowait = true, remap = false },
	{
		"<leader>kf",
		"<cmd>TypescriptFixAll<Cr>",
		desc = "FixAll",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kg",
		"<cmd>TypescriptGoToSourceDefinition<Cr>",
		desc = "GoToSourceDefinition",
		nowait = true,
		remap = false,
	},
	{
		"<leader>ki",
		"<cmd>TypescriptAddMissingImports<Cr>",
		desc = "AddMissingImports",
		nowait = true,
		remap = false,
	},
	{
		"<leader>ko",
		"<cmd>TypescriptOrganizeImports<cr>",
		desc = "OrganizeImports",
		nowait = true,
		remap = false,
	},
	{
		"<leader>kr",
		"<cmd>TypescriptRenameFile<Cr>",
		desc = "RenameFile",
		nowait = true,
		remap = false,
	},
	{
		"<leader>ku",
		"<cmd>TypescriptRemoveUnused<Cr>",
		desc = "RemoveUnused",
		nowait = true,
		remap = false,
	},
}
which_key.add(mappings)
