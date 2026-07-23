--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
return function(capabilities)
	vim.lsp.config("emmet_ls", {
		capabilities = capabilities,
		filetypes = {
			"php",
			"vue",
			"react",
			"css",
			"html",
			"javascript",
			"less",
			"sass",
			"scss",
			"javascriptreact",
			"typescriptreact",
		},
	})
end
