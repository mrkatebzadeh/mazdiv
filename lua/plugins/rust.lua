return {
	{
		"mrcjkb/rustaceanvim",
		dependencies = {
			-- "lvimuser/lsp-inlayhints.nvim",
			-- "ray-x/lsp_signature.nvim",
			-- opts = {},
		},
		version = "5.24.4", -- Recommended
		ft = { "rust" },
		config = function()
			local mason_registry = require("mason-registry")
			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

			local cmp = require("cmp")
			vim.api.nvim_create_autocmd("BufRead", {
				group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
				pattern = "Cargo.toml",
				callback = function()
					cmp.setup.buffer({ sources = { { name = "crates" } } })
				end,
			})
			vim.g.rustaceanvim = {
				inlay_hints = {
					auto = true,
					only_current_line = false,
					show_parameter_hints = true,
					parameter_hints_prefix = "<-",
					other_hints_prefix = "=> ",
					max_len_align = false,
					max_len_align_padding = 1,
					right_align = false,
					right_align_padding = 7,
					-- highlight = "Comment",
					highlight = "NonText",
				},
				hover_actions = {
					border = {
						{ "╭", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╮", "FloatBorder" },
						{ "│", "FloatBorder" },
						{ "╯", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╰", "FloatBorder" },
						{ "│", "FloatBorder" },
					},
					auto_focus = true,
				},
				dap = {
					adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, liblldb_path),
				},
				server = {
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					on_attach = function(client, bufnr)
						local status_ok, codelens_supported = pcall(function()
							return client.supports_method("textDocument/codeLens")
						end)
						if not status_ok or not codelens_supported then
							return
						end
						local group = "lsp_code_lens_refresh"
						local cl_events = { "BufEnter", "InsertLeave" }
						local ok, cl_autocmds = pcall(vim.api.nvim_get_autocmds, {
							group = group,
							buffer = bufnr,
							event = cl_events,
						})
						if ok and #cl_autocmds > 0 then
							return
						end
						local cb = function()
							if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_is_valid(bufnr) then
								vim.lsp.codelens.refresh({ bufnr = bufnr })
							end
						end
						vim.api.nvim_create_augroup(group, { clear = false })
						vim.api.nvim_create_autocmd(cl_events, {
							group = group,
							buffer = bufnr,
							callback = cb,
						})
					end,
				},
			}
		end,
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup({
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
				popup = {
					border = "rounded",
				},
			})
		end,
	},
}
