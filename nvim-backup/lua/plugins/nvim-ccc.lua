return {
	"uga-rosa/ccc.nvim",
	config = function()
		require("ccc").setup({
			highlighter = {
				auto_enable = true, -- enable highlight automatically
				lsp = true, -- highlight colors from LSP too
			},
		})
	end,
}
