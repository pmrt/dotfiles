local plugin = require('null-ls')
local merge_list_copy = require('core.utils').merge_list_copy

-- conditions
local function has_eslint(utils)
  return utils.root_has_file('.eslintrc')
    or utils.root_has_file('.eslintrc.json')
    or utils.root_has_file('.eslintrc.js')
    or utils.root_has_file('package.json')
end

local function has_prettier(utils)
  return utils.root_has_file('.prettierrc.json')
    or utils.root_has_file('.prettierrc.js')
end

local js_filetypes = { "javascript", "javascriptreact", "svelte", "typescript", "typescriptreact" }

plugin.setup({
  sources = {
    plugin.builtins.diagnostics.eslint_d.with({
      condition = has_eslint,
      filetypes = js_filetypes
    }),
    plugin.builtins.code_actions.eslint_d.with({
      condition = has_eslint,
      filetypes = js_filetypes
    }),
    -- TODO report svelte plugin not working issue here https://github.com/fsouza/prettierd/issues/169
    plugin.builtins.formatting.prettierd.with({
      condition = has_prettier,
      env = {
        PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
      },
      filetypes = merge_list_copy(
        js_filetypes, { "html" }
      ),
    })
  },
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      require('core.lsp.mappings').on_attach(client, bufnr)
        vim.cmd([[
          augroup NulllsFormatingGroup
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
          augroup END
        ]])
    end
    -- custom actions for null-ls
    -- require('core.lsp.defaults').on_attach(client, bufnr)
  end,
})
