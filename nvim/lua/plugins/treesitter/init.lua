local plugin = require('nvim-treesitter.configs')
local colors = require('core.theme.colors')
local config = require('config')
local Logger = require('logger')

local enable = true
local lines = vim.fn.line('$')

if lines > config.ts.max_lines then
  enable = false
  Logger:info('Big file detected, disabling some highlighting features')
end

plugin.setup({
  highlight        = {
    enable = enable,
    disable = { "" }, -- list of disabled languages
    additional_vim_regex_highlighting = true,
  },
  indent           = {
    enable = true,
    disable = { "yaml" },
  },
  ensure_installed = config.ts.ensure_installed,
  sync_install     = config.ts.sync_install,
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  textobjects      = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]l"] = "@loop.outer",
        ["]c"] = "@conditional.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[c"] = "@conditional.outer",
        ["[l"] = "@loop.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    -- show textobject surrounding definition
    lsp_interop = {
      enable = true,
      border = 'rounded',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
    -- swap the node under the cursor with next/previous one
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
  rainbow          = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than n lines, int
    colors = colors.rainbow, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autotag          = {
    enable = true,
    -- filetypes = { "html" , "xml" },
  },
  autopairs        = {
    enable = true,
  },
  refactor         = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = false },
    navigation = {
      enable = false, -- use navigator
      keymaps = {
        goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
        list_definitions = "gnD", -- mapping to list all definitions in current file
        list_definitions_toc = "gO", -- gT navigator
        -- goto_next_usage = "<c->>",
        -- goto_previous_usage = "<c-<>",
      },
    },
  },
})
