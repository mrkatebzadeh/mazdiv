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
      { "<leader>Sl", '<CMD>lua require("persistence").load()<CR>', desc = "Load Session", nowait = true, remap = false },
      { "<leader>Ss", '<CMD>lua require("persistence").select() <CR>', desc = "Select Session", nowait = true, remap = false },
      { "<leader>SL", '<CMD>lua require("persistence").load({ last = true }) <CR>', desc = "Last Session", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)

end

return S_SESSION
