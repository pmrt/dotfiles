local theme = require('core.theme.themes.rose-pine.palette')

return {
  white = theme.text,
  bg = theme.base,
  bg_highlight = theme.highlight_high,
  normal = theme.pine,
  insert = theme.gold,
  command = theme.text,
  visual = theme.rose,
  replace = theme.love,
  diffAdd = theme.pine,
  diffModified = theme.gold,
  diffDeleted = theme.love,
  trace = theme.love,
  hint = theme.iris,
  info = theme.foam,
  error = theme.love,
  warn = theme.gold,
  floatBorder = theme.highlight_med,
  selection_caret = theme.highlight_high,
  rainbow = {
    "#ffffff",
    "#ebbcba",
    "#e0defa",
    "#c4a7e7",
    "#908caa",
    "#56526e",
  }
}
