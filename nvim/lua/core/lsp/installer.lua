local installer = require('nvim-lsp-installer')
local config = require('config')
local Logger = require('logger')

installer.settings({
  ui = {
    keymaps = {
      toggle_server_expand = 'i',
      install_server = '<CR>',
      update_server = 'u',
      uinstall_server = 'x',
    }
  }
})

for _, name in pairs(config.lsp.ensure_servers) do
  local is_found, server = installer.get_server(name)
  if is_found and not server:is_installed() then
    Logger:info('LSP: Installing server ' .. name)
    server:install()
  end
end

installer.on_server_ready(function(sv)
  local utils = require('core.utils')

  local default_opts = require('core.lsp.defaults')
  local ok, custom_opts = pcall(require, 'core.lsp.providers.' .. sv.name)
  if not ok then
    custom_opts = {}
  end

  -- TODO Change default_opts name. As it overrides custom_opts
  local opts = utils.merge(custom_opts, default_opts)
  sv:setup(opts)
end)

