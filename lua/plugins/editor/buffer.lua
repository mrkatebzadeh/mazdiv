--[[ buffer.lua

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
    "SunnyTamang/select-undo.nvim",
    opts = {},
  },
  {
    "cappyzawa/trim.nvim",
    opts = {
      trim_first_line = false,
      trim_last_line = false,
      patterns = {
        [[%s/\%^\n\+//e]],
        [[%s/\($\n\s*\)\+\%$//e]],
      },
    },
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      require("outline").setup({})
    end,
  },
  {

    "norcalli/nvim-colorizer.lua",
  },
  {
    "chentoast/marks.nvim",
    commit = "74e8d01",
    config = function()
      require("marks").setup({})
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "3.1.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
