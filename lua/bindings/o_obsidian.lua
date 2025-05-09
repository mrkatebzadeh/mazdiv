O_ORG = {}

O_ORG.setup = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local mappings = {
    {
      mode = { "v", "n" },
      { "<leader>o", group = "Obsidian", nowait = true, remap = false },
      {
        "<leader>of",
        "<CMD>ObsidianQuickSwitch<CR>",
        desc = "Find Node",
        nowait = true,
        remap = false,
      },
      {
        "<leader>oi",
        "<CMD>ObsidianLink<CR>",
        desc = "Insert Link",
        nowait = true,
        remap = false,
      },
      {
        "<leader>or",
        "<CMD>ObsidianRename<CR>",
        desc = "Rename Node",
        nowait = true,
        remap = false,
      },
      {
        "<leader>on",
        "<CMD>ObsidianNew<CR>",
        desc = "New Node",
        nowait = true,
        remap = false,
      },
      {
        "<leader>os",
        "<CMD>ObsidianSearch<CR>",
        desc = "Search",
        nowait = true,
        remap = false,
      },
      {
        "<leader>oo",
        "<CMD>ObsidianOpen<CR>",
        desc = "Open in Obsidian",
        nowait = true,
        remap = false,
      },
      {
        "<leader>ol",
        "<CMD>ObsidianLinks<CR>",
        desc = "Links",
        nowait = true,
        remap = false,
      },
    },
  }

  which_key.add(mappings)
end

return O_ORG
