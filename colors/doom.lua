--[[ doom.lua

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

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "doom"

-- Centralized Doom palette.
-- Base identity (10) + derived brights/surfaces + functional tints.
local p = {
  -- base identity
  bg       = "#2b2f2d", -- charcoal metal (main background)
  oxidized = "#2f5d50", -- dark oxidized green (dark surface)
  silver_green = "#8fa39b", -- muted silver-green (secondary fg)
  silver   = "#c4c9c7", -- light silver (primary fg)
  olive    = "#6f7d3c", -- olive
  emerald  = "#1e8a6a", -- strong green identity
  brass    = "#a88b4a", -- aged brass
  crimson  = "#8b3a3a", -- dark crimson
  purple   = "#5b4b78", -- muted arcane purple
  steel    = "#3f667a", -- cold steel blue
  -- derived surfaces / neutrals
  bg_dark    = "#222625",
  bg_surface = "#323735",
  bg_visual  = "#3e524a",
  border     = "#4d5a55",
  fg_muted   = "#6d7f79",
  comment    = "#8da29a",
  doc        = "#9ab3a9",
  param      = "#9db8ad",
  prop       = "#a9beb6",
  -- derived brights (syntax foregrounds)
  emerald_bright = "#46bd94",
  moss           = "#a9c25e",
  gold           = "#d2a959",
  gold_light     = "#e6c884",
  copper         = "#cd9260",
  sage           = "#b3c07c",
  char           = "#c9d69b",
  steel_bright   = "#82b2c7",
  aqua           = "#6fb8a6",
  violet         = "#9d88cc",
  lavender       = "#b9a4e6",
  red_bright     = "#d47171",
  hint           = "#7fb8a3",
  -- functional tints
  diff_add    = "#2b4038",
  diff_change = "#3c3a29",
  diff_delete = "#3e2d2d",
  diff_text   = "#4e4b31",
  search_bg   = "#554a2d",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Core editor UI -----------------------------------------------------------
hl("Normal", { fg = p.silver, bg = p.bg })
hl("NormalNC", { fg = p.silver, bg = p.bg_dark })
hl("NormalFloat", { fg = p.silver, bg = p.bg_surface })
hl("FloatBorder", { fg = p.border, bg = p.bg_surface })
hl("WinSeparator", { fg = p.border, bg = p.bg })
hl("Cursor", { fg = p.bg, bg = p.silver })
hl("lCursor", { link = "Cursor" })
hl("CursorLine", { bg = p.bg_surface })
hl("CursorColumn", { bg = p.bg_surface })
hl("CursorLineNr", { fg = p.gold, bg = p.bg_surface })
hl("LineNr", { fg = p.fg_muted, bg = p.bg })
hl("SignColumn", { fg = p.fg_muted, bg = p.bg })
hl("ColorColumn", { bg = p.bg_surface })
hl("Visual", { bg = p.bg_visual })
hl("VisualNOS", { link = "Visual" })
hl("Search", { fg = p.gold_light, bg = p.search_bg })
hl("IncSearch", { fg = p.bg, bg = p.gold })
hl("CurSearch", { fg = p.bg, bg = p.gold_light })
hl("MatchParen", { fg = p.gold_light, bold = true, underline = true })
hl("Pmenu", { fg = p.silver, bg = p.bg_surface })
hl("PmenuSel", { fg = p.silver, bg = p.bg_visual, bold = true })
hl("PmenuSbar", { bg = p.bg_dark })
hl("PmenuThumb", { bg = p.border })
hl("StatusLine", { fg = p.silver, bg = p.bg_surface })
hl("StatusLineNC", { fg = p.silver_green, bg = p.bg_dark })
hl("TabLine", { fg = p.silver_green, bg = p.bg_dark })
hl("TabLineSel", { fg = p.silver, bg = p.bg_surface, bold = true })
hl("TabLineFill", { bg = p.bg_dark })
hl("WinBar", { fg = p.silver, bg = p.bg })
hl("WinBarNC", { fg = p.silver_green, bg = p.bg_dark })
hl("Folded", { fg = p.silver_green, bg = p.bg_surface })
hl("FoldColumn", { fg = p.fg_muted, bg = p.bg })
hl("NonText", { fg = p.fg_muted })
hl("Whitespace", { fg = p.fg_muted })
hl("EndOfBuffer", { fg = p.fg_muted })
hl("Directory", { fg = p.steel_bright })
hl("Title", { fg = p.gold, bold = true })
hl("Question", { fg = p.emerald_bright })
hl("MoreMsg", { fg = p.emerald_bright })
hl("ModeMsg", { fg = p.silver_green })
hl("ErrorMsg", { fg = p.red_bright })
hl("WarningMsg", { fg = p.gold })
hl("Conceal", { fg = p.fg_muted })
hl("SpecialKey", { fg = p.fg_muted })
hl("WildMenu", { fg = p.silver, bg = p.bg_visual, bold = true })
hl("QuickFixLine", { fg = p.silver, bg = p.bg_visual, bold = true })
hl("Substitute", { fg = p.bg, bg = p.gold })

-- Legacy syntax ------------------------------------------------------------
hl("Comment", { fg = p.comment, italic = true })
hl("SpecialComment", { fg = p.brass, italic = true })
hl("Constant", { fg = p.gold_light })
hl("String", { fg = p.sage })
hl("Character", { fg = p.char })
hl("Number", { fg = p.copper })
hl("Float", { link = "Number" })
hl("Boolean", { fg = p.violet })
hl("Identifier", { fg = p.silver })
hl("Function", { fg = p.gold })
hl("Statement", { fg = p.emerald_bright })
hl("Conditional", { fg = p.moss })
hl("Repeat", { fg = p.moss })
hl("Label", { fg = p.lavender })
hl("Operator", { fg = p.silver_green })
hl("Keyword", { fg = p.emerald_bright })
hl("Exception", { fg = p.red_bright })
hl("PreProc", { fg = p.lavender })
hl("Include", { fg = p.violet })
hl("Define", { fg = p.lavender })
hl("Macro", { fg = p.lavender })
hl("PreCondit", { fg = p.violet })
hl("Type", { fg = p.steel_bright })
hl("StorageClass", { fg = p.emerald_bright })
hl("Structure", { fg = p.steel_bright })
hl("Typedef", { fg = p.steel_bright })
hl("Special", { fg = p.brass })
hl("SpecialChar", { fg = p.copper })
hl("Delimiter", { fg = p.fg_muted })
hl("Debug", { fg = p.red_bright })
hl("Underlined", { fg = p.steel_bright, underline = true })
hl("Ignore", { fg = p.fg_muted })
hl("Error", { fg = p.red_bright, bg = p.diff_delete })
hl("Todo", { fg = p.gold, bold = true })

-- Diff ---------------------------------------------------------------------
hl("DiffAdd", { bg = p.diff_add, fg = p.silver })
hl("DiffChange", { bg = p.diff_change, fg = p.silver })
hl("DiffDelete", { bg = p.diff_delete, fg = p.red_bright })
hl("DiffText", { bg = p.diff_text, fg = p.silver, bold = true })
hl("Added", { fg = p.emerald_bright })
hl("Changed", { fg = p.gold })
hl("Removed", { fg = p.red_bright })
hl("diffAdded", { link = "Added" })
hl("diffChanged", { link = "Changed" })
hl("diffRemoved", { link = "Removed" })
hl("diffFile", { fg = p.steel_bright })
hl("diffNewFile", { fg = p.emerald_bright })
hl("diffOldFile", { fg = p.red_bright })
hl("diffLine", { fg = p.silver_green })
hl("diffIndexLine", { fg = p.brass })

-- Spell --------------------------------------------------------------------
hl("SpellBad", { undercurl = true, sp = p.red_bright })
hl("SpellCap", { undercurl = true, sp = p.steel_bright })
hl("SpellRare", { undercurl = true, sp = p.violet })
hl("SpellLocal", { undercurl = true, sp = p.aqua })

-- Tree-sitter --------------------------------------------------------------
hl("@variable", { fg = p.silver })
hl("@variable.builtin", { fg = p.violet })
hl("@variable.parameter", { fg = p.param })
hl("@variable.member", { fg = p.prop })
hl("@constant", { fg = p.gold_light })
hl("@constant.builtin", { fg = p.violet })
hl("@constant.macro", { fg = p.lavender })
hl("@module", { fg = p.brass })
hl("@module.builtin", { fg = p.brass })
hl("@label", { fg = p.lavender })
hl("@string", { fg = p.sage })
hl("@string.escape", { fg = p.copper })
hl("@string.regexp", { fg = p.copper })
hl("@string.special", { fg = p.gold_light })
hl("@string.special.url", { fg = p.steel_bright, underline = true })
hl("@character", { fg = p.char })
hl("@character.special", { fg = p.copper })
hl("@boolean", { fg = p.violet })
hl("@number", { fg = p.copper })
hl("@number.float", { fg = p.copper })
hl("@type", { fg = p.steel_bright })
hl("@type.builtin", { link = "@type" })
hl("@type.definition", { fg = p.steel_bright })
hl("@type.qualifier", { fg = p.emerald_bright })
hl("@attribute", { fg = p.lavender })
hl("@attribute.builtin", { fg = p.violet })
hl("@property", { fg = p.prop })
hl("@function", { fg = p.gold })
hl("@function.builtin", { fg = p.violet })
hl("@function.call", { fg = p.gold })
hl("@function.method", { fg = p.gold })
hl("@function.method.call", { fg = p.gold })
hl("@constructor", { fg = p.brass })
hl("@operator", { fg = p.silver_green })
hl("@keyword", { fg = p.emerald_bright })
hl("@keyword.function", { fg = p.emerald_bright })
hl("@keyword.return", { fg = p.moss })
hl("@keyword.conditional", { fg = p.moss })
hl("@keyword.repeat", { fg = p.moss })
hl("@keyword.exception", { fg = p.red_bright })
hl("@keyword.import", { fg = p.emerald_bright })
hl("@keyword.directive", { fg = p.lavender })
hl("@keyword.modifier", { fg = p.emerald_bright })
hl("@keyword.type", { fg = p.steel_bright })
hl("@keyword.operator", { fg = p.emerald_bright })
hl("@punctuation.delimiter", { fg = p.fg_muted })
hl("@punctuation.bracket", { fg = p.fg_muted })
hl("@punctuation.special", { fg = p.silver_green })
hl("@comment", { link = "Comment" })
hl("@comment.documentation", { fg = p.doc, italic = true })
hl("@comment.todo", { fg = p.emerald_bright, bold = true })
hl("@comment.note", { fg = p.steel_bright, bold = true })
hl("@comment.warning", { fg = p.gold, bold = true })
hl("@comment.error", { fg = p.red_bright, bold = true })
hl("@tag", { fg = p.steel_bright })
hl("@tag.attribute", { fg = p.prop })
hl("@tag.delimiter", { fg = p.fg_muted })
hl("@markup.heading", { fg = p.gold, bold = true })
hl("@markup.heading.1", { fg = p.gold, bold = true })
hl("@markup.heading.2", { fg = p.emerald_bright, bold = true })
hl("@markup.heading.3", { fg = p.steel_bright, bold = true })
hl("@markup.heading.4", { fg = p.violet, bold = true })
hl("@markup.heading.5", { fg = p.sage, bold = true })
hl("@markup.heading.6", { fg = p.copper, bold = true })
hl("@markup.link", { fg = p.steel_bright, underline = true })
hl("@markup.link.label", { fg = p.aqua })
hl("@markup.link.url", { fg = p.steel_bright, underline = true })
hl("@markup.list", { fg = p.brass })
hl("@markup.raw", { fg = p.sage })
hl("@markup.quote", { fg = p.silver_green, italic = true })
hl("@markup.strong", { fg = p.silver, bold = true })
hl("@markup.italic", { fg = p.silver, italic = true })
hl("@markup.strikethrough", { fg = p.fg_muted, strikethrough = true })
hl("@markup.math", { fg = p.aqua })
hl("@markup.environment", { fg = p.lavender })
hl("@diff.plus", { fg = p.emerald_bright })
hl("@diff.minus", { fg = p.red_bright })
hl("@diff.delta", { fg = p.gold })

-- LSP / diagnostics --------------------------------------------------------
hl("DiagnosticError", { fg = p.red_bright })
hl("DiagnosticWarn", { fg = p.gold })
hl("DiagnosticInfo", { fg = p.steel_bright })
hl("DiagnosticHint", { fg = p.hint })
hl("DiagnosticOk", { fg = p.emerald_bright })
hl("DiagnosticVirtualTextError", { fg = p.red_bright, bg = p.diff_delete })
hl("DiagnosticVirtualTextWarn", { fg = p.gold, bg = p.diff_change })
hl("DiagnosticVirtualTextInfo", { fg = p.steel_bright, bg = p.bg_surface })
hl("DiagnosticVirtualTextHint", { fg = p.hint, bg = p.bg_surface })
hl("DiagnosticVirtualTextOk", { fg = p.emerald_bright, bg = p.diff_add })
hl("DiagnosticUnderlineError", { undercurl = true, sp = p.red_bright })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.gold })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.steel_bright })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.hint })
hl("DiagnosticUnderlineOk", { underline = true, sp = p.emerald_bright })
hl("DiagnosticFloatingError", { link = "DiagnosticError" })
hl("DiagnosticFloatingWarn", { link = "DiagnosticWarn" })
hl("DiagnosticFloatingInfo", { link = "DiagnosticInfo" })
hl("DiagnosticFloatingHint", { link = "DiagnosticHint" })
hl("DiagnosticFloatingOk", { link = "DiagnosticOk" })
hl("DiagnosticSignError", { fg = p.red_bright, bg = p.bg })
hl("DiagnosticSignWarn", { fg = p.gold, bg = p.bg })
hl("DiagnosticSignInfo", { fg = p.steel_bright, bg = p.bg })
hl("DiagnosticSignHint", { fg = p.hint, bg = p.bg })
hl("DiagnosticSignOk", { fg = p.emerald_bright, bg = p.bg })
hl("LspReferenceText", { bg = p.bg_visual })
hl("LspReferenceRead", { bg = p.bg_visual })
hl("LspReferenceWrite", { bg = p.bg_visual, bold = true })
hl("LspSignatureActiveParameter", { fg = p.gold, bold = true })
hl("LspInlayHint", { fg = p.fg_muted, bg = p.bg_dark })
hl("LspCodeLens", { fg = p.fg_muted })
hl("LspCodeLensSeparator", { fg = p.fg_muted })

