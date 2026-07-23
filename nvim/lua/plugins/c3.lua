require("c3").setup({
	lsp = {
		enable = false, -- Set to false to disable LSP
		-- cmd = "c3lsp",
		-- version = "latest", -- (2)
		-- compiler_path = "/usr/bin/c3c", -- Custom path to c3c binary (3)
		-- stdlib_path = "/usr/lib/c3c/lib/std/", -- Custom path to C3 standard library (3)
	},
	formatter = {
		enable = true, -- Set to false to disable formatter
		cmd = "c3fmt",
		format_on_save = true,
		config_file = "~/dev/C3/.c3fmt", -- Path to .c3fmt file (1)
		version = "latest", -- (2)
	},
	highlighting = {
		enable_treesitter = true,
	},
})
vim.lsp.config("c3-lsp", {
	cmd = {
		"c3lsp",
		"-c3c-path",
		"/usr/bin/c3c",
		"-stdlib-path",
		"/usr/lib/c3c/lib/std/",
	},
	filetypes = {
		"c3",
		"c3i",
	},
	root_markers = { "project.json", ".git" },
})
