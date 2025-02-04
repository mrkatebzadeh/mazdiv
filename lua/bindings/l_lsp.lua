L_LSP = {}

L_LSP.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>l", group = "LSP", nowait = true, remap = false },
      { "<leader>lD", '<cmd>:lua vim.diagnostic.open_float({"line "})<cr>', desc = "Show Line diagnostics", nowait = true, remap = false },
      { "<leader>lH", vim.lsp.buf.signature_help, desc = "Signature Help", nowait = true, remap = false },
      { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = true, remap = false },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", nowait = true, remap = false },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
      { "<leader>lb", "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0,layout_strategy='vertical',layout_config={width=0.9, height=0.95, preview_cutoff = 0}})<cr>", desc = "Buffer Diagnostics", nowait = true, remap = false },
      { "<leader>lc", "<cmd>lua vim.lsp.codelens.refresh()<cr>", desc = "Codelens Refresh", nowait = true, remap = false },
      { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics", nowait = true, remap = false },
      { "<leader>le", "<cmd>lua require('telescope').extensions.notify.notify({bufnr=0,layout_strategy='vertical',layout_config={width=0.9, height=0.95, preview_cutoff = 0},wrap_results=true,})<cr>", desc = "Notofication History", nowait = true, remap = false },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format", nowait = true, remap = false },
      { "<leader>lh", vim.lsp.buf.hover, desc = "Help", nowait = true, remap = false },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
      { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic", nowait = true, remap = false },
      { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", nowait = true, remap = false },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
      { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", nowait = true, remap = false },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = true, remap = false },
      { "<leader>lt", ":TroubleToggle<CR>", desc = "Trouble", nowait = true, remap = false },
      { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics", nowait = true, remap = false },
    },
  }

  which_key.add(mappings)

end

return L_LSP
