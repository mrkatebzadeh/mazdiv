--[[ treesitter.lua

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
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			local has_tree_sitter_cli = vim.fn.executable("tree-sitter") == 1
			if has_tree_sitter_cli then
				ts.install({
					"bash",
					"c",
					"dockerfile",
					"html",
					"lua",
					"markdown",
					"python",
					"rust",
					"toml",
					"vim",
				})
			end

			local group = vim.api.nvim_create_augroup("MazdivTreesitter", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				callback = function(args)
					local buf = args.buf
					if vim.bo[buf].buftype ~= "" then
						return
					end

					local ft = vim.bo[buf].filetype
					local lang = vim.treesitter.language.get_lang(ft)
					if not lang then
						return
					end

					local ok = pcall(vim.treesitter.start, buf, lang)
					if ok then
						vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
						return
					end

					if not has_tree_sitter_cli then
						return
					end

					-- Parser missing (or broken): try installing, then enable treesitter for this buffer.
					local task = ts.install(lang)
					if task and task.await then
						task:await(function(err)
							if err then
								return
							end
							vim.schedule(function()
								if not vim.api.nvim_buf_is_valid(buf) then
									return
								end
								pcall(vim.treesitter.start, buf, lang)
								vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
							end)
						end)
					end
				end,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},
}
--[[ treesitter.lua ends here. ]]
