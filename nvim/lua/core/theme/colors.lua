local cfg = require('config')
local theme_cfg = require('core.theme')

local colors = {}

for _, theme in pairs(theme_cfg.supported) do
  if theme == cfg.theme then
    colors = require('core.theme.themes.' .. theme)
  end
end

if vim.tbl_isempty(colors) then
  return false
end

return colors




