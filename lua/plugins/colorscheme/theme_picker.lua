--[[ theme_picker.lua

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
  "panghu-huang/theme-picker.nvim",
  lazy = false,
  opts = {
    picker = {
      layout_config = {
        width = 0.35,
        height = 0.5,
      },
    },
    themes = {
      {
        name = "Mocha",
        colorscheme = "catppuccin-mocha",
      },
      {
        name = "Frappe",
        colorscheme = "catppuccin-frappe",
      },
      {
        name = "Neofusion",
        colorscheme = "neofusion",
      },
      {
        name = "Elflord",
        colorscheme = "elflord",
      },
      {
        name = "Retrobox",
        colorscheme = "retrobox",
      },
      {
        name = "Pablo",
        colorscheme = "pablo",
      },
      {
        name = "Doom",
        colorscheme = "doom",
      },
    },
  },
}

--[[ theme_picker.lua ends here. ]]
