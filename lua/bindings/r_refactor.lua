R_REFACTOR = {}

R_REFACTOR.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>r", group = "Refactor", nowait = true, remap = false },
      { "<leader>rB", ":Refactor extract_block_to_file<cr>", desc = "Extract Block to File", nowait = true, remap = false },
      { "<leader>rI", ":Refactor inline_func<cr>", desc = "Inline Function", nowait = true, remap = false },
      { "<leader>rb", ":Refactor extract_block<cr>", desc = "Extract Block", nowait = true, remap = false },
      { "<leader>re", ":Refactor extract ", desc = "Extract", nowait = true, remap = false },
      { "<leader>rf", ":Refactor extract_to_file ", desc = "Extract to File", nowait = true, remap = false },
      { "<leader>ri", ":Refactor inline_var<cr>", desc = "Inline Variable", nowait = true, remap = false },
      { "<leader>rv", ":Refactor extract_var ", desc = "Extract Variable", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)

end

return R_REFACTOR
