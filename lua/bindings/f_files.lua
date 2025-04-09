F_FILES = {}

F_FILES.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>f", group = "Files", nowait = true, remap = false },
      {
        "<leader>fE",
        ":SudoEdit ",
        desc = "SudoEdit",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fF",
        "<cmd>EditBufferDir<cr>",
        desc = "Find File",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fN",
        "<cmd>Telescope file_browser <cr>",
        desc = "File Browser",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fW",
        ":SudoWrite<CR>",
        desc = "SudoWrite",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fb",
        "<cmd>Neotree buffers reveal float<cr>",
        desc = "Buffers",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fc",
        ":Chmod ",
        desc = "Chmod",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fd",
        ":Delete<CR>",
        desc = "Delete",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fe",
        "<cmd>Neotree toggle filesystem<cr>",
        desc = "NeoTree",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fn",
        "<CMD>FindFilesCwd<CR>",
        desc = "File Browser",
        nowait = true,
        remap = false,
      },

      {
        "<leader>fg",
        "<cmd>Telescope live_grep theme=ivy<cr>",
        desc = "Find Text",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags theme=ivy<cr>",
        desc = "Help Tags",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fk",
        ":Mkdir ",
        desc = "Mkdir",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fm",
        ":Move ",
        desc = "Move",
        nowait = true,
        remap = false,
      },
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Find File Fuzzy",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fo",
        "<cmd>Telescope oldfiles theme=ivy<cr>",
        desc = "Old Files",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fr",
        ":Rename ",
        desc = "Rename",
        nowait = true,
        remap = false,
      },
      {
        "<leader>fw",
        ":cmd>w!<CR>",
        desc = "Save",
        nowait = true,
        remap = false,
      },
    },
  }

  which_key.add(mappings)
end

return F_FILES
