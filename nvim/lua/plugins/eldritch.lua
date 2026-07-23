require("eldritch").setup({
	transparent = true,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = { italic = true },
		variables = {},
		sidebars = "dark",
		floats = "transparent",
	},
	sidebars = { "qf", "help" },
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = true,
})
