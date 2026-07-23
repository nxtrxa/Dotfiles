_G.augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
_G.vim = vim

-- Format on save (ONLY real file buffers, ONLY when efm is attached)
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	pattern = {
		"*.lua",
		"*.py",
		"*.go",
		"*.js",
		"*.jsx",
		"*.ts",
		"*.tsx",
		"*.json",
		"*.css",
		"*.scss",
		"*.html",
		"*.sh",
		"*.bash",
		"*.zsh",
		"*.c",
		"*.cpp",
		"*.h",
		"*.hpp",
	},
	callback = function(args)
		-- avoid formatting non-file buffers (helps prevent weird write prompts)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end
		if not vim.bo[args.buf].modifiable then
			return
		end
		if vim.api.nvim_buf_get_name(args.buf) == "" then
			return
		end

		local has_efm = false
		for _, c in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
			if c.name == "efm" then
				has_efm = true
				break
			end
		end
		if not has_efm then
			return
		end

		pcall(vim.lsp.buf.format, {
			bufnr = args.buf,
			timeout_ms = 2000,
			filter = function(c)
				return c.name == "efm"
			end,
		})
	end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then -- except in diff mode
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
		local last_line = vim.api.nvim_buf_line_count(0)

		local row = last_pos[1]
		if row < 1 or row > last_line then
			return
		end

		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

-- local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
-- vim.api.nvim_create_autocmd("BufReadPost", {
--     group = last_cursor_group,
--     callback = function()
--         local mark = vim.api.nvim_buf_get_mark(0, '"')
--         local lcount = vim.api.nvim_buf_line_count(0)
--         if mark[1] > 0 and mark[1] <= lcount then
--             pcall(vim.api.nvim_win_set_cursor, 0, mark)
--         end
--     end,
-- })

-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local groups = {
			"Normal",
			"NormalNC",
			"NormalFloat",
			"FloatBorder",
			"SignColumn",
			"EndOfBuffer",
			"MsgArea",
			"NeoTreeNormal",
			"NeoTreeNormalNC",
			"TroubleNormal",
			"TroubleNormalNC",
			"TroubleIndent",
			"TroubleCount",
			"TroubleText",
			"TelescopeNormal",
			"TelescopeBorder",
			"TelescopePromptNormal",
			"TelescopePromptBorder",
			"TelescopePromptTitle",
			"TelescopeResultsNormal",
			"TelescopeResultsBorder",
			"TelescopeResultsTitle",
			"TelescopePreviewNormal",
			"TelescopePreviewBorder",
			"TelescopePreviewTitle",
			"TelescopeSelection",
			"TelescopeSelectionCaret",
			"TelescopeQuickFix",
			"TelescopeQuickFixLine",
			"TelescopeQuickFixFilename",
			"TelescopeResultsNormal",
			"TelescopeResultsBorder",
			"TelescopeSelection",
			"TelescopeSelectionCaret",
			"FzfLuaHelpNormal",
			"FzfLuaNormal",
			"FzfLuaBorder",
			"FzfLuaTitle",
			"FzfLuaPrompt",
			"FzfLuaCursor",
			"FzfLuaCursorLine",
			"FzfLuaHeader",
			"QuickFixLine",
			"qfFileName",
			"qfNumber",
			"qfSeparator",
			"Pmenu",
			"PmenuSel",
			"CmpPmenu",
			"CmpPmenuSel",
		}

		for _, group in ipairs(groups) do
			vim.api.nvim_set_hl(0, group, { bg = "none" })
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c3" },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		vim.keymap.set("n", "<leader>cs", "i#<CR><CR>int main(int argc, char **argv) {<CR><CR>return 0;<CR>}<ESC>2k4l ")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		vim.keymap.set("n", "<leader>cs", "i<CR><CR>int main(int argc, char **argv) {<CR><CR>return 0;<CR>}<ESC>2k4l ")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "c3",
	callback = function()
		vim.keymap.set(
			"n",
			"<leader>cs",
			"i module<CR> import<CR><CR> int main(String[] args){<CR><CR> return 0; }<ESC>2k4l "
		)
	end,
})
