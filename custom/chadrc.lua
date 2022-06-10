-- Just an example, supposed to be placed in /lua/custom/

local M = {}

local override = require "custom.override"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "rosepine",
   theme_toggle = {},
}

M.plugins = {
  remove = {
    "folke/which-key.nvim",
    "akinsho/bufferline.nvim",
  },
  user = require "custom.plugins",
  override = {
    -- ["akinsho/bufferline.nvim"] = override.bufferline,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  }
}

M.mappings = require "custom.mappings"

M.options = {
  user = function ()
    require "custom.options"
  end
}

return M
