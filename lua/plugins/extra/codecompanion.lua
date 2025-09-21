--[[ codecompanion.lua

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
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    prompt_library = {
      ["Generate a Commit Message"] = {
        strategy = "inline",
        description = "Commit message",
        opts = {
          index = 10,
          is_slash_cmd = true,
          short_name = "cm",
          auto_submit = true,
        },
        prompts = {
          {
            opts = {
              placement = "add",
            },
            role = "user",
            content = function()
              local function get_git_diff()
                local neogit = require("neogit")
                local root = neogit.lib.git.repo.git_dir
                if not root or root == "" then
                  return "No git repository found."
                end
                return vim.fn.system({ "git", "-C", root, "diff", "--no-ext-diff", "--staged" })
              end
              local diff = get_git_diff()
              return string.format(
                [[You are an expert at writing Git commits. Your job is to write a short clear commit message that summarizes the changes.

The commit message should be structured as follows:

    <emoji> <type>(<optional scope>): <description>


- Commits MUST be prefixed with a relevant emojie and a type, which consists of one of the followings words: build, chore, ci, docs, feat, fix, perf, refactor, style, test
- The type feat MUST be used when a commit adds a new feature
- The type fix MUST be used when a commit represents a bug fix
- An optional scope MAY be provided after a type. A scope is a phrase describing a section of the codebase enclosed in parenthesis, e.g., fix(parser):
- Try to limit the whole subject line to 60 characters
- Capitalize the subject line
- Do not end the subject line with any punctuation
- Use the imperative mood in the subject line
Given the git diff listed below:
```diff
%s
```
]],
                diff
              )
            end,
          },
        },
      },
    },
    opts = {

      log_level = "DEBUG", -- or "TRACE"
      show_result_in_chat = false,
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            env = {
              api_key = "cmd:pass openai/key",
            },
            schema = {
              model = {
                default = "gpt-4.1",
              },
            },
          })
        end,
      },
    },
  },
}

--[[ codecompanion.lua ends here. ]]
