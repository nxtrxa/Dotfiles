---@type vim.lsp.Config
return function(capabilities)
	vim.lsp.config('c3-lsp', {
		capabilities = capabilities,
		cmd = { 'true' },
		root_markers = { 'project.json', 'manifest.json', '.git' },
		filetypes = { 'c3', 'c3i' },
	})
end


