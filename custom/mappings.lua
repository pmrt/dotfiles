local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>e"] = "",
  }
}

M.general = {
  n = {
    -- Quit
    ["<C-q>"] = {"<Esc>:wqa <CR>", "Save and quit"},
    -- Save
    ["<C-s>"] = {"<Esc>:w <CR>", "Save"},
    -- Don't yank when deleting
    ["d"] = {'"_d', "+delete"},

    -- Insert a new line and go back to same pos
    ["oo"] = {"o<Esc>k", "New line below"},
    ["OO"] = {"O<Esc>j", "New line above"},

    ["P"] = {"<Cmd>co. <CR>", "Duplicate line"},
    -- Quickfix
    ["]q"] = {"<Cmd>cnext <CR>zz", "Next item in quickfix"},
    ["[q"] = {"<Cmd>cnext <CR>zz", "Prev item in quickfix"},
    ["<leader>qc"] = {"<Cmd>ccl <CR>", "Close quickfix"},
    ["<leader>qlc"] = {"<Cmd>lcl <CR>", "Close local quickfix"},
    ["<leader>qq"] = {"<Cmd>copen <CR>", "Open quickfix"},
    ["<leader>ql"] = {"<Cmd>lopen <CR>", "Open local quickfix"},
    -- Center when navigating search results
    ["n"] = {"nzz", "Next result"},
    ["N"] = {"Nzz", "Next result"},

    ["<leader>m"] = {"<Cmd>make <CR>", "Make"},
    -- Fix links if netrw is disabled
    ["gx"] = {':execute "!open " . shellescape(expand("<cfile>"), 1)<CR>'},

    ["<TAB>"] = {"<cmd>bn<CR>", "  next buffer"},
    ["<S-Tab>"] = {"<cmd>bn<CR>", "  prev buffer"},

    ["<leader>g"] = {"<Cmd>LazyGit <CR>", "Open Lazygit"},

  },
  i = {
    -- Quit (insert)
    ["<C-q>"] = {"<Esc>:wqa <CR>", "Save and quit"},
    -- Save (insert)
    ["<C-s>"] = {"<Esc>:w<CR>i<Right>", "Save"},
  },

  v = {
    -- Don't yank when deleting (visual)
    ["d"] = {'"_d', "+delete"},
    ["p"] = {'"_dP', "paste"},
  },

  x = {
    -- Move text up and down
    ["J"] = {":move '>+1<CR>gv-gv", "Move down"},
    ["K"] = {":move '<-2<CR>gv-gv", "Move up"},
    ["<A-j>"] = {":move '>+1<CR>gv-gv", "Move down"},
    ["<A-k>"] = {":move '<-2<CR>gv-gv", "Move up"},
  }
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree"},
  },
}

M.lspconfig = {
  n = {
      ["]d"] = {
         function()
            vim.diagnostic.goto_next()
         end,
         "   goto_next",
      },

  }
}

return M
