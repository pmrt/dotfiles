return {
  -- Themes: catppuccin, inspired-github
  theme = 'rose-pine',
  border = 'rounded',
  lsp = {
    format_on_save = true,
    rename_notification = true,
    ensure_servers = {
      "bashls",
      "svelte",
      "tsserver",
      "volar", -- vuew
      "rust_analyzer",
      "gopls",
      "html",
      "jsonls",
      "sumneko_lua",
      "zeta_note", -- md
      "intelephense", -- php
      "pyright", -- python
      "yamlls", -- yaml
      "lemminx", -- xml
    },
  },
  ts = {
    max_lines = 10000,
    sync_install = false,
    ensure_installed = {
      "bash",
      "go",
      "css",
      "html",
      "javascript",
      "typescript",
      "tsx",
      "svelte",
      "vue",
      "jsdoc",
      "json",
      "jsonc",
      "c",
      "cpp",
      "lua",
      "java",
      "toml",
      "rust",
      "yaml",
      "php",
      "rust",
      "norg",
    }
  },
  logger = {
    title = 'Neovim',
    timeout = 500,
  }
}