-- Git ----------------------------------------------------------------------
hl("GitSignsAdd", { fg = p.emerald_bright, bg = p.bg })
hl("GitSignsChange", { fg = p.gold, bg = p.bg })
hl("GitSignsDelete", { fg = p.red_bright, bg = p.bg })
hl("GitSignsAddNr", { fg = p.emerald_bright, bg = p.bg })
hl("GitSignsChangeNr", { fg = p.gold, bg = p.bg })
hl("GitSignsDeleteNr", { fg = p.red_bright, bg = p.bg })
hl("GitSignsAddLn", { bg = p.diff_add })
hl("GitSignsChangeLn", { bg = p.diff_change })
hl("GitSignsDeleteLn", { bg = p.diff_delete })
hl("GitSignsCurrentLineBlame", { fg = p.fg_muted, italic = true })
hl("gitcommitSummary", { fg = p.silver })
hl("gitcommitComment", { link = "Comment" })
hl("gitcommitUntracked", { fg = p.fg_muted })
hl("gitcommitDiscarded", { fg = p.fg_muted })
hl("gitcommitSelected", { fg = p.emerald_bright })

-- blink.cmp ----------------------------------------------------------------
hl("BlinkCmpMenu", { link = "Pmenu" })
hl("BlinkCmpMenuBorder", { link = "FloatBorder" })
hl("BlinkCmpMenuSelection", { link = "PmenuSel" })
hl("BlinkCmpScrollBarGutter", { link = "PmenuSbar" })
hl("BlinkCmpScrollBarThumb", { link = "PmenuThumb" })
hl("BlinkCmpLabel", { fg = p.silver })
hl("BlinkCmpLabelDeprecated", { fg = p.fg_muted, strikethrough = true })
hl("BlinkCmpLabelMatch", { fg = p.gold, bold = true })
hl("BlinkCmpLabelDetail", { fg = p.silver_green })
hl("BlinkCmpLabelDescription", { fg = p.silver_green })
hl("BlinkCmpKindFunction", { fg = p.gold })
hl("BlinkCmpKindMethod", { fg = p.gold })
hl("BlinkCmpKindVariable", { fg = p.silver })
hl("BlinkCmpKindField", { fg = p.prop })
hl("BlinkCmpKindProperty", { fg = p.prop })
hl("BlinkCmpKindClass", { fg = p.steel_bright })
hl("BlinkCmpKindInterface", { fg = p.aqua })
hl("BlinkCmpKindStruct", { fg = p.steel_bright })
hl("BlinkCmpKindModule", { fg = p.brass })
hl("BlinkCmpKindKeyword", { fg = p.emerald_bright })
hl("BlinkCmpKindConstant", { fg = p.gold_light })
hl("BlinkCmpKindSnippet", { fg = p.lavender })
hl("BlinkCmpKindText", { fg = p.silver })
hl("BlinkCmpKindFile", { fg = p.steel_bright })
hl("BlinkCmpKindFolder", { fg = p.steel_bright })
hl("BlinkCmpDoc", { link = "NormalFloat" })
hl("BlinkCmpDocBorder", { link = "FloatBorder" })
hl("BlinkCmpDocSeparator", { fg = p.border })
hl("BlinkCmpSignatureHelp", { link = "NormalFloat" })
hl("BlinkCmpSignatureHelpBorder", { link = "FloatBorder" })

