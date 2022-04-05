local opts = {
  format = true,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
        end,
      },
    },
  },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.completion = true
  end
}

return opts
