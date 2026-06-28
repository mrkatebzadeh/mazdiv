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
		lazy = false,

		opts = {
			servers = {},
			inlay_hints = { enabled = true },
		},
		config = function(_, opts)
			-- nvim-lspconfig's legacy `require('lspconfig')` module is deprecated on Nvim 0.11+.
			-- Use the builtin LSP config API instead.
			for server, config in pairs(opts.servers or {}) do
				config = config or {}
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
--[[ lsp.lua ends here. ]]
