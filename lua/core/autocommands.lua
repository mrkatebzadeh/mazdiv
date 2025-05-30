--- Don't create a comment string when hitting <Enter> on a comment line
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("DisableNewLineAutoCommentString", {}),
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

local ns = vim.api.nvim_create_namespace("CurlineDiag")
vim.opt.updatetime = 100
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = args.buf,
      callback = function()
        pcall(vim.api.nvim_buf_clear_namespace, args.buf, ns, 0, -1)
        local hi = { "Error", "Warn", "Info", "Hint" }
        local curline = vim.api.nvim_win_get_cursor(0)[1]
        local diagnostics = vim.diagnostic.get(args.buf, { lnum = curline - 1 })
        local virt_texts = { { (" "):rep(4) } }
        for _, diag in ipairs(diagnostics) do
          virt_texts[#virt_texts + 1] = { diag.message, "Diagnostic" .. hi[diag.severity] }
        end
        vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0, {
          virt_text = virt_texts,
          hl_mode = "combine",
        })
      end,
    })
  end,
})

vim.diagnostic.config({
  virtual_text = false,
  -- virtual_lines = true,
  underline = true,
  signs = true,
  float = {
    border = "single",
    format = function(diagnostic)
      return string.format(
        "%s (%s) [%s]",
        diagnostic.message,
        diagnostic.source,
        diagnostic.code or diagnostic.user_data.lsp.code
      )
    end,
  },
})

local icons = require("icons")

vim.fn.sign_define("DiagnosticSignError", { text = icons.DiagnosticError, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = icons.DiagnosticWarn, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = icons.DiagnosticInfo, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = icons.DiagnosticHint, texthl = "DiagnosticSignHint" })

vim.fn.sign_define("DapBreakpoint", { text = icons.DapBreakpoint, texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapBreakpointCondition", { text = icons.DapBreakpointCondition, texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapBreakpointRejected", { text = icons.DapBreakpointRejected, texthl = "DiagnosticError" })
vim.fn.sign_define("DapLogPoint", { text = icons.DapLogPoint, texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapStopped", { text = icons.DapStopped, texthl = "DiagnosticWarn" })

vim.diagnostic.config({
  signs = {
    --support diagnostic severity / diagnostic type name
    text = {
      [vim.diagnostic.severity.ERROR] = icons.DiagnosticError,
      [vim.diagnostic.severity.WARN] = icons.DiagnosticWarn,
      [vim.diagnostic.severity.INFO] = icons.DiagnosticInfo,
      [vim.diagnostic.severity.HINT] = icons.DiagnosticHint,
    },
  },
})