-- Snacks -------------------------------------------------------------------
hl("SnacksNormal", { link = "Normal" })
hl("SnacksWinBar", { link = "WinBar" })
hl("SnacksBackdrop", { bg = "#1b1e1d" })
hl("SnacksPicker", { link = "NormalFloat" })
hl("SnacksPickerBorder", { link = "FloatBorder" })
hl("SnacksPickerTitle", { fg = p.gold, bold = true })
hl("SnacksPickerPrompt", { fg = p.emerald_bright, bold = true })
hl("SnacksPickerMatch", { fg = p.gold, bold = true })
hl("SnacksPickerDir", { fg = p.fg_muted })
hl("SnacksPickerFile", { fg = p.silver })
hl("SnacksPickerSelected", { fg = p.silver, bg = p.bg_visual, bold = true })
hl("SnacksInput", { link = "NormalFloat" })
hl("SnacksInputBorder", { link = "FloatBorder" })
hl("SnacksInputTitle", { fg = p.gold, bold = true })
hl("SnacksInputIcon", { fg = p.emerald_bright })
hl("SnacksDashboardHeader", { fg = p.emerald_bright })
hl("SnacksDashboardDesc", { fg = p.silver })
hl("SnacksDashboardKey", { fg = p.gold })
hl("SnacksDashboardIcon", { fg = p.steel_bright })
hl("SnacksDashboardFooter", { fg = p.silver_green })
hl("SnacksIndent", { fg = p.border })
hl("SnacksIndentScope", { fg = p.emerald })
hl("SnacksNotifierInfo", { fg = p.steel_bright, bg = p.bg_surface })
hl("SnacksNotifierWarn", { fg = p.gold, bg = p.bg_surface })
hl("SnacksNotifierError", { fg = p.red_bright, bg = p.bg_surface })
hl("SnacksNotifierDebug", { fg = p.fg_muted, bg = p.bg_surface })
hl("SnacksNotifierTrace", { fg = p.violet, bg = p.bg_surface })
hl("SnacksNotifierTitleInfo", { fg = p.steel_bright, bold = true })
hl("SnacksNotifierTitleWarn", { fg = p.gold, bold = true })
hl("SnacksNotifierTitleError", { fg = p.red_bright, bold = true })

