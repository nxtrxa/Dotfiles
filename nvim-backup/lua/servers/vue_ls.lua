return function(capabilities)
	vim.lsp.config("vue_ls", {
		capabilities = capabilities,
		filetypes = { "vue" },
	})
end
