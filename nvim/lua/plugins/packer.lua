local first_install = false

local ok, packer = pcall(require, 'packer')
if not ok then
  local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  print('Cloning packer...')
  vim.fn.delete(packer_path, 'rf')
  vim.fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    '--depth',
    '20',
    packer_path,
  })
  vim.cmd('packadd packer.nvim')
  ok, packer = pcall(require, 'packer')

  if ok then
    print('Packer installed')
    first_install = true
  else
    error("Couldn't clone packer !\nPacker path: " .. packer_path .. '\n' .. packer)
  end
end

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
    prompt_border = 'rounded',
  },
  git = {
    clone_timeout = 800,
  },
  compile_path = vim.fn.stdpath('config') .. '/lua/compiled.lua',
  snapshot_path = vim.fn.stdpath('config') .. '/snapshots',
  auto_clean = true,
  compile_on_sync = true,
  -- Packer logs are very important to me as they are the entry point for fixing
  -- plugins
  log = { level = 'debug' },
})

return {
  packer = packer,
  first_install = first_install,
}
