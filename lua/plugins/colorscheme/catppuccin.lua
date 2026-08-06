--[[ catppuccin.lua

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
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  enabled = true,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      transparent_background = vim.g.neovide == false,
      styles = {
        comments = { "italic" },
      },
		integrations = {
			gitsigns = true,
			treesitter = true,
			notify = true,
		},
    })

    vim.o.termguicolors = true
    vim.o.background = "dark"
    vim.cmd([[colorscheme catppuccin]])
  end,
}

--[[ catppuccin.lua ends here. ]]