-- Noice / Notify -----------------------------------------------------------
hl("NoiceCmdlinePopup", { link = "NormalFloat" })
hl("NoiceCmdlinePopupBorder", { link = "FloatBorder" })
hl("NoiceCmdlineIcon", { fg = p.emerald_bright })
hl("NoiceConfirm", { link = "NormalFloat" })
hl("NoiceConfirmBorder", { link = "FloatBorder" })
hl("NoiceMini", { fg = p.silver_green, bg = p.bg_dark })
hl("NoicePopup", { link = "NormalFloat" })
hl("NoicePopupBorder", { link = "FloatBorder" })
hl("NotifyERRORBorder", { fg = p.red_bright, bg = p.bg_surface })
hl("NotifyWARNBorder", { fg = p.gold, bg = p.bg_surface })
hl("NotifyINFOBorder", { fg = p.steel_bright, bg = p.bg_surface })
hl("NotifyDEBUGBorder", { fg = p.fg_muted, bg = p.bg_surface })
hl("NotifyTRACEBorder", { fg = p.violet, bg = p.bg_surface })
hl("NotifyERRORTitle", { fg = p.red_bright, bold = true })
hl("NotifyWARNTitle", { fg = p.gold, bold = true })
hl("NotifyINFOTitle", { fg = p.steel_bright, bold = true })
hl("NotifyDEBUGTitle", { fg = p.fg_muted, bold = true })
hl("NotifyTRACETitle", { fg = p.violet, bold = true })
hl("NotifyERRORBody", { fg = p.silver, bg = p.bg_surface })
hl("NotifyWARNBody", { fg = p.silver, bg = p.bg_surface })
hl("NotifyINFOBody", { fg = p.silver, bg = p.bg_surface })

