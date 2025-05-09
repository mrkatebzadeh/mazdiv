return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
	config = function()
		local function get_attached_clients()
			local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
			if #buf_clients == 0 then
				return "LSP Inactive"
			end

			local buf_ft = vim.bo.filetype
			local buf_client_names = {}

			-- add client
			for _, client in pairs(buf_clients) do
				if client.name ~= "copilot" and client.name ~= "null-ls" then
					table.insert(buf_client_names, client.name)
				end
			end

			local null_ls_s, null_ls = pcall(require, "null-ls")
			if null_ls_s then
				local sources = null_ls.get_sources()
				for _, source in ipairs(sources) do
					if source._validated then
						for ft_name, ft_active in pairs(source.filetypes) do
							if ft_name == buf_ft and ft_active then
								table.insert(buf_client_names, source.name)
							end
						end
					end
				end
			end

			local lint_s, lint = pcall(require, "lint")
			if lint_s then
				for ft_k, ft_v in pairs(lint.linters_by_ft) do
					if type(ft_v) == "table" then
						for _, linter in ipairs(ft_v) do
							if buf_ft == ft_k then
								table.insert(buf_client_names, linter)
							end
						end
					elseif type(ft_v) == "string" then
						if buf_ft == ft_k then
							table.insert(buf_client_names, ft_v)
						end
					end
				end
			end

			local formatter_s, _ = pcall(require, "formatter")
			if formatter_s then
				local formatter_util = require("formatter.util")
				for _, formatter in ipairs(formatter_util.get_available_formatters_for_ft(buf_ft)) do
					if formatter then
						table.insert(buf_client_names, formatter)
					end
				end
			end

			local unique_client_names = {}
			for _, client_name_target in ipairs(buf_client_names) do
				local is_duplicate = false
				for _, client_name_compare in ipairs(unique_client_names) do
					if client_name_target == client_name_compare then
						is_duplicate = true
					end
				end
				if not is_duplicate then
					table.insert(unique_client_names, client_name_target)
				end
			end

			local client_names_str = table.concat(unique_client_names, ", ")
			local language_servers = string.format("[%s]", client_names_str)

			return language_servers
		end

		local attached_clients = {
			get_attached_clients,
			color = {
				gui = "bold",
			},
		}

		require("lualine").setup({
			extensions = { "neo-tree", "quickfix", "nvim-dap-ui" },
			options = {
				globalstatus = false,
				disabled_filetypes = { "alpha", "neo-tree", "Outline", "neotest-summary" },
				theme = "catppuccin",
			},
			sections = {
				lualine_b = { "branch", "diff" },
				lualine_x = { "diagnostics", attached_clients, "filetype" },
			},
		})
	end,
}
