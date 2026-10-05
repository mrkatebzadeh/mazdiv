

vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.g.mapleader = " "

vim.keymap.set({ "n", "x", "o" }, "<leader>h", "^")
vim.keymap.set({ "n", "x", "o" }, "<leader>l", "g_")
vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>")

vim.keymap.set({ "n", "x" }, "cp", '"+y')
vim.keymap.set({ "n", "x" }, "cv", '"+p')

vim.keymap.set({ "n", "x" }, "x", '"_x')

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>bq", "<cmd>bdelete<cr>")
vim.keymap.set("n", "<leader>bl", "<cmd>buffer #<cr>")

vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC | PackerCompile", {})

local group = vim.api.nvim_create_augroup("user_cmds", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = group,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "man" },
  group = group,
  command = "nnoremap <buffer> q <cmd>quit<cr>",
})

local function ensure_packer()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print("Installing packer...")
    local packer_url = "https://github.com/wbthomason/packer.nvim"
    vim.fn.system({ "git", "clone", "--depth", "1", packer_url, install_path })
    print("Done.")

    vim.cmd("packadd packer.nvim")
    return true
  end

  return false
end

local install_plugins = ensure_packer()

require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "folke/tokyonight.nvim" })
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "nvim-lualine/lualine.nvim" })

  if install_plugins then
    require("packer").sync()
  end
end)

if install_plugins then
  print("==================================")
  print("    Plugins will be installed.")
  print("      After you press Enter")
  print("    Wait until Packer completes,")
  print("       then restart nvim")
  print("==================================")
  return
end

vim.opt.termguicolors = true
vim.cmd("colorscheme tokyonight")

vim.opt.showmode = false
require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "tokyonight",
    component_separators = "|",
    section_separators = "",
  },
})
