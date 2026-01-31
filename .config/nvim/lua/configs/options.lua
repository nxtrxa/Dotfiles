local o = vim.opt

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true

o.number = true
o.relativenumber = true
o.cursorlineopt = "both" 
o.cursorline = true

o.autoindent = true
o.smartindent = true
o.linebreak = true
o.scrolloff = 14
o.sidescrolloff = 7

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

o.grepprg = "rg --vimgrep"
o.grepformat = "%f:%l:%c:%m"

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

o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = true
--o.updatetime = 300
--o.timeoutlen = 500

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99

o.splitbelow = true
o.splitright = true

vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.selection = "inclusive"
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignorecase = true
