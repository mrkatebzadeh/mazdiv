C_CHATGPT = {}

C_CHATGPT.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    { "<leader>C", group = "CodeCompanion", mode = "v", nowait = true, remap = false },
    {
      mode = { "n", "v" },

      {
        "<leader>Cc",
        "<CMD>CodeCompanionChat<CR>",
        desc = "Chat",
        nowait = true,
        remap = false,
      },
      {
        "<leader>Ca",
        "<CMD>CodeCompanionActions<CR>",
        desc = "Actions",
        nowait = true,
        remap = false,
      },
      {
        "<leader>Cm",
        "<CMD>CodeCompanion /cm<CR>",
        desc = "Generate Commit Message",
        nowait = true,
        remap = false,
      },
    },
  }

  which_key.add(mappings)
end

return C_CHATGPT
