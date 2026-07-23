local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lsp.setup({
	ensure_installed = {
		"lua_ls",
		"clangd",
		"c3_lsp",
		"jsonls",
		"bashls",
		"dockerls",
		"html",
		"cssls",
		"phpactor",
		"tailwindcss",
		"efm",
	},
	automatic_installation = true,
})
