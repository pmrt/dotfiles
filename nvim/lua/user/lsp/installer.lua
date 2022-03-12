local installer = require "nvim-lsp-installer"
local coq = require "coq"
local ensure_servers = {
  "bashls",
  "svelte",
  "tsserver",
  "volar", -- vuew
  "rust_analyzer",
  "eslint",
  "gopls",
  "html",
  "jsonls",
  "sumneko_lua",
  "zeta_note", -- md
  "intelephense", -- php
  "pyright", -- python
  "sqls",
  "sqls",
  "yamlls", -- yaml
  "lemminx", -- xml
}
for _, name in pairs(ensure_servers) do
  local is_found, server = installer.get_server(name)
  if is_found and not server:is_installed() then
    print("LSP: Installing server " .. name)
    server:install()
  end
end

installer.on_server_ready(function(sv)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if sv.name == "gopls" then
    local gopls_opts = require("user.lsp.languages.go.opts")
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end

  if sv.name == "tsserver" then
    local ts_opts = require("user.lsp.languages.ts.opts")
    opts = vim.tbl_deep_extend("force", ts_opts, opts)
  end

  if sv.name == "eslint" then
    local eslint_opts = require("user.lsp.languages.eslint.opts")
    opts = vim.tbl_deep_extend("force", eslint_opts, opts)
  end

  -- Add here custom options for each language server
  -- if sv.name == "jsonl" then
    -- local jsonls_opts = require("user.lsp.settings.jsonls")
    -- opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  -- end
  sv:setup(coq.lsp_ensure_capabilities(opts))
end)
