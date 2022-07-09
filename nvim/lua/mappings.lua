local map = require('core.utils').map

-- Window nav.
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
-- Don't exit indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')
-- Center cursor when navigating
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
-- Resizing
map('n', '˙', ':vertical resize +2<CR>') -- alt+h
map('n', '<A-h>', ':vertical resize +2<CR>') -- alt+h
map('n', '¬', ':vertical resize -2<CR>') -- alt+l
map('n', '<A-l>', ':vertical resize -2<CR>') -- alt+l
map('n', '˚', ':resize -2<CR>') -- alt+k
map('n', '<A-k>', ':resize -2<CR>') -- alt+k
map('n', '∆', ':resize +2<CR>') -- alt+j
map('n', '<A-j>', ':resize +2<CR>') -- alt+j
-- Remove hls
map('n', '<leader>h', ':nohls<CR>')
-- Easy rotate windows
map('n', '<leader>r', ':wincmd r<CR>')

-- Editing
-- Duplicate current line
map("n", "P", ":co.<CR>")
-- Paste in the next line with a blank line of sep
map("n", "π", "o<Esc>pk^")

-- Quick save and quit
map('n', '<C-w>', ':w<CR>')

map('i', '<C-w>', '<Esc>:w<CR>i<Right>')
map('n', '<C-q>', '<Esc>:wqa<CR>')
map('i', '<C-q>', '<Esc>:wqa<CR>')
-- Avoid default yanking when deleting to clipboard (pasting to black hole)
map('n', 'd', '"_d')
map('v', 'd', '"_d')
-- Avoid default yanking when pasting
map("v", "p", '"_dP')
-- double 'o' or 'O' inserts a new line and goes back to the same position
map("n", "oo", "o<Esc>k")
map("n", "OO", "O<Esc>j")
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
-- map("x", "<A-j>", ":move '>+1<CR>gv-gv")
-- map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Marks
-- Go-to fix for keyboards layouts with accents
map("n", "à", "`a")
map("n", "è", "`e")
map("n", "ì", "`i")
map("n", "ò", "`o")
map("n", "ù", "`u")

-- neotest
-- Run nearest test
map("n", "<leader>tt", "<Cmd>lua require('neotest').run.run()<CR>")
-- Run tests for current file
map("n", "<leader>tf", "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
-- Open output
map("n", "<leader>te", "<Cmd>lua require('neotest').output.open({enter=true})<CR>")
-- Summary
map("n", "<leader>ts", "<Cmd>lua require('neotest').summary.toggle()<CR>")

-- Jumps between failed
map("n", "[t", "<Cmd>lua require('neotest').jump.prev({ status = 'failed')<CR>")
map("n", "]t", "<Cmd>lua require('neotest').jump.next({ status = 'failed')<CR>")

-- Quickfix
map("n", "]q", ":cnext<cr>zz")
map("n", "[q", ":cprev<cr>zz")
map("n", "<leader>qc", ":ccl<cr>")
map("n", "<leader>qlc", ":lcl<cr>")
map("n", "<leader>qq", ":copen<cr>")
map("n", "<leader>ql", ":lopen<cr>")
-- Make
map("n", "<leader>m", "<cmd>make<cr>")

-- GTD
map("n", "<leader>nv", ":Neorg gtd views<cr>")
map("n", "<leader>ne", ":Neorg gtd edit<cr>")
map("n", "<leader>nc", ":Neorg gtd capture<cr>")

function _G.ToggleCmdline()
  if vim.o.cmdheight == 1 then
    vim.o.cmdheight = 0
  else
    vim.o.cmdheight = 1
  end
end

map("n", "<leader>l", "<cmd>lua ToggleCmdline()<CR>")

-- Toggleterm
-- map("n", "<leader>/", "<cmd>ToggleTerm<CR>")
-- map("t", "<leader>/", "<cmd>ToggleTerm<CR>")

local ToggleTermGroup = vim.api.nvim_create_augroup('ToggleTermGroup', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = 'term://*toggleterm#*',
  callback = function()
    map('t', '<esc>', [[<C-\><C-n>]])
    map('t', 'jk', [[<C-\><C-n>]])
    map('t', '<C-h>', [[<C-\><C-n><C-W>h]])
    map('t', '<C-j>', [[<C-\><C-n><C-W>j]])
    map('t', '<C-k>', [[<C-\><C-n><C-W>k]])
    map('t', '<C-l>', [[<C-\><C-n><C-W>l]])
    vim.opt.statusline = "%= T" .. vim.api.nvim_buf_get_var(0, 'toggle_number')
    vim.opt.laststatus = 3
  end,
  group = ToggleTermGroup,
})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'term://*toggleterm#*',
  callback = function()
    vim.opt.statusline = "%= T" .. vim.api.nvim_buf_get_var(0, 'toggle_number')
    vim.opt.laststatus = 3
  end,
  group = ToggleTermGroup,
})
vim.api.nvim_create_autocmd('BufLeave', {
  pattern = 'term://*toggleterm#*',
  callback = function()
    vim.opt.laststatus = 0
  end,
  group = ToggleTermGroup,
})

-- Fix links if netrw is disabled
map('n', 'gx', ':execute "!open " . shellescape(expand("<cfile>"), 1)<CR>')
