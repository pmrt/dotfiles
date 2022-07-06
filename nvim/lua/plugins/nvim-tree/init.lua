local plugin = require('nvim-tree')
local map = require('core.utils').map
local nvim_tree_config = require('nvim-tree.config')

local nvim_tree_cb = nvim_tree_config.nvim_tree_callback

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
plugin.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  filters = {
    dotfiles = false,
    custom = { ".git" }

  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = nvim_tree_cb "edit" },
        { key = "h", cb = nvim_tree_cb "close_node" },
        { key = "v", cb = nvim_tree_cb "vsplit" },
        { key = "d", cb = nvim_tree_cb "trash" },
        { key = "D", cb = nvim_tree_cb "remove" },
      },
    },
    number = false,
    relativenumber = false,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    }
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
}

map("n", "<leader>e", ":NvimTreeToggle<CR>")
