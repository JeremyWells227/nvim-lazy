HOME = os.getenv("HOME")

vim.g.mapleader = ' '
vim.opt.backspace = "indent,eol,start"
vim.opt.completeopt = "menuone,noselect,noinsert"

vim.o.startofline=true

vim.opt.showmatch = true
vim.opt.scrolloff = 8
vim.opt.synmaxcol = 300
vim.opt.laststatus = 2
vim.opt.termguicolors=true
vim.opt.guicursor=""

vim.opt.encoding="utf-8"
vim.opt.showmode=false
vim.cmd([[
filetype plugin indent on
syntax on 
nnoremap <SPACE> <nop>
set mouse=
]])
vim.opt.background = "dark"
vim.opt.bs="2"
vim.opt.hlsearch=false
vim.opt.wildmenu=true
vim.opt.wildignore = vim.opt.wildignore+'node_modules,deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'
vim.opt.autoread=true
vim.opt.tabstop=2 
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.cursorline=true
vim.opt.swapfile=false
vim.opt.shortmess=vim.opt.shortmess+"c"
vim.opt.showtabline=2
vim.opt.incsearch=true
vim.opt.mps = vim.o.mps .. ",<:>"
vim.g.python3_host_prog = '/usr/bin/env python3'
vim.g.python_host_prog  = '/usr/bin/env python'
vim.diagnostic.config{
	underline=false
}

