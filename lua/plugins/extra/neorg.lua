return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	tag = "v7.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		--[[ "benlubas/neorg-conceal-wrap",
    "nvim-telescope/telescope.nvim",
    {
      "juniorsundar/neorg-extras",
      tag = "v0.5.0",
    },
    "tamton-aquib/neorg-jupyter",
    "pritchett/neorg-capture",
    {
      "pysan3/neorg-templates",
      tag = "v2.0.3",
      dependencies = { "L3MON4D3/LuaSnip" },
    },
    { "max397574/neorg-contexts" },
    { "benlubas/neorg-interim-ls" },
    ]]
	},
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {
					config = {
						icon_preset = "diamond",
						icons = {
							todo = {
								done = { icon = "󰸞" },
								on_hold = { icon = "󰏤" },
								urgent = { icon = "󱈸" },
								uncertain = { icon = "" },
								recurring = { icon = "" },
								pending = { icon = "" },
							},
						},
					},
				},
				["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
				["core.integrations.nvim-cmp"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/Dropbox/notes",
							research = "~/Dropbox/research",
							home = "~/Dropbox/home",
						},
					},
				},
				["core.keybinds"] = {
					config = {
						default_keybinds = true,
						neorg_leader = "<Leader>n",
					},
				},
				["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
				["core.qol.toc"] = {},
				["core.qol.todo_items"] = {},
				["core.looking-glass"] = {},
				["core.presenter"] = { config = { zen_mode = "zen-mode" } },
				["core.export"] = {},
				["core.export.markdown"] = { config = { extensions = "all" } },
				["core.summary"] = {},
				["core.tangle"] = { config = { report_on_empty = false } },
				-- ["external.conceal-wrap"] = {},
				--[[ ["external.many-mans"] = {
          config = {
            metadata_fold = true,
            code_fold = true,
          },
        }, ]]
				--[[ ["external.agenda"] = {},
        ["external.roam"] = {
          config = {
            fuzzy_finder = "Telescope",
            fuzzy_backlinks = false,
          },
        }, ]]
				--[[ ["external.jupyter"] = {},
        ["external.templates"] = {
          templates_dir = vim.fn.stdpath("config") .. "/templates/norg",
          default_subcommand = "add", -- or "fload", "load"
          enabled = false,
        },
        ["external.capture"] = {
          enabled = false,
          templates = {
            {
              description = "Bookmark",
              name = "bookmark",
              file = "bookmark",
              enabled = true,
              datetree = true,
              headline = "Bookmark", -- If set, will save the caputure under this headline
              path = { "Save", "Here" }, -- List of headlines to traverse, then save the capture under
              -- A query for where to place the capture. Must be named neorg-capture-target
              query = "(headline1) @neorg-capture-target",
            },
          },
        }, ]]
				--[[ ["external.context"] = {},
        ["external.interim-ls"] = {
          config = {
            completion_provider = {
              enable = true,
              categories = false,
            },
          },
        }, ]]
				-- ["core.completion"] = {
				-- config = { engine = { module_name = "external.lsp-completion" } },
				-- },
			},
		})
		require("neorg.core").modules.get_module("core.dirman").set_workspace("default")
	end,
}
