--[[ lsp.lua

Author: M.R. Siavash Katebzadeh <mr@katebzadeh.xyz>
Keywords: Lua, Neovim
Version: 0.0.1

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

return {
	{
		"neovim/nvim-lspconfig",
		enabled = false,
		lazy = false,
		autostart = true,
		config = function()
			require("lspconfig.ui.windows").default_options.border = "rounded"
			local capabilities = require("blink.cmp").default_capabilities()

			local lspconfig = require("lspconfig")
			local icons = require("icons")
			lspconfig.diagnostics.signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = icons.DiagnosticError,
					[vim.diagnostic.severity.WARN] = icons.DiagnosticWarn,
					[vim.diagnostic.severity.HINT] = icons.DiagnosticHint,
					[vim.diagnostic.severity.INFO] = icons.DiagnosticInfo,
				},
			}

			lspconfig.verible.setup({
				cmd = { "verible-verilog-ls", "--rules_config_search" },
			})

			lspconfig.texlab.setup({
				capabilities = capabilities,
			})
			lspconfig.nil_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.cmake.setup({
				capabilities = capabilities,
			})

			lspconfig.bashls.setup({
				capabilities = capabilities,
			})

			lspconfig.phpactor.setup({
				capabilities = capabilities,
			})

			-- Clangd
			local clangd_flags = {
				"--all-scopes-completion",
				"--suggest-missing-includes",
				"--background-index",
				"--pch-storage=disk",
				"--cross-file-rename",
				"--log=info",
				"--completion-style=detailed",
				"--enable-config",
				"--clang-tidy",
				"--offset-encoding=utf-16",
				"--header-insertion-decorators",
				"--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type,performance-*,bugprone-*",
				"--header-insertion=iwyu",
				"--header-insertion-decorators",
				"--suggest-missing-includes",

				-- "--fallback-style=Google",
				-- "--header-insertion=never",
				-- "--query-driver=<list-of-white-listed-complers>"
			}

			local clangd_bin = "clangd"

			lspconfig.clangd.setup({
				capabilities = capabilities,
				virtual_text = true,
				cmd = { clangd_bin, unpack(clangd_flags) },
				init_options = {
					clangdFileStatus = true,
					clangdSemanticHighlighting = true,
				},
				filetypes = { "c", "h", "cpp", "cxx", "cc", "hpp", "mpp" },
				settings = {
					["clangd"] = {
						["compilationDatabasePath"] = "build",
						["fallbackFlags"] = { "-std=c++17" },
					},
				},
			})

			require("lspconfig").cmake.setup({})
		end,
	},
}
--[[ lsp.lua ends here. ]]
