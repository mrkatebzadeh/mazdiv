S_TERMINAL = {}

S_TERMINAL.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>s", group = "Terminal", nowait = true, remap = false },
      { "<leader>sf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal", nowait = true, remap = false },
      { "<leader>sh", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop", nowait = true, remap = false },
      { "<leader>sp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python", nowait = true, remap = false },
      { "<leader>st", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal Terminal", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)

end

return S_TERMINAL
