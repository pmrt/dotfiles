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
  override = {
    ["akinsho/bufferline.nvim"] = override.bufferline,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
  }
}

M.mappings = require "custom.mappings"

return M
