-- Disable some vim plugins
local disabled_builtins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
  'filetype', -- disabling this requires filetype.nvim
}
for _, plugin in pairs(disabled_builtins) do
  vim.g['loaded_' .. plugin] = 1
end

local modules = {
  'editor',
  'compiled',
  'plugins',
  'mappings',
}
for _, mod in ipairs(modules) do
  local ok, err = pcall(require, mod)
  if mod == 'compiled' and not ok then
    vim.notify('Run :PackerCompile', vim.log.levels.WARN)
  elseif not ok then
    error(('Error loading %s...\n\n%s'):format(mod, err))
  end
end
