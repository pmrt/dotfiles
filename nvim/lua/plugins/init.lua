local packer_obj = require('plugins.packer')
local cfg = require('config')
local packer = packer_obj.packer
local use = packer.use

return packer.startup(function()
  use({
    'wbthomason/packer.nvim', -- packer
    'lewis6991/impatient.nvim', -- impatient for caching plugins
    'nathom/filetype.nvim', -- filetype (faster than built-in filetype.vim)
    -- common deps
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
  })
  -- setup theme
  require('core.theme').init(use, require('config').theme)

  -- setup notify
  use({
    'rcarriga/nvim-notify',
    config = function()
      require('plugins.notify')
    end,
    after = cfg.theme,
  })

  -- plugins
  --
  -- use({
  --   'goolord/alpha-nvim',
  --   config = function()
  --     require('plugins.alpha')
  --   end,
  --   after = cfg.theme,
  -- })
  --
  use({
    'ahmedkhalf/project.nvim',
    config = function()
      require('plugins.project')
    end,
  })

  use({
    'numToStr/Comment.nvim',
    config = function()
      require('plugins.comment')
    end,
    event = { 'CursorMoved' },
  })

  -- LSP
  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('core.lsp')
    end,
    requires = {
      { 'williamboman/nvim-lsp-installer' },
      { 'jose-elias-alvarez/nvim-lsp-ts-utils' },
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('core.lsp.providers.null_ls')
        end,
        after = 'nvim-lspconfig',
      },
    },
  })
  use 'b0o/SchemaStore.nvim'
  use({
    'ray-x/lsp_signature.nvim',
    config = function()
      require('plugins.lsp_signature')
    end,
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end,
  })
  use({
    'windwp/nvim-ts-autotag',
  })
  use({
    'JoosepAlviste/nvim-ts-context-commentstring',
  })
  use({
    'nvim-treesitter/nvim-treesitter-textobjects',
  })
  use({
    'nvim-treesitter/nvim-treesitter-refactor',
  })
  use({
    'nvim-treesitter/nvim-treesitter-context',
  })
  use({
    'p00f/nvim-ts-rainbow',
  })

  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.nvim-cmp')
    end,
    requires = {
      {
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
        config = function()
          require('plugins.luasnip')
        end,
        requires = {
          { 'rafamadriz/friendly-snippets', event = 'InsertEnter' },
        },
      },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function()
          require('plugins.autopairs')
        end,
        after = 'nvim-cmp',
      },
    },
    event = 'InsertEnter',
  })

  use({
    'ggandor/lightspeed.nvim',
    event = 'InsertEnter',
  })

  use({
    'lukas-reineke/indent-blankline.nvim',
  })

  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    },
    config = function()
      require('plugins.telescope')
    end,
  })

  -- use({
  --   'nvim-lualine/lualine.nvim',
  --   config = function()
  --     require('plugins.lualine')
  --   end,
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  -- })

  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugins.nvim-tree')
    end,
  })

  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('plugins.colorizer')
    end,
  })

  use({
    'kylechui/nvim-surround',
    config = function()
      require('plugins.surround')
    end
  })

  use({
    'kdheepak/lazygit.nvim',
    branch = 'main',
    config = function()
      require('core.utils').map('n', '<leader>g', ':LazyGit<CR>')
    end,
  })

  use({
    'mfussenegger/nvim-dap',
    event = 'InsertEnter',
    config = function()
      require('plugins.nvim-dap')
    end
  })

  use {
    -- event = "InsertEnter",
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("plugins.neotest")
    end
  }

  use({
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('plugins.gitsigns')
    end,
  })

  use({
    'ojroques/vim-oscyank',
    config = function()
      require('plugins.vim-oscyank')
    end,
  })

  use({
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup({
        -- bypass_session_save_file_types = { 'alpha' },
      })
    end
  })

  use({
    'nvim-neorg/neorg',
    -- tag = "latest",
    ft = "norg",
    after = "nvim-treesitter",
    config = function()
      require('plugins.neorg')
    end,
    requires = "nvim-lua/plenary.nvim"
  })

  use {
    'akinsho/toggleterm.nvim',
    branch = 'main',
    tag = 'v1.*',
    config = function()
      require('plugins.toggleterm')
    end,
  }

  if packer_obj.first_install then
    packer.sync()
  end
end)
