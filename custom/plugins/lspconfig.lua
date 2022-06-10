local M = {}

local servers = {
  "svelte",
  "bashls",
  "gopls",
  "rust_analyzer",
  "tsserver",
  "volar",
  "jsonls",
  "sumneko_lua",
  "intelephense",
  "pyright",
  "sqls",
  "yamlls",
  "lemminx",
  "html",
  "cssls",
}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities,
    }
  end
end

return M
