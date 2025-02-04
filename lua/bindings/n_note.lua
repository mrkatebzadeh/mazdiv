N_NOTE = {}

N_NOTE.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>n", group = "Note", nowait = true, remap = false },
      { "<leader>nc", "<cmd>Neorg toggle-concealer<cr>", desc = "Toggle", nowait = true, remap = false },
      { "<leader>nf", "<cmd>Neorg roam node<cr>", desc = "Roam", nowait = true, remap = false },
      { "<leader>ng", "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<cr>", desc = "Glass", nowait = true, remap = false },
      { "<leader>nh", "<cmd>Neorg workspace home<cr>", desc = "Home", nowait = true, remap = false },
      { "<leader>nq", "<cmd>Neorg return<cr>", desc = "Quit/Return", nowait = true, remap = false },
      { "<leader>nr", "<cmd>Neorg workspace research<cr>", desc = "Research", nowait = true, remap = false },
      { "<leader>ns", "<cmd>Neorg roam select_workspace<cr>", desc = "Roam Workspace", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)
end

return N_NOTE
