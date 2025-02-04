G_GIT = {}

G_GIT.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>g", group = "Git", nowait = true, remap = false },
      { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer", nowait = true, remap = false },
      { "<leader>gS", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branch", nowait = true, remap = false },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout Commit", nowait = true, remap = false },
      { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", nowait = true, remap = false },
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Lazygit", nowait = true, remap = false },
      { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
      { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
      { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
      { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open Changed File", nowait = true, remap = false },
      { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", nowait = true, remap = false },
      { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
      { "<leader>gs", "<cmd>Neogit<CR>", desc = "Neogit", nowait = true, remap = false },
      { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)

end

return G_GIT
