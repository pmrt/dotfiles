local variant = 'dawnfox'
local pallet = require('nightfox.palette').load(variant)
local spec = require('nightfox.spec').load(variant)

local colors = {
  white = pallet.fg2,
  bg = pallet.bg1,
  bg_highlight = pallet.bg2,
  normal = pallet.blue.base,
  insert = pallet.cyan.base,
  command = pallet.orange.base,
  visual = pallet.magenta.base,
  replace = pallet.red.base,
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
  rainbow = {
    pallet.blue.base,
    pallet.orange.base,
    pallet.yellow.base,
    pallet.red.base,
    pallet.cyan.base,
    pallet.pink.base,
    pallet.magenta.base,
  }
}

return colors
