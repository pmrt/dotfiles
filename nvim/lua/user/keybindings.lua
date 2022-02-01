local opts = {
  noremap = true,
  silent = true
}
local term_opts = {
  silent = true
}

local map = vim.api.nvim_set_keymap

-- Leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal => n
--  insert => i
--  visual => v
--  visual_block_mode => x
--  term_mode => t
--  command_mode => c

--  # Navigation #

-- Window nav.
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
-- Terminal nav.
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- Buffer nav.
map("n", "L", ":bnext<CR>", opts)
map("n", "H", ":bprevious<CR>", opts)
-- Escape
map("i", "kj", "<ESC>", opts)
map("i", "jk", "<ESC>", opts)
-- Don't exit indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
-- Previous buffer with Alt + o
map("n", "ø", ":b#<CR>", opts)
-- Center cursor when navigating
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- # UI #

-- Remove highlight
map("n", "<leader>h", ":nohls<CR>", opts)

-- # Editing #

-- Quick save
map("n", "<C-w>", ":w<cr>", opts)
map("i", "<C-w>", "<Esc>:w<cr>i<Right>", opts)
-- quick save and exit
-- map("n", "<C-q>", ":wq<cr>", opts)
-- In vim C-Q is c-qq
map("n", "<C-q>", ":wq<cr>", opts)
map("i", "<C-q>", "<Esc>:wq<cr>", opts)
-- Avoid default yanking when deleting to clipboard (pasting to black hole)
map("n", "d", '"_d', opts)
map("v", "d", '"_d', opts)
map("n", "y", '"_y', opts)
map("n", "Y", '"_Y', opts)
map("v", "y", '"_y', opts)
map("v", "Y", '"_Y', opts)
-- Avoid default yanking when pasting
map("v", "p", '"_dP', opts)
-- double 'o' or 'O' inserts a new line and goes back to the same position
map("n", "oo", "o<Esc>k", opts)
map("n", "OO", "O<Esc>j", opts)
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- By default J is to join two lines. So make alt+j to split
map("n", "∆", "i<CR><Esc>", opts)
map("n", "∆", "i<CR><Esc>", opts)
-- Duplicate current line
map("n", "P", ":co.<CR>", opts)

-- Plugins
-- Telescope
map(
  "n",
  "<leader>f",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)
map("n", "<leader>v", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>s", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
-- Nvimtree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- Lazygit
map("n", "<leader>g", ":LazyGit<CR>", opts)
-- ToggleTerm
map("n", "<c-s>", ":7ToggleTerm<CR>", opts)
map("t", "<c-s>", "<Esc><Cmd>7ToggleTerm<CR>", term_opts)
map("n", "<c-d>", ":8ToggleTerm<CR>", opts)
map("t", "<c-d>", "<Esc><Cmd>8ToggleTerm<CR>", term_opts)
