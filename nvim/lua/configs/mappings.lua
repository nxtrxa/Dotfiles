vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, opts)
	opts = vim.tbl_deep_extend("force", {
		noremap = true,
		silent = true,
	}, opts or {})
	vim.keymap.set(mode, lhs, rhs, opts)
end

--------------------------------------------------
-- Normal mode utilities
--------------------------------------------------
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", ";", ":", { noremap = true, desc = "Enter command mode" })
map("n", "<leader>rr", ":restart<CR>", { desc = "Restart Neovim" })
map("n", "<C-s>", ":wa<CR>", { desc = "Save all buffers" })
map("n", "<leader>e", ":Oil<CR>", { desc = "Open Oil file explorer" })
map("n", "<leader>q", ":q!<CR>", { desc = "Quit without saving" })
map("n", "<leader>mm", "ggVG", { desc = "Select all text" })

map("n", "<leader>bc", ":bd!<CR>", { desc = "Close buffer" })
map("n", "<leader>ba", ":%bd!<CR>", { desc = "Close all buffers" })

map("n", "<leader>chx", ":!chmod +x %<CR>", { desc = "Make file executable" })
map("n", "<leader>chw", ":!chmod +w %<CR>", { desc = "Make file writable" })

-- floating terminal toggle
map({ "n", "t" }, "<leader>\\", function()
	vim.cmd([[silent! :FloatermToggle]])
end, { desc = "Toggle floating terminal" })

map({ "t" }, "<leader>[", "<C-\\><C-n>", { desc = "Terminal visual mode" })

map("t", "<C-j>", function()
	require("floaterm.api").cycle_term_bufs("prev")
end, { desc = "Previous terminal" })

map("t", "<C-k>", function()
	require("floaterm.api").cycle_term_bufs("next")
end, { desc = "Next terminal" })

-- better movement in wrapped text
map("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, desc = "Down (wrap-aware)" })
map("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, desc = "Up (wrap-aware)" })

map("n", "<ESC>", ":nohlsearch<CR>", { desc = "Clear search highlights" })

map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

--------------------------------------------------
-- Copy / delete without overwriting register
--------------------------------------------------
map("x", "<C-p>", '"_dP', { desc = "Paste without yanking" })
map({ "n", "v" }, "<C-x>", '"_d', { desc = "Delete without yanking" })

--------------------------------------------------
-- Surround visual selections
--------------------------------------------------
map("v", "<leader>'", "c''<ESC>P", { desc = "Surround with single quotes" })
map("v", '<leader>"', 'c""<ESC>P', { desc = "Surround with double quotes" })
map("v", "<leader>(", "c()<ESC>P", { desc = "Surround with parentheses" })
map("v", "<leader>{", "c{}<ESC>P", { desc = "Surround with braces" })
map("v", "<leader>[", "c[]<ESC>P", { desc = "Surround with brackets" })
map("v", "<leader><", "c<><ESC>P", { desc = "Surround with angle brackets" })

--------------------------------------------------
-- Buffer navigation
--------------------------------------------------
map("n", "L", ":bnext<CR>", { desc = "Next buffer" })
map("n", "H", ":bprevious<CR>", { desc = "Previous buffer" })

--------------------------------------------------
-- Window navigation & resizing
--------------------------------------------------
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })

map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

--------------------------------------------------
-- Move lines / visual selections
--------------------------------------------------
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

