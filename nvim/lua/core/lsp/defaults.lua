local config = require('config')

-- Base lsp options
local M = {}

M.flags = {
  debounce_text_changes = 150,
}
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.root_dir = function(fname)
  local util = require('lspconfig').util
  return util.root_pattern('.git')(fname)
    or util.root_pattern('tsconfig.base.json')(fname)
    or util.root_pattern('package.json')(fname)
    or util.root_pattern('.eslintrc.js')(fname)
    or util.root_pattern('tsconfig.json')(fname)
end
M.autostart = true
M.single_file_mode = true
function M.on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- format on save if format = true in server options
  local ok, opts = pcall(require, 'core.lsp.providers.' .. client.name)
  if not ok then
    opts = {}
  end
  local do_format = false
  if opts.format then
    do_format = true
    if config.lsp.format_on_save then
      vim.cmd [[
      augroup LspFormatOnSaveGroup
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 800)
      augroup END
      ]]
    end
  end
  client.resolved_capabilities.document_formatting = do_format
  client.resolved_capabilities.document_range_formatting = do_format

  -- mappings
  require('core.lsp.mappings').on_attach(client, bufnr)
  -- custom on_attach's of each server
  if opts.on_attach then
    opts.on_attach(client, bufnr)
  end
end

return M
