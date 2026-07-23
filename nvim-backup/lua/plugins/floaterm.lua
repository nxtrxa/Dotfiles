return {
	"nvzone/floaterm",
	dependencies = "nvzone/volt",
	cmd = "FloatermToggle",
	config = function()
		require("nvim.plugins.floaterm_nvim").setup({
			border = true,
			size = { h = 74, w = 84 },
			winblend = 20, -- adjust as desired
			mappings = { sidebar = nil, term = nil },
			terminals = {
				{ name = "zsh" },
			},
		})
	end,
}
