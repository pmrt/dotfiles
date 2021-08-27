local catppuccino = require("catppuccino")

-- configure it
catppuccino.setup(
    {
		colorscheme = "neon_latte",
		transparency = false,
		styles = {
			comments = "italic",
			functions = "NONE",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				styles = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic"
				}
			},
			lsp_trouble = false,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = false,
			telescope = true,
			nvimtree = {
				enabled = false,
				show_root = false,
			},
			which_key = false,
			indent_blankline = false,
			dashboard = false,
			neogit = false,
			vim_sneak = true,
			fern = false,
			barbar = false,
			bufferline = false,
			markdown = false,
		}
	}
)

-- load it
catppuccino.load()
