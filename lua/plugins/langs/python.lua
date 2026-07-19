--[[ python.lua

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

local function pylint_init_hook()
  local venv = vim.env.VIRTUAL_ENV
  if not venv or venv == "" then
    return nil
  end

  local python
  for _, candidate in ipairs({ venv .. "/bin/python", venv .. "/bin/python3" }) do
    if vim.fn.executable(candidate) == 1 then
      python = candidate
      break
    end
  end

  if not python then
    return nil
  end

  local purelib = vim.fn.systemlist({
    python,
    "-c",
    "import sysconfig; print(sysconfig.get_paths()['purelib'])",
  })[1]
  if not purelib or purelib == "" then
    return nil
  end

  return string.format("import sys; sys.path.insert(0, %q)", purelib)
end

return {
  {
    "kiyoon/jupynium.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
      "stevearc/dressing.nvim",
    },
    opts = {
      jupyter_command = "jupyter notebook",
    },
    build = "pip3 install --user .",
    -- build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
    -- build = "conda run --no-capture-output -n jupynium pip install .",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {

        ruff = {
          mason = true,
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ensure_installed = { "pylint" },
        },
      },
    },
    opts = {
      linters_by_ft = {
        python = { "pylint" },
      },
      linters = {
        pylint = {
          args = function()
            local args = {
              "-f",
              "json",
              "--from-stdin",
              function()
                return vim.api.nvim_buf_get_name(0)
              end,
            }

            local hook = pylint_init_hook()
            if hook then
              table.insert(args, 1, hook)
              table.insert(args, 1, "--init-hook")
            end

            return args
          end,
        },
      },
    },
  },
}

--[[ python.lua ends here. ]]
