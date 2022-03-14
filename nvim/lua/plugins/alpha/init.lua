local plugin = require('alpha')
local dashboard_builder = require('plugins.alpha.dashboard_builder')

local ok, custom_buttons = pcall(require, 'plugins.alpha.custom')
if not ok then
  custom_buttons = {}
end

plugin.setup(
  dashboard_builder.create(custom_buttons).opts
)
