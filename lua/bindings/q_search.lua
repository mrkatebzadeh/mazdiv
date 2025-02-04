Q_SEARCH = {}

Q_SEARCH.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>?", group = "Search", nowait = true, remap = false },
      { "<leader>?C", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
      { "<leader>?M", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
      { "<leader>?R", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
      { "<leader>?S", "<Plug>(leap-backward)", desc = "Search Backward Leap", nowait = true, remap = false },
      { "<leader>?c", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = true, remap = false },
      { "<leader>?f", "<cmd>lua require('spectre').open_file_search()<cr>", desc = "Replace Buffer", nowait = true, remap = false },
      { "<leader>?h", "<cmd>Telescope help_tags<cr>", desc = "Find Help", nowait = true, remap = false },
      { "<leader>?k", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
      { "<leader>?r", "<cmd>lua require('spectre').open()<cr>", desc = "Replace", nowait = true, remap = false },
      { "<leader>?s", "<Plug>(leap-forward)", desc = "Search Forward Leap", nowait = true, remap = false },
      { "<leader>?w", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", desc = "Replace Word", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)

end

return Q_SEARCH
