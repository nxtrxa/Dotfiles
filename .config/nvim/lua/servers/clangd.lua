--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
return function(capabilities)
	vim.lsp.config('clangd',{
		capabilities = capabilities,
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
			"--background-index",
			"--clang-tidy",
			"--header-insertion=iwyu",
		},
		filetypes = { "c", "cpp", "h", "hpp", "cu", "cxx"},
		init_options = {
			fallbackFlags = {
			}
		},
	})
end
