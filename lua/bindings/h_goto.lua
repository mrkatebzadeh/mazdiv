H_GOTO = {}

H_GOTO.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>h", group = "Goto", nowait = true, remap = false },
      { "<leader>hc", "<cmd>lua require('goto-preview').close_all_win()<cr>", desc = "Close All Windows", nowait = true, remap = false },
      { "<leader>hd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", desc = "Definition", nowait = true, remap = false },
      { "<leader>hi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", desc = "Implementation", nowait = true, remap = false },
      { "<leader>hl", "<cmd>lua require('goto-preview').goto_preview_declaration()<cr>", desc = "Declaration", nowait = true, remap = false },
      { "<leader>hr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>", desc = "References", nowait = true, remap = false },
      { "<leader>ht", "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>", desc = "Type Definition", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)

end

return H_GOTO
