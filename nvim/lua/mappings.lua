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
map('n', '˙', ':vertical resize -2<CR>') -- alt+h
map('n', '¬', ':vertical resize +2<CR>') -- alt+l
map('n', '˚', ':resize +2<CR>') -- alt+k
map('n', '∆', ':resize +2<CR>') -- alt+j
-- Remove hls
map('n', '<leader>h', ':nohls<CR>')

-- Editing
-- Duplicate current line
map("n", "P", ":co.<CR>")
-- Quick save and quit
map('n', '<C-w>', ':w<CR>')
map('i', '<C-w>', '<Esc>:w<CR>i<Right>')
map('n', '<C-q>', '<Esc>:wq<CR>')
map('i', '<C-q>', '<Esc>:wq<CR>')
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
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Quickfix
map("n", "]q", ":cnext<cr>zz")
map("n", "[q", ":cprev<cr>zz")
map("n", "<leader>qc", ":ccl<cr>")
map("n", "<leader>qlc", ":lcl<cr>")
map("n", "<leader>qq", ":copen<cr>")
map("n", "<leader>ql", ":lopen<cr>")
-- Make
map("n", "<leader>m", "<cmd>make<cr>")
