local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", ":wa<CR>")

map("n", "<leader>q", ":q!<CR>")

map("n", "<ESC>", ":nohlsearch<CR>")

map("n", "<leader>bc", ":bd<CR>", { desc = "Close buffer" })
map("n", "<leader>bd", ":%bd<CR>", { desc = "Close all buffers" })

map({ "n", "i", }, "<C-y>", "<ESC>Vy<ESC>i", { desc = "Copy line" })
map({ "n", "i" }, "<C-i>", "<ESC>viwy<ESC>i", { desc = "Copy word" })

-- map("n", "<leader>cw", function ()
-- 	local cursor_pos = vim.api.nvim_win_get_cursor(0)
--
-- 	vim.cmd([[%s/\s\+$//e]])
--
--     vim.api.nvim_win_set_cursor(0, cursor_pos)
--
--     print("Trailing whitespaces removed")
-- end, { desc = "Clear trailing whitespaces" })

map("n", "<leader>chx", ":!chmod +x %<CR>", { desc = "Make file executable" })

map("v", "<leader>\'", "c''<ESC>P")
map("v", "<leader>\"", "c\"\"<ESC>P")
map("v", "<leader>(", "c()<ESC>P")
map("v", "<leader>{", "c{}<ESC>P")
map("v", "<leader>[", "c[]<ESC>P")
map("v", "<leader><", "c<><ESC>P")

map("n", "<leader>gS", "<cmd>vsplit | Lspsaga goto_definition<CR>", { desc = "slipt and go to definition" })

map("v", "<C-\"", ":s/gv/\"gv\"<CR>")

map("i", "'", "''<ESC>i")
map("i", '"', '""<ESC>i')
map("i", "(", "()<ESC>i")
map("i", "[", "[]<ESC>i")
map("i", "{", "{ }<Left><ESC>i")

map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

map("n", "L", "<Cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "H", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })

map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

map("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" })
map("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

map("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

map("n", "<leader>m", ":Neotree filesystem reveal left<CR>", { desc = "Focus on File Explorer" })
map("n", "<leader>e", ":Neotree filesystem reveal left toggle<CR>", { desc = "Toggle File Explorer" })

map("n", "<leader>nv", ":Neotree show filesystem toggle<CR>", { desc = "Show File Explorer"})
map("n", "<leader>nb", ":Neotree buffers toggle<CR>", { desc = "Show a list of currently open buffers" })
map("n", "<leader>ng", ":Neotree git_status toggle<CR>", { desc = "Show the output of git status in a tree layout" })


map("n", "<C-f>","gg=G", { desc = "indent file" })

-- Copy filepath to the clipboard
map("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
	vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

map(
	"n",
	"<leader>rw",
	[[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)


map("n", "<leader>cc", ":CccPick<CR>", { desc = "Color pick" })

map({ "n", "t" }, "<C-q>", function()
    vim.cmd([[silent! :FloatermToggle]])
end, { desc = "Toggle floating terminal" })

map( "t", "<C-j>", function() require("floaterm.api").cycle_term_bufs "prev" end, { desc = "Previous terminal" })
map( "t", "<C-k>", function() require("floaterm.api").cycle_term_bufs "next" end, { desc = "Next terminal" })
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "flash" })
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "flash treesitter" })
map("o", "r", function() require("flash").remote() end, { desc = "remote flash" })
map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "treesitter search" })
map({ "c" }, "<c-c>", function() require("flash").toggle() end, { desc = "toggle flash search" })

-- Enhanced trailing whitespace remover
map('n', '<leader>rt', function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local original_line_count = vim.fn.line('$')

    vim.cmd([[
        let save_search = @/
        %s/\s\+$//e
        let @/ = save_search
    ]])

	vim.cmd([[nohlsearch]])

    vim.api.nvim_win_set_cursor(0, cursor_pos)

    local new_line_count = vim.fn.line('$')
    if new_line_count == original_line_count then
        print("No trailing whitespace found")
    else
        print("Trailing whitespaces removed")
    end
end, { desc = "Clear trailing whitespaces" })

map("n", "<leader>rc", function()
	local ft =  vim.bo.filetype
	local cursor_pos = vim.api.nvim_win_get_cursor(0)


	local patterns = {
		c = "\\/\\/.*/",
		c3 = "\\/\\/.*/",
		cpp = "\\/\\/.*/",
		json = "\\/\\/.*/",
		jsonc = "\\/\\/.*/",
	}

	local pattern = patterns[ft]

	if not pattern then
		print("No comment pattern defined for filetype: " .. ft)
		return
	end

	vim.cmd("%s/" .. pattern)
	vim.cmd([[g/^\s*$/d]])
	pcall(vim.api.nvim_win_set_cursor, 0, cursor_pos)
	vim.cmd([[nohlsearch]])
end,
{ desc = "Remove all comments" })
