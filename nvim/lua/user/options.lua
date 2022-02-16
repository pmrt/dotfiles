-- :help options

-- # UI #
vim.opt.background = "dark"
vim.opt.mouse = "a" -- allow mouse
-- Rose pine
-- vim.g.rose_pine_disable_talics = true
-- vim.g.rose_pine_variant = "moon"
-- UI Element sizes
vim.opt.textwidth = 80 -- max colum size
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.cmdheight = 1 -- neovim command line height
vim.opt.numberwidth = 4 -- number column width
-- UI Elements
vim.opt.showmode = false -- hide/show the current mode in the command line
vim.opt.showtabline = 0 -- tab mode (0 = hide) 
vim.opt.number = true -- show number column
-- UI Behaviour
vim.opt.splitbelow = true -- force horizontal splits to go below current window
vim.opt.splitright = true -- force vertical splits to go to the right of current window
vim.opt.wrap = false -- prefer one long line instead of wraping (breaking) a long line
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes" -- show/hide sign column. "no" -> auto. hide/show, "yes" -> always
vim.opt.scrolloff = 8 -- min. lines to keep above and below cursor.
-- vim.opt.sidescrolloff = 8 -- same as above, horizontally
vim.opt.whichwrap:append("<", ">", "[", "]", "h", "l")
vim.opt.fillchars:append("eob: ")

-- # General #

vim.opt.clipboard = "unnamedplus" -- clipboard type (unnamedplus shares clipboard between neovim and system)
vim.opt.timeoutlen = 250 -- timeout for key binding combos (ms)
vim.opt.swapfile = false
vim.opt.updatetime = 300 -- debounced timeout (ms) to wait before writting swap file to disk
vim.opt.completeopt = { "menuone", "noselect" } -- completion options, refer to :help options for more info
vim.opt.fileencoding = "utf-8"
vim.opt.conceallevel = 0 -- determines visibility of e.g.: ``, **, in md files (0 = visible)
-- Colors settings
vim.opt.termguicolors = true
-- Search settings
vim.opt.hlsearch = true -- highlight al matches on previous search patterns
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- overrides ignore case if the pattern contains upper case characters
vim.opt.iskeyword:append("-") -- add keywords to match words in patterns, e.g.: test-ui
-- Undo settings
vim.opt.undofile = true -- enable/disable undo history after closing a buffer
-- Backup settings
vim.opt.backup = false -- backup file
vim.opt.writebackup = false -- allow/disallow to edit file if it is being edit by another program
-- Indenting settings
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- number of spaces for indentation
vim.opt.tabstop = 2 -- number of spaces for a tab


vim.api.nvim_exec(
  [[
  " Apply formatoptions on buffer enter.
    augroup FormatGroup
      autocmd!
      autocmd BufEnter * set formatoptions-=cro
    augroup END

  " Auto resize windows on resize event
    augroup WinResizeGroup
      autocmd!
      autocmd VimResized * wincmd =
    augroup END
  
  ]],
  false
)