-- Trouble / WhichKey / Mason / misc UI ------------------------------------
hl("TroubleNormal", { link = "Normal" })
hl("TroubleText", { fg = p.silver })
hl("TroubleCount", { fg = p.gold, bold = true })
hl("TroubleLocation", { fg = p.fg_muted })
hl("TroubleFile", { fg = p.steel_bright })
hl("TroublePreview", { link = "NormalFloat" })
hl("WhichKey", { fg = p.gold })
hl("WhichKeyGroup", { fg = p.steel_bright })
hl("WhichKeyDesc", { fg = p.silver })
hl("WhichKeySeparator", { fg = p.fg_muted })
hl("WhichKeyFloat", { link = "NormalFloat" })
hl("WhichKeyBorder", { link = "FloatBorder" })
hl("MasonNormal", { link = "NormalFloat" })
hl("MasonHeader", { fg = p.bg, bg = p.emerald_bright, bold = true })
hl("MasonHighlight", { fg = p.emerald_bright })
hl("MasonMuted", { fg = p.fg_muted })
hl("LazyNormal", { link = "NormalFloat" })
hl("LazyButton", { fg = p.silver, bg = p.bg_visual })
hl("LazyButtonActive", { fg = p.bg, bg = p.gold, bold = true })
hl("LazyH1", { fg = p.gold, bold = true })
hl("LazyH2", { fg = p.steel_bright, bold = true })
hl("LazyReasonPlugin", { fg = p.aqua })
hl("BarbecueNormal", { link = "WinBar" })
hl("BarbecueSeparator", { fg = p.fg_muted })
hl("BarbecueDirname", { fg = p.silver_green })
hl("BarbecueBasename", { fg = p.silver, bold = true })
hl("BarbecueContextFunction", { fg = p.gold })
hl("BarbecueContextMethod", { fg = p.gold })
hl("BarbecueContextClass", { fg = p.steel_bright })
hl("EdgyNormal", { link = "Normal" })
hl("EdgyTitle", { link = "Title" })
hl("FidgetTitle", { link = "Title" })
hl("FidgetTask", { fg = p.silver_green })
hl("NavicText", { fg = p.silver_green })
hl("NavicSeparator", { fg = p.fg_muted })
hl("NavicIconsFunction", { fg = p.gold })
hl("NavicIconsMethod", { fg = p.gold })
hl("NavicIconsClass", { fg = p.steel_bright })
hl("NavicIconsInterface", { fg = p.aqua })
hl("NavicIconsVariable", { fg = p.silver })
hl("NavicIconsConstant", { fg = p.gold_light })
hl("NavicIconsModule", { fg = p.brass })
hl("RainbowDelimiterRed", { fg = p.red_bright })
hl("RainbowDelimiterYellow", { fg = p.gold })
hl("RainbowDelimiterBlue", { fg = p.steel_bright })
hl("RainbowDelimiterOrange", { fg = p.copper })
hl("RainbowDelimiterGreen", { fg = p.emerald_bright })
hl("RainbowDelimiterViolet", { fg = p.violet })
hl("RainbowDelimiterCyan", { fg = p.aqua })
hl("IlluminatedWordText", { bg = p.bg_visual })
hl("IlluminatedWordRead", { bg = p.bg_visual })
hl("IlluminatedWordWrite", { bg = p.bg_visual, bold = true })
hl("FlashLabel", { fg = p.bg, bg = p.gold, bold = true })
hl("FlashMatch", { fg = p.sage, bg = p.diff_add })
hl("FlashCurrent", { fg = p.bg, bg = p.emerald_bright })
hl("RenderMarkdownH1", { fg = p.gold, bold = true })
hl("RenderMarkdownH2", { fg = p.emerald_bright, bold = true })
hl("RenderMarkdownH3", { fg = p.steel_bright, bold = true })
hl("RenderMarkdownH4", { fg = p.violet, bold = true })
hl("RenderMarkdownH5", { fg = p.sage, bold = true })
hl("RenderMarkdownH6", { fg = p.copper, bold = true })
hl("RenderMarkdownCode", { bg = p.bg_surface })
hl("RenderMarkdownBullet", { fg = p.brass })
hl("RenderMarkdownLink", { fg = p.steel_bright, underline = true })
hl("TodoBgTODO", { fg = p.bg, bg = p.steel_bright, bold = true })
hl("TodoBgFIX", { fg = p.bg, bg = p.red_bright, bold = true })
hl("TodoBgNOTE", { fg = p.bg, bg = p.hint, bold = true })
hl("TodoBgWARN", { fg = p.bg, bg = p.gold, bold = true })
hl("TodoFgTODO", { fg = p.steel_bright })
hl("TodoFgFIX", { fg = p.red_bright })
hl("TodoFgNOTE", { fg = p.hint })
hl("TodoFgWARN", { fg = p.gold })
hl("TodoSignTODO", { fg = p.steel_bright, bg = p.bg })
hl("TodoSignFIX", { fg = p.red_bright, bg = p.bg })
hl("TodoSignNOTE", { fg = p.hint, bg = p.bg })
hl("TodoSignWARN", { fg = p.gold, bg = p.bg })
hl("DapBreakpoint", { fg = p.red_bright })
hl("DapStopped", { fg = p.gold })
hl("DapUINormal", { link = "NormalFloat" })
hl("DapUIVariable", { fg = p.silver })
hl("DapUIType", { fg = p.steel_bright })
hl("DapUIValue", { fg = p.sage })
hl("DapUISource", { fg = p.brass })
hl("NumbCursorLineNr", { fg = p.gold, bold = true })
hl("BqfPreviewFloat", { link = "NormalFloat" })
hl("BqfPreviewBorder", { link = "FloatBorder" })

-- Terminal -----------------------------------------------------------------
vim.g.terminal_color_0 = p.bg_dark
vim.g.terminal_color_1 = p.crimson
vim.g.terminal_color_2 = p.emerald
vim.g.terminal_color_3 = p.brass
vim.g.terminal_color_4 = p.steel
vim.g.terminal_color_5 = p.purple
vim.g.terminal_color_6 = p.oxidized
vim.g.terminal_color_7 = p.silver_green
vim.g.terminal_color_8 = p.fg_muted
vim.g.terminal_color_9 = p.red_bright
vim.g.terminal_color_10 = p.emerald_bright
vim.g.terminal_color_11 = p.gold
vim.g.terminal_color_12 = p.steel_bright
vim.g.terminal_color_13 = p.violet
vim.g.terminal_color_14 = p.aqua
vim.g.terminal_color_15 = p.silver

--[[ doom.lua ends here. ]]
