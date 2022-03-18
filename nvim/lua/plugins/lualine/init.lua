local config = require("config")
require('lualine').setup({
  options = {
    theme = config.theme,
    globalstatus = true,
  }
})
