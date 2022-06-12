local indent_size = 2

local cmd, o, g = vim.cmd, vim.opt, vim.g

g.mapleader = ' '

-- General
o.syntax = 'on'
o.backspace = { 'eol', 'indent', 'start' }
o.clipboard = 'unnamedplus'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
o.conceallevel = 0 -- determines visibility of ``, **, etc. in md
o.undofile = true
o.backup = false
o.writebackup = false
o.swapfile = false
o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

-- UI Elements
o.cursorline = true
o.number = true
o.splitbelow = true -- force horizontal splits to go below cursor
o.splitright = true -- force horizontal splits to go to the right of the cursor
o.signcolumn = 'yes'
o.scrolloff = 8 -- min. lines to keep above and below cursor
-- o.scidescrolloff = 8 -- same as above, but horizontally
o.showmode = false
-- UI Behaviour
o.relativenumber = false
o.mouse = 'a'
o.lazyredraw = true -- no redraw when executing macros, register, etc.
o.expandtab = true -- conver tabs to spaces
o.autoindent = true
o.smartindent = true
o.softtabstop = indent_size
o.shiftwidth = indent_size
o.tabstop = indent_size
o.wrap = false
o.termguicolors = true
o.whichwrap:append('<', '>', '[', ']', 'h', 'l')
o.fillchars:append('eob: ')
o.laststatus = 3 -- statusline. 0=never, 1=>=2windows, 2=always 3=global
o.completeopt = { 'menu', 'menuone', 'noselect' }
o.shortmess = o.shortmess + { c = true }
-- UI sizes
o.textwidth = 80 -- max col. size
o.pumheight = 10 -- pop up menu height
o.cmdheight = 1
o.numberwidth = 4

-- Performance
o.timeoutlen = 250 -- timeout for key mapping combos
o.ttimeoutlen = 10 -- timeout to wait for sequence to complete
o.updatetime = 100 -- debounce for writing swap file to disk and cursorhold
o.redrawtime = 1500
o.synmaxcol = 110

cmd([[
  filetype plugin indent on

  augroup TrimWhiteSpacesGroup
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END

  " Auto resize windows on resize event
  augroup WinResizeGroup
    autocmd!
    autocmd VimResized * wincmd =
  augroup END
]])
