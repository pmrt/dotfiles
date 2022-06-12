local p = require('core.theme.colors')
if p == nil or p == false then
  return
end

-- black        = '#1c1e26',
-- white        = '#6C6F93',
-- red          = '#F43E5C',
-- green        = '#09F7A0',
-- blue         = '#25B2BC',
-- yellow       = '#F09383',
-- gray         = '#E95678',
-- darkgray     = '#1A1C23',
-- lightgray    = '#2E303E',
-- inactivegray = '#1C1E26',
local colors = {
  black        = p.bg,
  white        = p.white,
  red          = p.error,
  green        = p.diffAdd,
  blue         = p.info,
  yellow       = p.gold,
  gray         = p.selection_caret,
  darkgray     = p.floatBorder,
  lightgray    = p.white,
  inactivegray = p.bg_highlight,
}
local theme = {
  normal = {
    a = { bg = p.normal, fg = p.bg, gui = 'bold' },
    b = { bg = p.bg, fg = p.white },
    c = { bg = p.bg, fg = p.selection_caret }
  },
  insert = {
    a = { bg = p.insert, fg = colors.black, gui = 'bold' },
    b = { bg = p.bg, fg = p.white },
    c = { bg = p.bg, fg = p.selection_caret }
  },
  visual = {
    a = { bg = p.visual, fg = colors.black, gui = 'bold' },
    b = { bg = p.bg, fg = p.white },
    c = { bg = p.bg, fg = p.selection_caret }
  },
  replace = {
    a = { bg = p.replace, fg = colors.black, gui = 'bold' },
    b = { bg = p.bg, fg = p.white },
    c = { bg = p.bg, fg = p.selection_caret }
  },
  command = {
    a = { bg = p.command, fg = colors.black, gui = 'bold' },
    b = { bg = p.bg, fg = p.white },
    c = { bg = p.bg, fg = p.selection_caret }
  },
  inactive = {
    a = { bg = p.bg, fg = p.selection_caret, gui = 'bold' },
    b = { bg = p.bg, fg = p.selection_caret },
    c = { bg = p.bg, fg = p.selection_caret }
  }
}

require('lualine').setup({
  options = {
    theme = theme,
    globalstatus = true,
  }
})
