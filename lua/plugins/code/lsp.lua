return {

	{
		"ray-x/lsp_signature.nvim",
		enabled = false,
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			local cfg = {
				floating_window_off_x = 5,
				floating_window_off_y = function()
					local linenr = vim.api.nvim_win_get_cursor(0)[1]
					local pumheight = vim.o.pumheight
					local winline = vim.fn.winline()
					local winheight = vim.fn.winheight(0)

					-- window top
					if winline - 1 < pumheight then
						return pumheight
					end

					-- window bottom
					if winheight - winline < pumheight then
						return -pumheight
					end
					return 0
				end,
			}
			require("lsp_signature").setup(cfg)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		autostart = true,
		config = function()
			require("lspconfig.ui.windows").default_options.border = "rounded"
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

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
