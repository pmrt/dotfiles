local ok, installer = pcall(require, "nvim-lsp-installer")
if not ok then
  return
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

  -- Add here custom options for each language server
  -- if sv.name == "jsonl" then
    -- local jsonls_opts = require("user.lsp.settings.jsonls")
    -- opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  -- end

  sv:setup(opts)
end)
