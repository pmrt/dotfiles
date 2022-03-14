
local needed_version = 'nvim-0.7'

if vim.fn.has(needed_version) == 0 then
  error('This config requires neovim version: ' .. needed_version)
end

do
  local ok, _ = pcall(require, 'impatient')
  if not ok then
    vim.notify('Missing impatient', vim.log.levels.WARN)
  end
end

local ok, err = pcall(require, 'core')
if not ok then
  error(('Error loading core\n\n%s'):format(err))
end
