-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
lvim.builtin.bufferline.active = false
vim.cmd [[ set showtabline=0 ]]
vim.cmd [[ set cmdheight=1 ]]
vim.cmd [[ set textwidth=80 ]]

-- general
lvim.format_on_save = true
lvim.lint_on_save = true

-- theme config
vim.cmd [[ set background=light ]]
-- vim.g.gruvbox_material_palette = "original"
vim.g.gruvbox_material_background = "soft"
vim.g.rose_pine_disable_italics = true
vim.g.rose_pine_variant = "moon"
lvim.colorscheme = "rose-pine"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

vim.api.nvim_exec(
[[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set empty fillchars for the empty end of buffer characters. To get rid of the
" '~' symbols at the end of the buffer 
let &fcs='eob: '

" Reverse search with lightspeed (because vim-surround overwrites it and its
" an old plugin k
map ß <Plug>Lightspeed_S
]],
false)

lvim.keys.insert_mode["jj"] = nil

-- Center cursor when navigating
lvim.keys.normal_mode["n"] = "nzz"
lvim.keys.normal_mode["N"] = "Nzz"
lvim.keys.normal_mode["]c"] = "]czz"
lvim.keys.normal_mode["]C"] = "]Czz"
lvim.keys.normal_mode["}"] = "}zz"
lvim.keys.normal_mode["{"] = "{zz"
lvim.keys.normal_mode["]}"] = "]}zz"
lvim.keys.normal_mode["]{"] = "]{zz"
lvim.keys.normal_mode["])"] = "])zz"
lvim.keys.normal_mode["]("] = "](zz"
lvim.keys.normal_mode["]]"] = "]]zz"
lvim.keys.normal_mode["[["] = "[[zz"
lvim.keys.normal_mode["]]"] = "]]zz"

-- vim.cmd("nnoremap <silent> oo o<Esc>k")
-- lvim.keys.normal_mode["oo"] = "o<Esc>k"
lvim.keys.normal_mode["OO"] = "O<Esc>j"
lvim.keys.normal_mode["oo"] = "o<Esc>k"

lvim.builtin.which_key.mappings["v"] = { "<cmd>Telescope live_grep<CR>", "Live grep" }
lvim.builtin.which_key.mappings["q"] = { ":wq<CR>", "Save and quit" }
lvim.builtin.which_key.setup.ignore_missing = true

-- No highlight + remove from minimap
lvim.builtin.which_key.mappings["h"] = { ":nohlsearch<CR>:call minimap#vim#ClearColorSearch()<CR>", "No highlight"}

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Fix: document highlight colors
-- lvim.lsp.document_highlight = false
-- vim.g.gruvbox_material_current_word = "underline"
-- lvim.lsp.on_attach_callback = function()
--   vim.api.nvim_exec(
--   [[
--     augroup lsp_custom_document_highlight
--       autocmd! * <buffer>
--       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--     augroup END
--   ]],
--   false)
-- end
-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options = {
  icons_enabled = 1,
  theme = "rose-pine"
}

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }
lvim.plugins = {
  {
    "segeljakt/vim-isotope",
  },

  {
    "mhinz/vim-startify",
    config = function()
      vim.g.startify_custom_header = ""
      -- vim.g.startify_session_dir = "~/config/lvim/session"
      vim.g.startify_session_autoload = 0
      vim.g.startify_session_delete_buffers = 1
      vim.g.startify_session_persistence = 0
      vim.g.startify_change_to_vcs_root = 1
      vim.g.startify_fortune_use_unidecode = 1
      vim.g.startify_enable_special = 1
      vim.g.startify_lists = {
        { type = "sessions", header = { "     Sessions"} },
        { type = "bookmarks", header = { "     Bookmarks"} },
        { type = "files", header = { "     Files"} },
      }
      vim.g.startify_bookmarks = {
        { c = "~/.config/lvim/config.lua" },
        { p = "~/Documents/Projects/portfolio_v2" },
        { l = "~/Documents/Projects/booklog" },
        { f = "~/Documents/Projects/ctrlf" },
      }
    end
  },

  {
    "wfxr/minimap.vim",
    run = "cargo install --locked code-minimap",
    config = function()
      vim.g.minimap_auto_start = 1
      vim.g.minimap_auto_start_win_enter = 1
      vim.g.minimap_highlight_search = 1
      vim.g.minimap_highlight = "Normal"
      vim.g.minimap_base_highlight = "NonText"
      vim.g.minimap_search_color = "WildMenu"
      vim.g.minimap_git_colors = 1
      vim.g.minimap_width = 3
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
      vim.g.mkdp_port = '4000'
    end,
  },

  {
    "dkarter/bullets.vim",
  },

  {
    "tpope/vim-obsession",
  },

  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
    config = function()
      require("lightspeed").setup {
        jump_to_first_match = true,
      }
    end
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },

  {
    "tpope/vim-surround",
    keys = {"c", "d", "S"}
  },

  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = {"fugitive"}
  },

  {
    "rose-pine/neovim",
  },

  {
    "sainnhe/gruvbox-material",
  },

--   {
--     "Pocco81/Catppuccino.nvim",
--     config = function ()
--       local catppuccino = require("catppuccino")

--       catppuccino.setup(
--         {
--           colorscheme = "neon_latte",
--           transparency = false,
--           term_colors = true,
--           styles = {
--             comments = "italic",
--             functions = "NONE",
--             keywords = "NONE",
--             strings = "NONE",
--             variables = "NONE",
--           },
--           integrations = {
--             treesitter = true,
--             native_lsp = {
--               enabled = true,
--               virtual_text = {
--                 errors = "italic",
--                 hints = "italic",
--                 warnings = "italic",
--                 information = "italic",
--               },
--               underlines = {
--                 errors = "underline",
--                 hints = "underline",
--                 warnings = "underline",
--                 information = "underline",
--               }
--             },
--             lsp_trouble = false,
--             lsp_saga = false,
--             gitgutter = false,
--             gitsigns = true,
--             telescope = true,
--             nvimtree = {
--               enabled = true,
--               show_root = false,
--             },
--             which_key = true,
--             indent_blankline = {
--               enabled = false,
--               colored_indent_levels = false,
--             },
--             dashboard = false,
--             neogit = false,
--             vim_sneak = false,
--             fern = false,
--             barbar = false,
--             bufferline = false,
--             markdown = true,
--             lightspeed = true,
--             ts_rainbow = false,
--             hop = false,
--           }
--         }
--       )

--       catppuccino.load()
--     end
--   },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
lvim.autocommands.custom_groups = {
  { "Filetype", "json", "setlocal wrap" },
}

-- Start Obsession automatically.
vim.api.nvim_exec(
[[
  augroup ObsessionGroup
    autocmd!
    autocmd VimEnter * nested if !&modified && empty(v:this_session) | Obsession | echo "Recording new session" | endif
  augroup END
]],
false)

