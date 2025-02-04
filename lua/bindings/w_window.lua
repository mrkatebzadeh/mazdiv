W_WINDOW = {}

W_WINDOW.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>w", group = "Window", nowait = true, remap = false },
      { "<leader>w-", "<C-W>s", desc = "Split Below", nowait = true, remap = false },
      { "<leader>w2", "<C-W>v", desc = "Layout Double Columns", nowait = true, remap = false },
      { "<leader>w=", "<C-W>=", desc = "Balance", nowait = true, remap = false },
      { "<leader>wH", "<C-W>5<", desc = "Expand Left", nowait = true, remap = false },
      { "<leader>wJ", "<cmd>resize +5<CR>", desc = "Expand Below", nowait = true, remap = false },
      { "<leader>wK", "<cmd>resize -5<CR>", desc = "Expand Up", nowait = true, remap = false },
      { "<leader>wL", "<C-W>5>", desc = "Expand Right", nowait = true, remap = false },
      { "<leader>wd", "<C-W>c", desc = "Delete", nowait = true, remap = false },
      { "<leader>wh", "<C-W>h", desc = "Left", nowait = true, remap = false },
      { "<leader>wj", "<C-W>j", desc = "Below", nowait = true, remap = false },
      { "<leader>wk", "<C-W>k", desc = "Up", nowait = true, remap = false },
      { "<leader>wl", "<C-W>l", desc = "Right", nowait = true, remap = false },
      { "<leader>wo", "<C-W>o", desc = "Close Others", nowait = true, remap = false },
      { "<leader>ws", "<C-W>s<C-W>w", desc = "Split Focus Below", nowait = true, remap = false },
      { "<leader>wv", "<C-W>v<C-W>w", desc = "Split Focus Right", nowait = true, remap = false },
      { "<leader>ww", "<C-W>w", desc = "Other", nowait = true, remap = false },
      { "<leader>w|", "<C-W>v", desc = "Split Right", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)

end

return W_WINDOW
