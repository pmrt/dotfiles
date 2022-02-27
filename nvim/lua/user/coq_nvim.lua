vim.g.coq_settings = {
  keymap = {
    recommended = false,
    jump_to_mark = '<c-d>',
    bigger_preview = '<c-b>',
  },
  auto_start = 'shut-up',
}

local map = vim.api.nvim_set_keymap
map('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
map('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
map('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
map('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
