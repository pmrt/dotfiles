local indent_size = 2

local o, g, cmd = vim.opt, vim.g, vim.cmd

g.mapleader = ' '

o.matchpairs = { '(:)', '{:}', '[:]', '<:>' }

o.softtabstop = indent_size
o.shiftwidth = indent_size
o.tabstop = indent_size

o.writebackup = false
o.swapfile = false

o.timeoutlen = 250 -- timeout for key mapping combos
o.ttimeoutlen = 10 -- timeout to wait for sequence to complete
o.updatetime = 100 -- debounce for writing swap file to disk and cursorhold
o.redrawtime = 1500
o.synmaxcol = 90
o.lazyredraw = true

o.textwidth = 80 -- max col. size

o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

o.conceallevel = 0 -- determines visibility of ``, **, etc. in md
