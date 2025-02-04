C_CONFIG = {}

C_CONFIG.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    { "<leader>c", group = "Config", nowait = true, remap = false },
    { "<leader>cc", "<cmd>EditNvimConfig<CR>", desc = "Edit Neovim", nowait = true, remap = false },
  }

  which_key.add(mappings)

end

return C_CONFIG
