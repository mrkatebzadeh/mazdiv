return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/Dropbox/org/agenda/**/*",
        org_default_notes_file = "~/Dropbox/org/agenda/notes.org",
        mappings = {
          -- disable_all = true,
          global = {
            org_capture = { "<Leader>oc", desc = "Open Capture Prompt" },
          },
          org = {},
        },
      })

      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        ignore_install = { "org" },
      })
      vim.opt.conceallevel = 2
      vim.opt.concealcursor = "nc"
    end,
  },
  {
    "akinsho/org-bullets.nvim",
    enabled = false,
    config = function()
      require("org-bullets").setup({
        concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
        symbols = {
          list = "•",
          headlines = { "◉", "○", "✸", "✿" },
          checkboxes = {
            half = { "", "@org.checkbox.halfchecked" },
            done = { "✓", "@org.keyword.done" },
            todo = { "˟", "@org.keyword.todo" },
          },
        },
      })
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    enabled = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
  {
    "michaelb/sniprun",
    branch = "master",

    build = "sh install.sh",

    config = function()
      require("sniprun").setup({
        selected_interpreters = { "Python3_jupyter" },
      })
    end,
  },
  {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.1.1",
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        tag = "0.5.3",
      },
    },
    config = function()
      require("org-roam").setup({
        directory = "~/Dropbox/org/roam",
        --[[ database = {
					path = "~/Dropbox/org/roam/org-roam.db",
				}, ]]
        -- bindings = false,
      })
    end,
  },
}
