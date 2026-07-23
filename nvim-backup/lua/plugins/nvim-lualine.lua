return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "eldritch",
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = "|",
			},
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
