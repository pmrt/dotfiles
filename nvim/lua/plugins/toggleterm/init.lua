local toggleterm = require('toggleterm')
local colors = require('core.theme.colors')

toggleterm.setup({
  -- size can be a number or function which is passed the current terminal
  size = 10,
  open_mapping = [[<c-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  highlights = {
    -- highlights which map to a highlight group name and a table of connection successful it's values
    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    Normal = {
      -- guibg = colors.normal,
    },
    NormalFloat = {
      link = 'Normal'
    },
    FloatBorder = {
      guifg = colors.floatBorder,
    },
  },
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = false,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
})
