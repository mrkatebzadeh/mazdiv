O_ORG = {}

O_ORG.setup = function()
	local status_ok, which_key = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>o", group = "Org", nowait = true, remap = false },
      { "<leader>or", group = "Roam", nowait = true, remap = false },
      { "<leader>orf", "<cmd>lua require('org-roam').api.find_node()<cr>", desc = "Find Node", nowait = true, remap = false },
      { "<leader>ori", "<cmd>lua require('org-roam').api.insert_node()<cr>", desc = "Find Node", nowait = true, remap = false },
    },
  }

	which_key.add(mappings)

end

return O_ORG
