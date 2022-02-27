local fmt = require 'formatter'

local prettier = function()
 return {
    exe = "prettierd",
    args = {vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    stdin = true
  }
end

fmt.setup({
  filetype = {
    javascript = {prettier},
    typescript = {prettier},
    typescriptreact = {prettier},
    svelte = {prettier},
    html = {prettier},
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.js,*.svelte,*.tsx,*.html FormatWrite
augroup END
]], true)
