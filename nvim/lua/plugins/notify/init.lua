local notify = require('notify')
local icons = require('core.theme.icons')
local colors = require('core.theme.colors')
local utils = require('core.utils')

notify.setup({
  icons = {
    ERROR = icons.error,
    WARN = icons.warn,
    INFO = icons.info,
    DEBUG = icons.debug,
    TRACE = icons.trace,
  },
  stages = 'slide',
  background_color = colors.bg,
})

local set_hl = utils.set_highlight
set_hl('NotifyINFOBorder', {
  guifg = colors.hint,
})
set_hl('NotifyINFOTitle', {
  guifg = colors.hint,
})
set_hl('NotifyINFOIcon', {
  guifg = colors.hint,
})
set_hl('NotifyWARNBorder', {
  guifg = colors.warn,
})
set_hl('NotifyWARNTitle', {
  guifg = colors.warn,
})
set_hl('NotifyWARNIcon', {
  guifg = colors.warn,
})
set_hl('NotifyERRORBorder', {
  guifg = colors.error,
})
set_hl('NotifyERRORTitle', {
  guifg = colors.error,
})
set_hl('NotifyERRORIcon', {
  guifg = colors.error,
})
set_hl('NotifyTRACEBorder', {
  guifg = colors.trace,
})
set_hl('NotifyTRACETitle', {
  guifg = colors.trace,
})
set_hl('NotifyTRACEIcon', {
  guifg = colors.trace,
})

-- set nvim-notify as the default notify function
vim.notify = notify
