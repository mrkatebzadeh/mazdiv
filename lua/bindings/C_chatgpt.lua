C_CHATGPT = {}

C_CHATGPT.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    { "<leader>C", group = "ChatGPT", mode = "v", nowait = true, remap = false },
    { "<leader>Cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT", mode = "v", nowait = true, remap = false },
    {
      mode = { "n", "v" },
      { "<leader>Ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", nowait = true, remap = false },
      { "<leader>Cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", nowait = true, remap = false },
      { "<leader>Ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with Instruction", nowait = true, remap = false },
      { "<leader>Cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", nowait = true, remap = false },
      { "<leader>Cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", nowait = true, remap = false },
      { "<leader>Ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", nowait = true, remap = false },
      { "<leader>Cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis", nowait = true, remap = false },
      { "<leader>Co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", nowait = true, remap = false },
      { "<leader>Cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", nowait = true, remap = false },
      { "<leader>Cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", nowait = true, remap = false },
      { "<leader>Ct", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", nowait = true, remap = false },
      { "<leader>Cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)

end

return C_CHATGPT
