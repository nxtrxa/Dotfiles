local o = vim.opt

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true

o.number = true
o.relativenumber = true

o.linebreak = true
o.scrolloff = 14
o.sidescrolloff = 7

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

o.grepprg = "rg --vimgrep"
o.grepformat = "%f:%l:%c:%m"
o.tags = "./tags/,tags;"

o.termguicolors = true

o.signcolumn = "yes"
o.showmatch = true
o.showmode = false
o.matchtime = 2
o.completeopt = "menuone,noinsert,noselect"
o.pumheight = 10
o.pumblend = 10
o.winblend = 0
o.conceallevel = 0
o.concealcursor = ""
o.lazyredraw = false
o.redrawtime = 10000
o.maxmempattern = 20000
o.synmaxcol = 300
-- o.fillchars = { eob = " " }
o.updatetime = 300
o.timeoutlen = 500
o.ttimeoutlen = 0
o.autoread = true
o.autowrite = false

o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = true
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
o.undodir = undodir

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99

o.splitbelow = true
o.splitright = true

o.modifiable = true
o.hidden = true
o.errorbells = false
o.backspace = "indent,eol,start"
o.autochdir = false
o.iskeyword:append("-")
o.path:append("**")
o.selection = "inclusive"
o.mouse = "a"
o.clipboard:append("unnamedplus")
o.encoding = "UTF-8"
o.wildmenu = true
o.wildmode = "longest:full,full"
o.wildignorecase = true

o.cursorlineopt = "both"
o.cursorline = true
-- o.guicursor =
-- 	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
o.diffopt:append("linematch:60")
