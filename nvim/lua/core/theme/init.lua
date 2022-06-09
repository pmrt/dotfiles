local M = {}

M.supported = {
  'catppuccin',
  'inspired-github',
  'dawnfox',
  'duskfox',
  'rose-pine',
}

function M.init(use, theme)
  use({
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      local catppuccin = require('catppuccin')
      catppuccin.setup({
          transparent_background = false,
          term_colors = false,
          styles = {
            comments = "italic",
            functions = "italic",
            keywords = "italic",
            strings = "NONE",
            variables = "italic",
          },
          integrations = {
            treesitter = true,
            native_lsp = {
              enabled = true,
              virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
              },
              underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
              },
            },
            lsp_trouble = false,
            cmp = true,
            lsp_saga = false,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            nvimtree = {
              enabled = false,
              show_root = false,
              transparent_panel = false,
            },
            which_key = false,
            indent_blankline = {
              enabled = true,
              colored_indent_levels = false,
            },
            dashboard = true,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            bufferline = true,
            markdown = true,
            lightspeed = true,
            ts_rainbow = true,
            hop = false,
            notify = true,
            telekasten = true,
        }
      })
      vim.cmd('colorscheme catppuccin')
    end,
    disable = theme ~= 'catppuccin',
  })

  use({
    'mvpopuk/inspired-github.vim',
    as = 'inspired-github',
    config = function ()
      vim.cmd('colorscheme inspired-github')
    end,
    disable = theme ~= 'inspired-github',
  })


  use({
    'EdenEast/nightfox.nvim',
    as = 'dawnfox',
    config = function()
      vim.cmd('colorscheme dawnfox')
    end,
    disable = theme ~= 'dawnfox',
  })

  use({
    'EdenEast/nightfox.nvim',
    as = 'duskfox',
    config = function()
      vim.cmd('colorscheme duskfox')
    end,
    disable = theme ~= 'duskfox',
  })

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v1.*',
    config = function()
      require('rose-pine').setup({
        dark_variant = 'moon',
        disable_italics = true,
      })
      vim.cmd('colorscheme rose-pine')
    end,
    disable = theme ~= 'rose-pine'
  })
end

return M