--------------------------------------------------
-- Word manipulation
--------------------------------------------------
map("n", "<leader>wg", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Replace word under cursor globally" })
map("n", "<leader>wl", [[:s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Replace word under cursor in line" })
map("n", "<leader>wp", "bvep", { desc = "Replace word under cursor with clipboard" })
map("n", "<leader>wr", [[:%s/\<<C-r><C-w>\>.//gI<CR><ESC>]], { desc = "Remove word under cursor globally" })
map("n", "<leader>wd", [[:s/\<<C-r><C-w>\>.//gI<CR><ESC>]], { desc = "Remove word under cursor in line" })

--------------------------------------------------
-- Path, diagnostics, whitespace, comments
--------------------------------------------------
map("n", "<leader>fp", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path to clipboard" })

map("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

map("n", "<leader>rt", function()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local original_line_count = vim.fn.line("$")
	vim.cmd([[
    let save_search = @/
    %s/\s\+$//e
    let @/ = save_search
  ]])
	vim.cmd("nohlsearch")
	vim.api.nvim_win_set_cursor(0, cursor_pos)
	local new_line_count = vim.fn.line("$")
	if new_line_count == original_line_count then
		print("No trailing whitespace found")
	else
		print("Trailing whitespaces removed")
	end
end, { desc = "Remove trailing whitespace" })

map("n", "<leader>rc", function()
	local ft = vim.bo.filetype
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local patterns = {
		lua = "--.*/",
		c = "\\/\\/.*/",
		c3 = "\\/\\/.*/",
		cpp = "\\/\\/.*/",
		make = "\\#.*/",
		json = "\\/\\/.*/",
		jsonc = "\\/\\/.*/",
	}
	local pattern = patterns[ft]
	if not pattern then
		print("No comment pattern defined for filetype: " .. ft)
		return
	end
	vim.cmd("%s/" .. pattern)
	vim.cmd("g/^\\s*$/d")
	pcall(vim.api.nvim_win_set_cursor, 0, cursor_pos)
	vim.cmd("nohlsearch")
end, { desc = "Remove all comments" })

--------------------------------------------------
-- Obsidian
--------------------------------------------------
map("n", "<leader>nn", function()
	vim.cmd("Obsidian workspace")
	vim.defer_fn(function()
		vim.cmd("Obsidian new")
	end, 500)
end, { desc = "New Obsidian note" })

map("n", "<leader>nf", "<cmd>Obsidian quick_switch<cr>", { desc = "Find note" })
map("n", "<leader>ns", "<cmd>Obsidian search<cr>", { desc = "Search notes" })
map("n", "<leader>nt", "<cmd>Obsidian today<cr>", { desc = "Today's daily note" })
map("n", "<leader>nw", "<cmd>Obsidian workspace<cr>", { desc = "Switch workspace" })

--------------------------------------------------
-- Fzf-lua
--------------------------------------------------
map("n", "<leader>fh", function()
	require("fzf-lua").help_tags()
end, { desc = "FZF Help Tags" })
map("n", "<leader>'", function()
	require("fzf-lua").live_grep()
end, { desc = "FZF grep" })
map("n", "<leader>xx", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "FZF Document Diagnostics" })
map("n", "<leader>xX", function()
	require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF Workspace Diagnostics" })

--------------------------------------------------
-- Gitsigns
--------------------------------------------------
map("n", "]h", function()
	require("gitsigns").nav_hunk("next")
end, { desc = "Next git hunk" })
map("n", "[h", function()
	require("gitsigns").nav_hunk("prev")
end, { desc = "Previous git hunk" })
map("n", "<leader>cs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
map("n", "<leader>cr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
map("n", "<leader>cp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
map("n", "<leader>cb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })
map("n", "<leader>cB", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle inline blame" })
map("n", "<leader>cd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this" })

--------------------------------------------------
-- Diagnostics
--------------------------------------------------
map("n", "gl", function()
	vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostic list" })
map("n", "gL", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

--------------------------------------------------
-- Misc plugins
--------------------------------------------------
map("n", "<leader>cc", ":CccPick<CR>", { desc = "Color picker" })
map("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Show which-key" })

map("n", "<leader>i", "^", { desc = "Go to beginning of line" })
map("n", "<leader>o", "$", { desc = "Go to end of line" })

--------------------------------------------------
-- Snacks Pickers & Explorer
--------------------------------------------------
map("n", "<leader><leader>", function()
	Snacks.picker.smart()
end, { desc = "Smart Find Files" })
map("n", "<leader>;", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
map("n", "<leader>:", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })
map("n", "<leader>nh", function()
	Snacks.picker.notifications()
end, { desc = "Notification History" })
map("n", "<leader>se", function()
	Snacks.explorer()
end, { desc = "File Explorer" })

-- find
map("n", "<leader>sc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Config Files" })

map("n", "<leader>sg", function()
	Snacks.picker.git_files()
end, { desc = "Find Git Files" })

map("n", "<leader>sp", function()
	Snacks.picker.projects()
end, { desc = "Projects" })

map("n", "<leader>r<leader>", function()
	Snacks.picker.recent()
end, { desc = "Recent" })

-- git
map("n", "<leader>gb", function()
	Snacks.picker.git_branches()
end, { desc = "Git Branches" })
map("n", "<leader>gl", function()
	Snacks.picker.git_log()
end, { desc = "Git Log" })
map("n", "<leader>gL", function()
	Snacks.picker.git_log_line()
end, { desc = "Git Log Line" })
map("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, { desc = "Git Status" })
map("n", "<leader>gS", function()
	Snacks.picker.git_stash()
end, { desc = "Git Stash" })
map("n", "<leader>gd", function()
	Snacks.picker.git_diff()
end, { desc = "Git Diff (Hunks)" })
map("n", "<leader>gf", function()
	Snacks.picker.git_log_file()
end, { desc = "Git Log File" })

-- gh
map("n", "<leader>gi", function()
	Snacks.picker.gh_issue()
end, { desc = "GitHub Issues (open)" })
map("n", "<leader>gI", function()
	Snacks.picker.gh_issue({ state = "all" })
end, { desc = "GitHub Issues (all)" })
map("n", "<leader>gp", function()
	Snacks.picker.gh_pr()
end, { desc = "GitHub Pull Requests (open)" })
map("n", "<leader>gP", function()
	Snacks.picker.gh_pr({ state = "all" })
end, { desc = "GitHub Pull Requests (all)" })

-- search
map("n", '<leader>s"', function()
	Snacks.picker.registers()
end, { desc = "Registers" })
map("n", "<leader>s/", function()
	Snacks.picker.search_history()
end, { desc = "Search History" })
map("n", "<leader>sa", function()
	Snacks.picker.autocmds()
end, { desc = "Autocmds" })

-- flash

map({ "n", "x", "o" }, "m", function()
	require("flash").jump()
end, { desc = "flash" })
map({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "flash treesitter" })
map("o", "r", function()
	require("flash").remote()
end, { desc = "remote flash" })
map({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "treesitter search" })
map({ "c" }, "<c-c>", function()
	require("flash").toggle()
end, { desc = "toggle flash search" })

-- ouroboros

map("n", "<leader>p", ":Ouroboros<CR>", { desc = "switch between header/source file" })
map("n", "<leader>ss", ":vsplit | Ouroboros<CR>", { desc = "vertical split switch between header/source file" })
map("n", "<leader>sS", ":split | Ouroboros<CR>", { desc = "horizontal split switch between header/source file" })

-- tmux navigator
map("t", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", { desc = "tmux navigate left" })
map("t", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", { desc = "tmux navigate down" })
map("t", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", { desc = "tmux navigate up" })
map("t", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", { desc = "tmux navigate right" })
map("t", "<c-n>", "<cmd><C-U>TmuxNavigatePrevious<cr>", { desc = "tmux navigate previous" })

-- Render Markdown
map("n", "<leader>mt", ":RenderMarkdown toggle<CR>", { desc = "Toggle md rendering" })

