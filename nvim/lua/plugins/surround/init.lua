local surround = require('nvim-surround')

surround.setup({
  keymaps = { -- vim-surround style keymaps
    insert = "ys",
    visual = "S",
    delete = "ds",
    change = "cs",
  },
  delimiters = {
    pairs = {
      ["("] = { "( ", " )" },
      [")"] = { "(", ")" },
      ["{"] = { "{ ", " }" },
      ["}"] = { "{", "}" },
      ["<"] = { "< ", " >" },
      [">"] = { "<", ">" },
      ["["] = { "[ ", " ]" },
      ["]"] = { "[", "]" },
    },
    separators = {
      ["'"] = { "'", "'" },
      ['"'] = { '"', '"' },
      ["`"] = { "`", "`" },
    },
    HTML = {
      ["t"] = true, -- Use "t" for HTML-style mappings
    },
    aliases = {
      ["a"] = ">", -- Single character aliases apply everywhere
      ["b"] = ")",
      ["B"] = "}",
      ["r"] = "]",
      ["q"] = { '"', "'", "`" }, -- Table aliases only apply for changes/deletions
    },
  },
  highlight_motion = {
    duration = 0,
  }
})

local go = require('plugins.surround.go')

local SurroundGroup = vim.api.nvim_create_augroup('SurroundGroup', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    surround.buffer_setup(go)
  end,
  group = SurroundGroup,
})
