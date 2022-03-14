local dap = require('dap')
local utils = require('core.utils')
local map, bmap = utils.map, utils.buf_map

dap.adapters.go = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = {nil, stdout},
    args = {'dap', '-l', '127.0.0.1:' .. port},
    detached = true
  }
  handle, pid_or_err = vim.loop.spawn('dlv', opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print('dlv exited with code', code)
    end
  end)
  assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require('dap.repl').append(chunk)
      end)
    end
  end)
  -- Wait for delve to start
  vim.defer_fn(
    function()
      callback({type = 'server', host = '127.0.0.1', port = port})
    end,
    100)
end

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug',
    request = 'launch',
    program = '${file}'
  },
  {
    type = 'go',
    name = 'Debug test', -- configuration for debugging test files
    request = 'launch',
    mode = 'test',
    program = '${file}'
  },
  -- works with go.mod packages and sub packages
  {
    type = 'go',
    name = 'Debug test (go.mod)',
    request = 'launch',
    mode = 'test',
    program = './${relativeFileDirname}'
  }
}

map("n", "<leader>dc", ":lua require'dap'.continue()<cr>")
map("n", "<leader>dq", ":lua require'dap'.disconnect()<cr>")
map("n", "<leader>dl", ":lua require'dap'.step_into()<cr>")
map("n", "<leader>dk", ":lua require'dap'.step_out()<cr>")
map("n", "<leader>dj", ":lua require'dap'.step_over()<cr>")
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<cr>")
map("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<leader>dr", ":lua require'dap'.repl.open()<cr>")
function _G.dap_mappings()
  -- mappings while in dap-repl buffer
  bmap(0, "n", "c", ":lua require'dap'.continue()<cr>")
  bmap(0, "n", "q", ":lua require'dap'.disconnect()<cr>")
  bmap(0, "n", "l", ":lua require'dap'.step_into()<cr>")
  bmap(0, "n", "k", ":lua require'dap'.step_out()<cr>")
  bmap(0, "n", "j", ":lua require'dap'.step_over()<cr>")
end

vim.cmd([[
  augroup DapMappingsGroup
    autocmd!
    autocmd FileType dap-repl call v:lua.dap_mappings()
  augroup END
]])
