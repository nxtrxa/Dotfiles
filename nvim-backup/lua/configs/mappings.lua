local map = vim.keymap.set

local opts = {
	noremap = true, -- prevent recursive mapping
	silent = true, -- don't print the command to the cli
	buffer = bufnr, -- restrict the keymap to the local buffer number
}

map("n", ";", ":", { desc = "CMD enter command mode" }, opts)
map("n", "<leader>rr", ":restart<CR>", { desc = "Restart neovim" })
map("i", "jk", "<ESC>", opts)

map({ "n", "i", "v" }, "<C-s>", ":wa<CR>", opts)

map("n", "<leader>q", ":q!<CR>", opts)
map("n", "<leader>I", "^", { desc = "Go to begin of line" }, opts)
map("n", "<leader>O", "$", { desc = "Go to begin of line" }, opts)

map("n", "<ESC>", ":nohlsearch<CR>", opts)

map({ "i", "n" }, "<C- >", "<C-x><C-o>")
map({ "i", "n" }, "<C-b>", "<C-x><C-]>")

map("n", "<leader>ct", ":!ctags -R .<CR>", opts)
map("n", "<leader>gt", "<C-]>", opts)
map("n", "<leader>gv", "<C-w>v<C-]>", opts)
map("n", "<leader>gh", "<C-w>s<C-]>", opts)
map("n", "<leader>gd", ":tselect <C-r><C-w><CR>", opts)
map("n", "<leader>gD", ":ptag <C-r><C-w><CR>", opts)

map("n", "<leader>bc", ":bd!<CR>", { desc = "Close buffer" }, opts)
map("n", "<leader>ba", ":%bd!<CR>", { desc = "Close all buffers" }, opts)

map({ "n", "i" }, "<C-y>", ":lua require('MiniFiles').open()<CR>", { desc = "Copy line" })
map({ "n", "i" }, "<C-n>", "<ESC>viwy", { desc = "Copy word" }, opts)

map("n", "<leader>chx", ":!chmod +x %<CR>", { desc = "Make file executable" }, opts)
map("n", "<leader>chw", ":!chmod +w %<CR>", { desc = "Make file writable" }, opts)

map("v", "<leader>'", "c''<ESC>P", opts)
map("v", '<leader>"', 'c""<ESC>P', opts)
map("v", "<leader>(", "c()<ESC>P", opts)
map("v", "<leader>{", "c{}<ESC>P", opts)
map("v", "<leader>[", "c[]<ESC>P", opts)
map("v", "<leader><", "c<><ESC>P", opts)

map("v", '<C-"', ':s/gv/"gv"<CR>', opts)

-- map("i", "'", "''<ESC>i", opts)
-- map("i", '"', '""<ESC>i', opts)
-- map("i", "(", "(, opts)<ESC>i")
-- map("i", "[", "[]<ESC>i", opts)
-- map("i", "{", "{ }<Left><ESC>i", opts)

map("n", "n", "nzzzv", { desc = "Next search result (centered, opts)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered, opts)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered, opts)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered, opts)" })

map("n", "L", "<Cmd>bnext<CR>", { desc = "Next buffer" }, opts)
map("n", "H", "<Cmd>bprevious<CR>", { desc = "Previous buffer" }, opts)

map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" }, opts)
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" }, opts)
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" }, opts)
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" }, opts)

map("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" }, opts)
map("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" }, opts)
map("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" }, opts)
map("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" }, opts)
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" }, opts)
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" }, opts)

map("n", "<leader>e", ":Neotree filesystem reveal left toggle<CR>", { desc = "Toggle File Explorer" }, opts)

map("n", "<leader>nv", ":Neotree show filesystem toggle<CR>", { desc = "Show File Explorer" }, opts)
map("n", "<leader>nb", ":Neotree buffers toggle<CR>", { desc = "Show a list of currently open buffers" }, opts)
map(
	"n",
	"<leader>ng",
	":Neotree git_status toggle<CR>",
	{ desc = "Show the output of git status in a tree layout" },
	opts
)

map("n", "<C-f>", "gg=G<C-o>", { desc = "indent file" }, opts)

map({ "n", "x", "o" }, "<C-m>", function()
	require("flash").jump()
end, { desc = "Flash" })

-- Copy filepath to the clipboard
map("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
	vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" }, opts)

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" }, opts)
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" }, opts)

map("n", "<leader>cc", ":CccPick<CR>", { desc = "Color pick" }, opts)

map({ "n", "t" }, "<C-b>", function()
	vim.cmd([[silent! :FloatermToggle]], opts)
end, { desc = "Toggle floating terminal" })

map("t", "<C-j>", function()
	require("floaterm.api").cycle_term_bufs("prev")
end, { desc = "Previous terminal" })
map("t", "<C-k>", function()
	require("floaterm.api").cycle_term_bufs("next")
end, { desc = "Next terminal" })

map({ "n", "x", "o" }, "s", function()
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

-- native neovim keymaps
-- fzf-lua keymaps
map("n", "<leader>fd", "<cmd>FzfLua lsp_finder<CR>", opts) -- LSP Finder (definition + references)
map("n", "<leader>fr", "<cmd>FzfLua lsp_references<CR>", opts) -- Show all references to the symbol under the cursor
map("n", "<leader>ft", "<cmd>FzfLua lsp_typedefs<CR>", opts) -- Jump to the type definition of the symbol under the cursor
map("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", opts) -- List all symbols (functions, classes, etc.) in the current file
map("n", "<leader>fw", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts) -- Search for any symbol across the entire project/workspace
map("n", "<leader>fi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- Go to implementation

-- === DAP keymaps ===
map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opts) -- Continue / Start
map("n", "<leader>do", ":lua require'dap'.step_over()<CR>", opts) -- Step over
map("n", "<leader>di", ":lua require'dap'.step_into()<CR>", opts) -- Step into
map("n", "<leader>du", ":lua require'dap'.step_out()<CR>", opts) -- Step out
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts) -- Toggle breakpoint
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts) -- Open DAP REPL
map("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", opts)
