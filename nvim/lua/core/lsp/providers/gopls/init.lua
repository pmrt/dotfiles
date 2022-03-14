local opts = {
  format = true,
  settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
  },
  on_attach = function()
    require('core.lsp.providers.gopls.extra').setup()
  end,
}

return opts
