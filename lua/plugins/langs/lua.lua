--[[ lua.lua

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
    opts = {
      ensure_installed = { "lua-language-server" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          mason = true,
          settings = {
            lua_ls = {
              formatting = {
                command = {},
              },
            },
          },
        },
      },
    },
  },
}
--[[ lua.lua ends here. ]]
