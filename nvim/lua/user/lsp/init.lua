local ok, _ = pcall(require, "lspconfig")
if not ok then
  return
end

require("user.lsp.installer")
require("user.lsp.handlers").setup()

-- Extra tools for each language
require("user.lsp.languages.go.extra").setup() -- goimports, omnifunc (ctrl+x, ctrl_o)
