-- Ref: https://cs.opensource.google/go/x/tools/+/refs/tags/gopls/v0.7.5:gopls/doc/vim.md;drc=cadd57e39904f207f1c67334882bdf16e26c117b

function goimports(timeout_ms)
  local context = { only = { "source.organizeImports" } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  print(vim.inspect(result[0]))
  -- if not result or next(result) == nil or table.getn(result) == 0 then return end
  if not result then return end
  if not result[1] then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end

local M = {}

-- Setup go imports and omnifunc
M.setup = function ()
  vim.api.nvim_exec(
  [[
  augroup GoExtraGroup
    autocmd!
    autocmd BufWritePre *.go lua goimports(1000)
    autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
  augroup END 
  ]], false)
end

return M
