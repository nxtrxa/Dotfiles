vim.lsp.config("lua_ls", {
	capabilities = vim.lsp.capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "Snacks" },
			},
			telemetry = { enable = false },
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
				},
			},
		},
	},
})

