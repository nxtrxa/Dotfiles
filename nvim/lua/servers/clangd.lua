vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=never",
	},
	filetypes = { "c", "c.doxygen", "cpp", "cpp.doxygen", "objc", "objcpp", "cuda" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac", -- AutoTools
		".git",
	},
})
