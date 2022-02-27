local opts = {
  noremap = true,
  silent = true
}
local term_opts = {
  silent = true
}

local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap

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
-- map("n", "y", '"_y', opts)
-- map("n", "Y", '"_Y', opts)
-- map("v", "y", '"_y', opts)
-- map("v", "Y", '"_Y', opts)
-- Avoid default yanking when pasting
map("v", "p", '"_dP', opts)
-- double 'o' or 'O' inserts a new line and goes back to the same position
map("n", "oo", "o<Esc>k", opts)
map("n", "OO", "O<Esc>j", opts)
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts) map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- By default J is to join two lines. So make alt+j to split
map("n", "∆", "i<CR><Esc>", opts)
map("n", "∆", "i<CR><Esc>", opts)
-- Duplicate current line
map("n", "P", ":co.<CR>", opts)
-- Quickfix
map("n", "]q", ":cnext<cr>zz", opts)
map("n", "[q", ":cprev<cr>zz", opts)
map("n", "<leader>qc", ":ccl<cr>", opts)
map("n", "<leader>qlc", ":lcl<cr>", opts)
map("n", "<leader>qq", ":copen<cr>", opts)
map("n", "<leader>ql", ":lopen<cr>", opts)

map("n", "<leader>m", "<cmd>make<cr>", opts)

-- Plugins
-- Telescope
map(
  "n",
  "<leader>f",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)
map("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
map("n", "<leader>v", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>s", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
-- Nvimtree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- Lazygit
map("n", "<leader>g", ":LazyGit<CR>", opts)
-- ToggleTerm
-- Run last command
-- map("n", "<C-d>", '<Cmd>execute v:count . "ToggleTerm"<CR><Up><CR>', opts)
-- map("i", "<C-d>", '<Cmd>execute v:count . "ToggleTerm"<CR><Up><CR>', opts)
-- Example of keymaps to more terminals
-- map("n", "<c-s>", ":8ToggleTerm<CR>", opts)
-- map("t", "<c-s>", "<Esc><Cmd>8ToggleTerm<CR>", term_opts)

-- Dap
-- Recommended
-- nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
-- nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
-- nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
--
-- Imagine mappings like this:
--         step_out (up)
--             ↑
--           ←   → step_into (next)
--             ↓
--          step_over (down, skip)
-- Then, each direction corresponds to vim maps prepended with <leader>d: l, k, j
map("n", "<leader>dc", ":lua require'dap'.continue()<cr>", opts)
map("n", "<leader>dq", ":lua require'dap'.disconnect()<cr>", opts)
map("n", "<leader>dl", ":lua require'dap'.step_into()<cr>", opts)
map("n", "<leader>dk", ":lua require'dap'.step_out()<cr>", opts)
map("n", "<leader>dj", ":lua require'dap'.step_over()<cr>", opts)
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<cr>", opts)
map("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map("n", "<leader>dr", ":lua require'dap'.repl.open()<cr>", opts)

function _G.dap_mappings()
  bufmap(0, "n", "c", ":lua require'dap'.continue()<cr>", opts)
  bufmap(0, "n", "q", ":lua require'dap'.disconnect()<cr>", opts)
  bufmap(0, "n", "l", ":lua require'dap'.step_into()<cr>", opts)
  bufmap(0, "n", "k", ":lua require'dap'.step_out()<cr>", opts)
  bufmap(0, "n", "j", ":lua require'dap'.step_over()<cr>", opts)
end

function _G.quickfix_mappings()
  -- k and j on quickfix window (also: center and go back to qf)
  bufmap(0, "n", "k", ":cprev<cr>zz<C-w>w", opts)
  bufmap(0, "n", "j", ":cnext<cr>zz<C-w>w", opts)
  -- l for enter and close on quickfix window
  bufmap(0, "n", "l", ":.cc<cr>zz:ccl<cr>", opts)
  -- q for quit on quickfix window
  bufmap(0, "n", "q", ":ccl<cr>", opts)
end

vim.api.nvim_exec(
  [[
  augroup DapMappingsGroup
    autocmd!
    autocmd FileType dap-repl call v:lua.dap_mappings()
  augroup END

  augroup QuickfixMappingsGroup
    autocmd!
    autocmd FileType qf call v:lua.quickfix_mappings()
  augroup END
  ]], false
)
