local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local function merge(t1, t2)
  local res = {}
	for _, v in ipairs(t1) do
		table.insert(res, v)
	end
	for _, v in ipairs(t2) do
		table.insert(res, v)
	end
  return res
end

local js_filetypes = { "javascript", "javascriptreact", "svelte", "typescript", "typescriptreact" }

-- TODO - setup prettier with plugin for svelte
null_ls.setup({
  sources = {
    -- null_ls.builtins.diagnostics.eslint_d.with({
    --   filetypes = js_filetypes
    -- }),
    -- null_ls.builtins.code_actions.eslint_d.with({
    --   filetypes = js_filetypes
    -- }),
    null_ls.builtins.formatting.prettierd.with({
      filetypes = merge(
        js_filetypes,
        { "html" }
      )
    })
  },
  on_attach = require("user.lsp.handlers").on_attach
})
