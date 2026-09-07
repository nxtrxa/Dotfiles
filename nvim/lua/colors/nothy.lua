-- colors/nothy.lua
local M = {}

local palette = {
	fg = "#722FF7",
	p0 = "#2f010e",
	p1 = "#F72585",
	p2 = "#00FFFF",
	p3 = "#B5149E",
	p4 = "#7404C3",
	p5 = "#9372f7",
	p6 = "#654f7f",
	d1 = "#360567",
	d2 = "#C0FFEE",
	d3 = "#741447",
	g1 = "#12B2E2",
	g2 = "#00cecb",
	g3 = "#ae0072",
	m1 = "#0e2f93",
	m2 = "#ae4af7",
	m3 = "#C399F9",
	m4 = "#4a72f7",
}

local function hl(name, opts)
	vim.api.nvim_set_hl(0, name, opts)
end

local function set_core()
	hl("Normal", { fg = palette.fg }) -- transparent bg
	hl("Cursor", { fg = palette.p0, bg = palette.fg })
	hl("CursorLine", { bg = nil })
	hl("CursorColumn", { bg = nil })
	hl("ColorColumn", { bg = palette.d2 })
	hl("LineNr", { fg = palette.m2 })
	hl("Comment", { fg = palette.m3, italic = true })
	hl("Constant", { fg = palette.p3 })
	hl("Identifier", { fg = palette.p2 })
	hl("Statement", { fg = palette.p4 })
	hl("PreProc", { fg = palette.g3, bold = true })
	hl("Type", { fg = palette.m4, bold = true })
	hl("Special", { fg = palette.g3 })
	hl("Underlined", { fg = palette.g2, underline = false })
	hl("Directory", { fg = palette.p6 })
	hl("Visual", { bg = palette.d3 })
	hl("Search", { bg = palette.p2, fg = palette.p0 })
	hl("IncSearch", { bg = palette.p1, fg = palette.p0 })
	hl("Pmenu", { fg = palette.fg, bg = nil })
	hl("PmenuSel", { fg = palette.p0, bg = palette.p3 })
	hl("PmenuKind", { fg = palette.g3 })
	hl("PmenuSbar", { bg = nil })
	hl("PmenuThumb", { bg = palette.p3 })
	hl("FloatBorder", { fg = palette.p3, bg = nil })
	hl("NormalFloat", { fg = palette.fg, bg = nil })
	hl("StatusLine", { fg = palette.fg, bg = palette.p0, bold = true })
	hl("StatusLineNC", { fg = palette.m2, bg = nil })
	hl("Line", { fg = palette.m2, bg = nil })
	hl("TabLineSel", { fg = palette.fg, bg = palette.d2 })
	hl("Title", { fg = palette.p5, bold = true })
	hl("Error", { fg = palette.p0, bg = palette.p1 })
	hl("Warning", { fg = palette.p0, bg = palette.p2 })
	hl("Todo", { fg = palette.p5, bg = palette.d3 })
end

local function set_treesitter()
	hl("@comment", { fg = palette.p1, italic = true })
	hl("@constant", { fg = palette.m1 })
	hl("@string", { fg = palette.m3 })
	hl("@type", { fg = palette.g1 })
	hl("@function", { fg = palette.p4, italic = true })
	hl("@function.builtin", { fg = palette.m1, italic = true })
	hl("@parameter", { fg = palette.p6, italic = true })
	hl("@keyword", { fg = palette.m1, bold = true, italic = true })
	hl("@conditional", { fg = palette.p2 })
	hl("@property", { fg = palette.p4 })
	hl("@namespace", { fg = palette.p3, bold = true, italic = true })
	hl("@string.regex", { fg = palette.g3 })
	hl("@constructor", { fg = palette.d3 })
	hl("@comment.documentation", { fg = palette.p1, italic = true })
	hl("@variable", { fg = palette.m2, italic = true })
	hl("@builtin", { fg = palette.m1, italic = true })

	-- editor-level String too
	hl("String", { fg = palette.m3 })
end

local function set_lsp()
	hl("DiagnosticError", { fg = palette.p1 })
	hl("DiagnosticWarn", { fg = palette.p2 })
	hl("DiagnosticInfo", { fg = palette.g2 })
	hl("DiagnosticHint", { fg = palette.g3 })

	-- remove underlines/undercurl globally for diagnostics
	hl("DiagnosticUnderlineError", { undercurl = false, underline = false, sp = nil })
	hl("DiagnosticUnderlineWarn", { undercurl = false, underline = false, sp = nil })
	hl("DiagnosticUnderlineInfo", { undercurl = false, underline = false, sp = nil })
	hl("DiagnosticUnderlineHint", { undercurl = false, underline = false, sp = nil })

	-- LSP reference highlights (remove underline)
	hl("LspReferenceText", { bg = nil, underline = false, undercurl = false })
	hl("LspReferenceRead", { bg = nil, underline = false, undercurl = false })
	hl("LspReferenceWrite", { bg = nil, underline = false, undercurl = false })

	-- semantic token fallbacks
	hl("LspType", { fg = palette.m4 })
	hl("LspClass", { fg = palette.p3 })
	hl("LspFunction", { fg = palette.p4 })
	hl("LspVariable", { fg = palette.fg })
	hl("LspParameter", { fg = palette.p6, italic = true })

	hl("FloatBorder", { fg = palette.p3, bg = nil })
	hl("NormalFloat", { fg = palette.fg, bg = nil })
	hl("LspInfoBorder", { fg = palette.p3 })
	hl("LspInfo", { fg = palette.fg })
end

local function set_plugins()
	hl("CmpItemAbbr", { fg = palette.fg })
	hl("CmpItemAbbrMatch", { fg = palette.p5, bold = true })
	hl("CmpItemKind", { fg = palette.g2 })
	hl("GitSignsAdd", { fg = palette.g3 })
	hl("GitSignsChange", { fg = palette.p4 })
	hl("GitSignsDelete", { fg = palette.p1 })
	hl("TelescopeBorder", { fg = palette.p3, bg = nil })
	hl("TelescopePromptBorder", { fg = palette.p4, bg = nil })
	hl("TelescopePromptNormal", { fg = palette.fg, bg = nil })
	hl("NotifyERRORBorder", { fg = palette.p1 })
	hl("NotifyWARNBorder", { fg = palette.p2 })
	hl("NotifyINFOBorder", { fg = palette.g2 })
	hl("NotifyDEBUGBorder", { fg = palette.m4 })
	hl("NotifyTRACEBorder", { fg = palette.g1 })
end

local function set_terminal()
	-- Terminal colors
	vim.g.terminal_color_0 = palette.p0
	vim.g.terminal_color_1 = palette.p5
	vim.g.terminal_color_2 = palette.g3
	vim.g.terminal_color_3 = palette.p2
	vim.g.terminal_color_4 = palette.m4
	vim.g.terminal_color_5 = palette.p3
	vim.g.terminal_color_6 = palette.g2
	vim.g.terminal_color_7 = palette.fg
	vim.g.terminal_color_8 = palette.g1
	vim.g.terminal_color_9 = palette.p5
	vim.g.terminal_color_10 = palette.g3
	vim.g.terminal_color_11 = palette.p2
	vim.g.terminal_color_12 = palette.m4
	vim.g.terminal_color_13 = palette.p3
	vim.g.terminal_color_14 = palette.g2
	vim.g.terminal_color_15 = palette.fg
end

local function setup()
	vim.cmd("hi clear")
	vim.g.colors_name = "nothy"

	set_core()
	set_treesitter()
	set_lsp()
	set_plugins()
	set_terminal()
end

setup()

return M
