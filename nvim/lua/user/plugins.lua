local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print "Installing Packer, please restart Neovim"
  vim.cmd [[packadd packer.nvim]]
end

local ok, packer = pcall(require, "packer")
if not ok then
  return
end

return packer.startup(function(use)
  -- Add plugins here
  use 'lewis6991/impatient.nvim'
  use 'nathom/filetype.nvim'

  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  use 'goolord/alpha-nvim'
  use "windwp/nvim-autopairs"
  use "ahmedkhalf/project.nvim"

  -- use {
  --   "rose-pine/neovim",
  -- }

  use {
    "catppuccin/nvim",
    as = "catppuccin"
  }

  use 'numToStr/Comment.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- cmp
  -- use "hrsh7th/nvim-cmp"
  -- use "hrsh7th/cmp-buffer"
  -- use "hrsh7th/cmp-path"
  -- use "hrsh7th/cmp-cmdline"
  -- use "saadparwaiz1/cmp_luasnip"
  -- use "hrsh7th/cmp-nvim-lsp"
  -- use "hrsh7th/cmp-nvim-lua"
  use  {
    "ms-jpq/coq_nvim",
    branch = 'coq',
  }
  use {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts',
  }


  -- snippets
  -- use "L3MON4D3/LuaSnip" --snippet engine
  -- use "rafamadriz/friendly-snippets"

  -- colorizer
  use "norcalli/nvim-colorizer.lua"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  use {
    'kdheepak/lazygit.nvim',
    branch = 'main',
  }

  use "tpope/vim-surround"

  use 'ggandor/lightspeed.nvim'

  -- use "akinsho/toggleterm.nvim"

  use "mfussenegger/nvim-dap"

  use {
  'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  use "mhartington/formatter.nvim"
  -- use {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   requires = { "nvim-lua/plenary.nvim" },
  -- }
  use "jose-elias-alvarez/nvim-lsp-ts-utils"

  use 'ojroques/vim-oscyank'

  use {
    "nvim-treesitter/nvim-treesitter",
    -- run = ":TSUpdate",
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use "windwp/nvim-ts-autotag"
  use "p00f/nvim-ts-rainbow"
  use 'ray-x/lsp_signature.nvim'


  if packer_bootstrap then
    require("packer").sync()
  end
end)
