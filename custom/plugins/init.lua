return {
  ["rmagatti/auto-session"] = {
    config = function ()
      require('auto-session').setup()
    end
  },
  ["nvim-treesitter/nvim-treesitter-context"] = {
    event = { "BufRead", "BufNewFile" },
    config = function ()
      local opts = require "custom.plugins.treesitter-context"
      require "treesitter-context".setup(opts)
    end,
  },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    event = { "BufRead", "BufNewFile" },
    config = function ()
      local opts = require "custom.plugins.treesitter-objects"
      require "nvim-treesitter.configs".setup(opts)
    end
  },
  ["nvim-treesitter/nvim-treesitter-refactor"] = {
    event = { "BufRead", "BufNewFile"},
    config = function ()
      local opts = require "custom.plugins.treesitter-refactor"
      require "nvim-treesitter.configs".setup(opts)
    end
  },
  ["tpope/vim-surround"] = {
    event = { "InsertEnter" },
  },
  ["kdheepak/lazygit.nvim"] = {
    event = { "InsertEnter" },
    branch = "main",
  }
}
