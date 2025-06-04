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
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
      color_overrides = {
        doom = {
          rosewater = "#d4c4b4",
          flamingo = "#6b757f",
          pink = "#7c9f85",
          mauve = "#c4865e",
          red = "#c67f79",
          maroon = "#9b7575",
          peach = "#c5a47b",
          yellow = "#c3c0a2",
          green = "#359b75",
          teal = "#5e8a83",
          sky = "#5c6d7a",
          sapphire = "#51797a",
          blue = "#c69f99",
          lavender = "#7c9dab",
          text = "#cee2cd",
          subtext1 = "#c1c7c6",
          subtext0 = "#b1b8b7",
          overlay2 = "#777d7e",
          overlay1 = "#484e4f",
          overlay0 = "#767676",
          surface2 = "#3b4242",
          surface1 = "#454e4e",
          surface0 = "#292f2f",
          base = "#23282b",
          mantle = "#1d2124",
          crust = "#17191b",
        },
      },
    })

    vim.o.termguicolors = true
    vim.o.background = "dark"
    vim.cmd([[colorscheme catppuccin]])
  end,
}

--[[ catppuccin.lua ends here. ]]
