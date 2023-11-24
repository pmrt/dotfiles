-- ###############
-- # SETTINGS
-- ###############
--  Editor settings
--

-- Must be set before lazyvim otherwise mappings would not work
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local o = vim.opt
o.autowrite = true
o.clipboard = "unnamedplus"
o.completeopt = "menu,menuone,preview,noselect"
o.conceallevel = 3
o.confirm = true
o.cursorline = true
o.expandtab = true
o.tabstop = 2
o.formatoptions = "tcroqn2lj"
o.textwidth = 80
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep"
o.ignorecase = true
o.inccommand = "nosplit"
o.laststatus = 3
o.mouse = "a"
o.number = true
o.pumblend = 10
o.pumheight = 10
o.scrolloff = 10
o.sidescrolloff = 10
o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
o.shiftround = true
o.shiftwidth = 2
o.shortmess:append({ W = true, C = true, c = true, I = true, a = true })
o.showmode = true
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.spelllang = { "en_us", "es" }
o.splitbelow = true
o.splitright = true
o.splitkeep = "screen"
o.termguicolors = true
o.timeoutlen = 250
o.undofile = true
o.undolevels = 10000
o.updatetime = 200
o.virtualedit = "block"
o.wildmode = "longest:full,full"
o.winminwidth = 5
o.wrap = false
o.list = true
o.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
o.foldlevel = 99

if vim.fn.has("nvim-0.10") == 1 then
	o.smoothscroll = true
end

-- ###############
-- # LAZYVIM
-- ###############
-- Bootstrap and plugins
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
local lazyfile = require("extra.lazyfile")
lazyfile.setup()

local lazy = require("lazy")

-- ###############
-- # Custom fns
-- ###############
--
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- ###############
-- # Plugins and Theme
-- ###############
-- Custom plugins, plugin config, theme and custom color groups
--
lazy.setup({
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			local hls = require("extra.highlights")
			require("rose-pine").setup({
				variant = "main",
				groups = {
					background = "#000000",
				},
				highlight_groups = hls,
			})
		end,
	},
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      close_if_last_window = true,
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        mappings = {
          ["<space>"] = "none",
          ["l"] = "open",
        },
        width = 30,
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
    config = function(_, opts)
      local function on_move(data)
        Util.lsp.on_rename(data.source, data.destination)
      end

      local events = require("neo-tree.events")
      opts.event_handlers = opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      })
      require("neo-tree").setup(opts)
      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "*lazygit",
        callback = function()
          if package.loaded["neo-tree.sources.git_status"] then
            require("neo-tree.sources.git_status").refresh()
          end
        end,
      })
    end,
  },
	{
		"echasnovski/mini.surround",
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
	},
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },
	{
		"echasnovski/mini.indentscope",
		event = "LazyFile",
		opts = {
			symbol = "│",
			options = {
				try_as_border = true,
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local luasnip = require("luasnip")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<C-CR>"] = function(fallback)
						cmp.abort()
						fallback()
					end,
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						-- replace expand_or_jumpable() with expand_or_locally_jumpable()
						-- if you want to only jump inside the snippet region
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "cmdline" },
					{ name = "buffer" },
				}),
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
				sorting = defaults.sorting,
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ 
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "ahmedkhalf/project.nvim",
        opts = {
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "lazy-lock.json" },
        },
        config = function(_, opts)
          require("project_nvim").setup(opts)
          require("telescope").load_extension("projects")
        end
      },
    },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case", -- ignore_case / respect_case / smart_case
        },
      },
    }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "LazyFile", "VeryLazy" },
		init = function(plugin)
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treeitter** module to be loaded in time.
			-- Luckily, the only thins that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				config = function()
					-- When in diff mode, we want to use the default
					-- vim text objects c & C instead of the treesitter ones.
					local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
					local configs = require("nvim-treesitter.configs")
					for name, fn in pairs(move) do
						if name:find("goto") == 1 then
							move[name] = function(q, ...)
								if vim.wo.diff then
									local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
									for key, query in pairs(config or {}) do
										if q == query and key:find("[%]%[][cC]") then
											vim.cmd("normal! " .. key)
											return
										end
									end
								end
								return fn(q, ...)
							end
						end
					end
				end,
			},
			{
				"nvim-treesitter/nvim-treesitter-context",
				event = "LazyFile",
				enabled = true,
				opts = { mode = "cursor", max_lines = 5 },
			},
		},
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
		---@type TSConfig
		---@diagnostic disable-next-line: missing-fields
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"css",
				"scss",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"svelte",
				"vim",
				"vimdoc",
				"yaml",
				"rust",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"graphql",
				"latex",
				"php",
				"rasi",
				"sql",
				"csv",
				"gitignore",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				move = {
					enable = true,
					goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
					goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
					goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
					goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
				},
			},
		},
		---@param opts TSConfig
		config = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				---@type table<string, boolean>
				local added = {}
				opts.ensure_installed = vim.tbl_filter(function(lang)
					if added[lang] then
						return false
					end
					added[lang] = true
					return true
				end, opts.ensure_installed)
			end
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "LazyFile",
		opts = {},
	},
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
				},
			}
		end,
	},
	{
		"RRethy/vim-illuminate",
		event = "LazyFile",
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since many overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
	},
  {
    "brenoprata10/nvim-highlight-colors",
    event = "LazyFile",
    config = function()
      require("nvim-highlight-colors").turnOn()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      sections = {
        lualine_y = {},
        lualine_x = { "filetype"},
      },
      options = {
        theme = require("extra.lualine_theme").theme(),
      },
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      {
        "williamboman/mason-lspconfig.nvim",
        config = function(_, opts)
          require("mason").setup()
          require("mason-lspconfig").setup(opts)
        end,
        dependencies = {
          "williamboman/mason.nvim",
        },
      }
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "html",
        "svelte",
        "tsserver",
        "jsonls",
        "marksman",
        "intelephense",
        "pyright",
        "yamlls",
        "lemminx",
        "cssls",
        "bashls",
      }
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup(opts)
      require("neodev").setup({})
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup{}
      lspconfig.pyright.setup{}
      lspconfig.tsserver.setup{}
      lspconfig.rust_analyzer.setup{}
      lspconfig.gopls.setup{}
      lspconfig.html.setup{}
      lspconfig.bashls.setup{}
      lspconfig.cssls.setup{}
      lspconfig.svelte.setup{}
      lspconfig.marksman.setup{}
      lspconfig.jsonls.setup{}
      lspconfig.yamlls.setup{}
      lspconfig.intelephense.setup{}
      lspconfig.lemminx.setup{}
    end
  },
})
vim.cmd("colorscheme rose-pine")

