local M = {}

function M.on_attach(client, bufnr)
  local map = require('core.utils').buf_map

  -- ref: ':help vim.lsp.*'
  map(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
  map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  map(bufnr, 'n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>')
  map(bufnr, 'n', 'gt', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>')
  map(bufnr, 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
  map(bufnr, 'n', 'gn', '<cmd>lua require("cosmic-ui").rename()<cr>')

  -- diagnostics
  map(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  map(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  map(bufnr, 'n', 'ge', '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<cr>')
  map(bufnr, 'n', '<leader>ge', '<cmd>Telescope diagnostics bufnr=0<cr>')

  -- hover
  map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

  -- code actions
  map(bufnr, 'n', '<leader>ga', '<cmd>lua require("cosmic-ui").code_actions()<cr>')
  map(bufnr, 'v', '<leader>ga', '<cmd>lua require("cosmic-ui").range_code_actions()<cr>')

  -- formatting
  map(bufnr, 'n', '<leader>gf', '<cmd>lua vim.lsp.buf.formatting()<cr>')
  map(bufnr, 'v', '<leader>gf', '<cmd>lua vim.lsp.buf.range_formatting()<cr>')

  -- lsp workspace
  map(bufnr, 'n', '<leader>wd', '<cmd>Telescope diagnostics<cr>')
  map(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>')
  map(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>')
  map(
    bufnr,
    'n',
    '<leader>wl',
    '<cmd>lua require("cosmic.utils.logger"):log(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>'
  )

  if client.name == 'tsserver' then
    -- typescript helpers
    map(bufnr, 'n', '<leader>gr', ':TSLspRenameFile<CR>')
    map(bufnr, 'n', '<leader>go', ':TSLspOrganize<CR>')
    map(bufnr, 'n', '<leader>gi', ':TSLspImportAll<CR>')
  end
end

return M
