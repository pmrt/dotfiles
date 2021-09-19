" auto-format
augroup AutoLSPFormat
  autocmd!
  autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.scss lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
augroup END
