local plugin = require('lsp_signature')
local config = require('config')

plugin.setup({
  toggle_key = [[<C-x>]],
  floating_window = true,
  bind = true,
  handler_opts = {
    border = config.border,
  },
  floating_window_above_cur_line = false,
})
