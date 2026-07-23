require("obsidian").setup({
	legacy_commands = false,
	workspaces = { { name = "notes", path = "~/misc/notes" } },
	picker = { name = "fzf-lua" },
})
