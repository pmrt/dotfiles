local utils = require('core.utils')

M = {}

local builtin_buttons = {
  {"-", "", ""},
  {"f", "  Find file", ":Telescope find_files <CR>"},
  {"e", "  New file", ":ene <BAR> startinsert <CR>"},
  {"r", "  Recently used files", ":Telescope oldfiles <CR>"},
  {"t", "  Find text", ":Telescope live_grep <CR>"},
  {"c", "  Configuration", ":e ~/.config/nvim <CR>"},
  {"q", "  Quit Neovim", ":qa<CR>"},
}

function M.create(custom_buttons)
  local dashboard = require('alpha.themes.dashboard')
  local buttons = utils.merge(builtin_buttons, custom_buttons or {})

  dashboard.section.header.val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  }

  local val = {}
  for i, button in ipairs(buttons) do
    val[i] = dashboard.button(unpack(button))
  end
  dashboard.section.buttons.val = val
  dashboard.section.footer.vl = ""
  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true

  return dashboard
end

return M
