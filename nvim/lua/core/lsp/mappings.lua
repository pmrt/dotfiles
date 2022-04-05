local M = {}

function M.on_attach(client, bufnr)
  local map = require('core.utils').buf_map

  -- ref: ':help vim.lsp.*'
  map(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
  map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  map(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
  map(bufnr, 'n', 'gn', '<cmd>lua vim.lsp.buf.rename()<cr>')

  -- diagnostics
  map(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<cr>')
  map(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<cr>')
  map(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<cr>')
  map(bufnr, 'n', '<leader>ge', '<cmd>Telescope diagnostics bufnr=0<cr>')

  -- hover
  map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

  -- formatting
  map(bufnr, 'n', '<leader>gf', '<cmd>lua vim.lsp.buf.formatting()<cr>')
  map(bufnr, 'v', '<leader>gf', '<cmd>lua vim.lsp.buf.range_formatting()<cr>')

  -- lsp workspace
  map(bufnr, 'n', '<leader>wd', '<cmd>Telescope diagnostics<cr>')

  if client.name == 'tsserver' then
    -- typescript helpers
    map(bufnr, 'n', '<leader>gr', ':TSLspRenameFile<CR>')
    map(bufnr, 'n', '<leader>go', ':TSLspOrganize<CR>')
    map(bufnr, 'n', '<leader>gi', ':TSLspImportAll<CR>')
  end
end

return M
