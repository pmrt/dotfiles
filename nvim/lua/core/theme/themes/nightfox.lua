local variant = 'dawnfox'
local pallet = require('nightfox.pallet').load(variant)
local spec = require('nightfox.spec').load(variant)

local colors = {
  white = pallet.fg2,
  bg = pallet.bg1,
  bg_highlight = pallet.bg2,
  normal = pallet.blue,
  insert = pallet.cyan,
  command = pallet.orange,
  visual = pallet.magenta,
  replace = pallet.red,
  diffAdd = spec.diff.add,
  diffModified = spec.diff.change,
  diffDeleted = spec.diff.delete,
  trace = spec.diag.info,
  hint = spec.diag.hint,
  info = spec.diag.info,
  error = spec.diag.error,
  warn = spec.diag.warn,
  floatBorder = pallet.fg3,
  selection_caret = pallet.sel1,
}

return colors
