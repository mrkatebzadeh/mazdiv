return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local neogit = require("neogit")
      neogit.setup({
        commit_editor = {
          kind = "tab",
          show_staged_diff = true,
          staged_diff_split_kind = "auto",
          spell_check = true,
        },
      })
    end,
  },
}
