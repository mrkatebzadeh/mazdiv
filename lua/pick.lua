local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- Setup telescope with custom mappings for file_browser
require("telescope").setup({
  extensions = {
    file_browser = {
      theme = "ivy",
      grouped = true,
      previewer = false,
      hidden = true,
      respect_gitignore = false,
      follow_symlinks = true,
      results_height = 4,
      mappings = {
        ["i"] = {
          ["<Tab>"] = function(prompt_bufnr)
            local entry = action_state.get_selected_entry()
            local path = entry.path or entry.filename

            if vim.fn.isdirectory(path) == 1 then
              actions.close(prompt_bufnr)
              require("telescope").extensions.file_browser.file_browser({
                cwd = path,
                respect_gitignore = false,
              })
            end
          end,

          ["<Left>"] = function(prompt_bufnr)
            local current_picker = action_state.get_current_picker(prompt_bufnr)
            local cwd = current_picker.cwd

            local parent_dir = vim.fn.fnamemodify(cwd, ":h")
            actions.close(prompt_bufnr)
            require("telescope").extensions.file_browser.file_browser({
              cwd = parent_dir,
              respect_gitignore = false,
            })
          end,

          ["<CR>"] = function(prompt_bufnr)
            local entry = action_state.get_selected_entry()
            actions.close(prompt_bufnr)

            if entry then
              local path = entry.path or entry.filename

              -- Check if the path is a directory
              if vim.fn.isdirectory(path) == 1 then
                -- If it's a directory, reveal it in Neo-tree
                vim.cmd("Neotree reveal " .. path)
                vim.cmd("Oil " .. path)
              else
                -- Otherwise, open the file
                vim.cmd("edit " .. path)
                -- Update Neo-tree root to the directory of the opened file
                vim.cmd("Neotree reveal " .. vim.fn.fnamemodify(path, ":h"))
              end
            end
          end,
        },
      },
    },
  },
})

-- Load the file_browser extension
require("telescope").load_extension("file_browser")
