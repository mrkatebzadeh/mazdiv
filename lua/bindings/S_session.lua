S_SESSION = {}

S_SESSION.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>S", group = "Session", nowait = true, remap = false },
      { "<leader>Sd", "<cmd>SessionManager delete_session<cr>", desc = "Delete Session", nowait = true, remap = false },
      { "<leader>Sl", "<cmd>SessionManager load_session<cr>", desc = "Load Session", nowait = true, remap = false },
      { "<leader>Ss", "<cmd>SessionManager save_current_session <cr>", desc = "Save Session", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)

end

return S_SESSION
