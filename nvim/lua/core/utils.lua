local M = {}

function M.merge(...)
  return vim.tbl_deep_extend('force', ...)
end

function M.merge_list(tbl1, tbl2)
  for _, v in ipairs(tbl2) do
    table.insert(tbl1,v)
  end
  return tbl1
end

function M.merge_list_copy(tbl1, tbl2)
  local ret = {}
  for i, v in ipairs(tbl1) do
    table.insert(ret, v)
  end
  for i, v in ipairs(tbl2) do
    table.insert(ret, v)
  end
  return ret
end

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = M.merge(options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.buf_map(bufnr, mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = M.merge(options, opts)
  end
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
end

M.set_highlight = function(hi, colors)
  local hi_str = ''

  for k, v in pairs(colors) do
    hi_str = hi_str .. k .. '=' .. v .. ' '
  end

  vim.cmd(('hi %s %s'):format(hi, hi_str))
end

M.get_highlight = function(hi)
  local hi_str = vim.api.nvim_command_output(('hi %s'):format(hi))

  local colors = {}
  for key, val in string.gmatch(hi_str, '(%w+)=(%S+)') do
    colors[key] = val
  end

  return colors
end

return M