-- ###############
-- # Mappings
-- ###############
--

local map = vim.keymap.set

-- Explorer
map({ "n" }, "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Open file explorer" })

-- Telescope
local ok, _ = pcall(require, "telescope.builtin")
if ok then
  local telescope_builtin = require("telescope.builtin")
  map({ "n" }, "<leader>ff", telescope_builtin.find_files, { desc = "Find files" })
  map({ "n" }, "<leader>fg", telescope_builtin.live_grep, { desc = "Live grep" })
  map({ "n" }, "<leader>fh", telescope_builtin.help_tags, { desc = "Find help tags" })
  map({ "n" }, "<leader>fs", telescope_builtin.lsp_document_symbols, { desc = "Find symbols" })
  map({ "n"}, "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find projects"} )
end

-- LSP

map({"n"}, "<leader>dd", vim.diagnostic.open_float, {desc = "Show diagnostics"})
map({"n"}, "[d", vim.diagnostic.goto_prev, {desc="Go to previous diagnostic"})
map({"n"}, "]d", vim.diagnostic.goto_next, {desc="Go to next diagnostic"})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(evt)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[evt.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    -- Local mappings
    local opts = { buffer = evt.buf }
    map({"n"}, "gD", vim.lsp.buf.declaration, opts)
    map({"n"}, "gd", vim.lsp.buf.definition, opts)
    map({"n"}, "K", vim.lsp.buf.hover, opts)
    map({"n"}, "gi", vim.lsp.buf.implementation, opts)
    map({"n"}, "gr", vim.lsp.buf.references, opts)
    map({"n"}, "<leader>D", vim.lsp.buf.type_definition, opts)
    map({"n"}, "<C-k>", vim.lsp.buf.signature_help, opts)
    map({"n"}, "<leader>r", vim.lsp.buf.rename, opts)
    map({"n", "v"}, "<leader>c", vim.lsp.buf.code_action, opts)
    map({"n"}, "<leader>f", function ()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Window nav.
map({'n'}, '<C-h>', '<C-w>h')
map({'n'}, '<C-j>', '<C-w>j')
map({'n'}, '<C-k>', '<C-w>k')
map({'n'}, '<C-l>', '<C-w>l')
-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
-- Don't exit indent mode
map({'v'}, '<', '<gv')
map({'v'}, '>', '>gv')
-- Center cursor when navigating
map({'n'}, 'n', 'nzz')
map({'n'}, 'N', 'Nzz')
-- Duplicate current line
map({"n"}, "P", ":co.<CR>")
-- Quick save and quit
map({'n'}, '<C-w>', ':w<CR>')
map({'i'}, '<C-w>', '<Esc>:w<CR>i<Right>')
map({'n', "i"}, '<C-q>', '<Esc>:wqa<CR>')
-- Avoid default yanking when deleting to clipboard (pasting to black hole)
map({'n', 'v'}, 'd', '"_d')
-- Avoid default yanking when pasting
map({"v"}, "p", '"_dP')
-- double 'o' or 'O' inserts a new line and goes back to the same position
map({"n"}, "oo", "o<Esc>k")
map({"n"}, "OO", "O<Esc>j")
-- Move text up and down
map({"x"}, "<A-j>", ":move '>+1<CR>gv-gv")
map({"x"}, "<A-k>", ":move '<-2<CR>gv-gv")
-- Quickfix
map({"n"}, "]q", ":cnext<cr>zz")
map({"n"}, "[q", ":cprev<cr>zz")
map({"n"}, "<leader>qc", ":ccl<cr>")
map({"n"}, "<leader>qlc", ":lcl<cr>")
map({"n"}, "<leader>ql", ":lopen<cr>")
map({"n"}, "<leader>qq", ":copen<cr>")
-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", {}),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(evt)
    vim.bo[evt.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = evt.buf, silent = true })
  end,
})
