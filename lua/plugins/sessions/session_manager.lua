--[[ session_manager.lua

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
  enabled = false,
  "Shatur/neovim-session-manager",
  config = function()
    local Path = require("plenary.path")
    local config = require("session_manager.config")
    local session_manager = require("session_manager")
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      callback = function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
            return
          end
        end
        session_manager.save_current_session()
      end,
    })

    session_manager.setup({
      sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
      session_filename_to_dir = session_filename_to_dir,
      dir_to_session_filename = dir_to_session_filename,
      autoload_mode = config.AutoloadMode.CurrentDir,
      autosave_last_session = true,
      autosave_ignore_not_normal = true,
      autosave_ignore_dirs = {},
      autosave_ignore_filetypes = {
        "gitcommit",
        "gitrebase",
      },
      autosave_ignore_buftypes = {},
      autosave_only_in_session = false,
      max_path_length = 80,
    })
  end,
}

--[[ session_manager.lua ends here. ]]
