C_CONFIG = {}

C_CONFIG.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }

  local mappings = {
    c = {
      name = "Config",
      c = { "<cmd>EditNvimConfig<CR>", "Edit Neovim"},
    },
  }

  which_key.register(mappings, opts)
end

return C_CONFIG
