local M = {}

-- M.bufferline = {
--    options = {
--      custom_areas = {
--        right = function () end
--      },
--    },
-- }

local nvim_tree_cb = require("nvim-tree.config").nvim_tree_callback
M.nvimtree = {
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = nvim_tree_cb "edit" },
        { key = "h", cb = nvim_tree_cb "close_node" },
        { key = "v", cb = nvim_tree_cb "vsplit" },
        { key = "d", cb = nvim_tree_cb "trash" },
        { key = "D", cb = nvim_tree_cb "remove" },
      },
    }
  }
}

M.treesitter = {
  max_lines = 10000,
  ensure_installed = {
    "bash",
    "go",
    "css",
    "html",
    "javascript",
    "typescript",
    "tsx",
    "svelte",
    "vue",
    "jsdoc",
    "json",
    "jsonc",
    "c",
    "cpp",
    "lua",
    "java",
    "toml",
    "rust",
    "yaml",
    "php",
    "rust",
  }
}

-- M.whichkey = {
--   triggers_blacklist = {
--     i = { "j", "k" },
--     v = { "j", "k" },
--     n = { "o" },
--   }
-- }

return M
