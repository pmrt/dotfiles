local variant = 'duskfox'
local palette = require('nightfox.palette').load(variant)
local spec = require('nightfox.spec').load(variant)

local colors = {
  white = palette.fg2,
  bg = palette.bg1,
  bg_highlight = palette.bg2,
  normal = palette.blue.base,
  insert = palette.cyan.base,
  command = palette.orange.base,
  visual = palette.magenta.base,
  replace = palette.red.base,
  diffAdd = spec.diff.add,
  diffModified = spec.diff.change,
  diffDeleted = spec.diff.delete,
  trace = spec.diag.info,
  hint = spec.diag.hint,
  info = spec.diag.info,
  error = spec.diag.error,
  warn = spec.diag.warn,
  floatBorder = palette.fg3,
  selection_caret = palette.sel1,
  rainbow = {
    palette.blue.base,
    palette.orange.base,
    palette.yellow.base,
    palette.red.base,
    palette.cyan.base,
    palette.pink.base,
    palette.magenta.base,
  }
}

return colors
