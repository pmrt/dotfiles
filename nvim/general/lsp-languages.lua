-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local lsp_config = require'lspconfig'

-- Lsp_signature plugin
require "lsp_signature".setup()


-- Python
-- npm i -g pyright
lsp_config.pyright.setup{}

-- Bash
-- npm i -g bash-language-server
lsp_config.bashls.setup{}

-- Javascript/Ts/React
-- brew install deno
-- choco install deno

lsp_config.denols.setup{
  init_options = {
    enable = true,
    lint = true,
    unstable = false,
  },
  cmd = { "deno", "lsp" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = lsp_config.util.root_pattern("deps.ts")
}
lsp_config.tsserver.setup{
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim"
  },
  root_dir = lsp_config.util.root_pattern("package.json")
}
-- HTML/CSS/JSON
-- npm i -g vscode-langservers-extractred

-- --Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_config.html.setup {
  capabilities = capabilities,
}

lsp_config.jsonls.setup{
  init_options = {
    provideFormatter = true
  }
}
lsp_config.cssls.setup{
  filetypes = { "css", "scss", "less" },
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  }
}

-- Golang
-- GO111MODULE=on go get golang.org/x/tools/gopls@latest
lsp_config.gopls.setup{
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  root_dir = lsp_config.util.root_pattern("go.mod")
}

-- Rust
-- rustup component add rls rust-analysis rust-src
-- Settings: https://github.com/rust-lang/rls#configuration
lsp_config.rls.setup {
  settings = {
    rust = {
      build_on_save = true,
      all_features = true,
      wait_to_build = 100,
    },
  },
  cmd = { "rls" },
  filetypes = { "rust" },
  root_dir = lsp_config.util.root_pattern("Cargo.toml")
}
