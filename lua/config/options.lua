local o = vim.o

-- Indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.wrap = false
o.breakindent = true

-- Search
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = false

-- Appearance
o.number = true
o.relativenumber = true
o.termguicolors = true
o.colorcolumn = '120'
o.signcolumn = 'yes'
o.cmdheight = 1
o.scrolloff = 10
o.completeopt = 'menuone,preview,noinsert,noselect'

-- Behaviour
o.hidden = true
o.swapfile = false
o.backup = false
o.undodir = vim.fn.expand('~/.vim/undodir')
o.undofile = true
o.backspace = 'indent,eol,start'
o.splitright = true
o.splitbelow = true
o.autochdir = false
o.clipboard = 'unnamedplus'
o.mouse = 'a'
