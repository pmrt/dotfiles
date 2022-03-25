local icons = require('core.theme.icons')
local config = require('config')

local signs = {
  Error = icons.error .. ' ',
  Warn = icons.warn .. ' ',
  Hint = icons.hint .. ' ',
  Info = icons.info .. ' ',
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- set up vim.diagnostics
-- vim.diagnostic.config opts
vim.diagnostic.config({
  underline = true,
  signs = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    border = config.border,
    focusable = false,
    header = { icons.debug .. ' Diagnostics:', 'Normal' },
    source = 'always',
  },
  virtual_text = {
    spacing = 4,
    source = 'always',
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
  },
})
