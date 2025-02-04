T_TEST = {}

T_TEST.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>T", group = "Test", nowait = true, remap = false },
      { "<leader>TS", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop", nowait = true, remap = false },
      { "<leader>Tc", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run Current Test", nowait = true, remap = false },
      { "<leader>Tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run File", nowait = true, remap = false },
      { "<leader>Tl", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Run Last", nowait = true, remap = false },
      { "<leader>To", "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>", desc = "Output", nowait = true, remap = false },
      { "<leader>Ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary", nowait = true, remap = false },
      { "<leader>Tt", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)

end

return T_TEST
