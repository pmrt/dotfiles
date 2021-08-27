if has("unix")
	if empty(glob('~/.config/nvim/autoload/plug.vim'))
  	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
elseif has("win64") || has("win32")
	md ~\AppData\Local\nvim\autoload
	$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	(New-Object Net.WebClient).DownloadFile(
  	$uri,
  	$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    	"~\AppData\Local\nvim\autoload\plug.vim"
  	)
	)
endif

call plug#begin('~/.config/nvim/plugged')
  " Better syntax support
  Plug 'sheerun/vim-polyglot'
  " File explorer
  Plug 'scrooloose/nerdtree'
  " Auto closing (, {. [
  Plug 'jiangmiao/auto-pairs'
  " Vim & tmux
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'scrooloose/nerdcommenter'
  " Autocomplete
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  " Colorize hex and rgb
  Plug 'norcalli/nvim-colorizer.lua'
  " Sneak and quickscope
  Plug 'justinmk/vim-sneak'
  Plug 'unblevable/quick-scope'
  " Multi-cursors
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  " Fuzzy finder
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  "Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  " Git
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  " Project Management
  Plug 'mhinz/vim-startify'
  " Better LSPHover
  Plug 'ray-x/lsp_signature.nvim'
  " Themes
  "Plug 'arcticicestudio/nord-vim'
  Plug 'Pocco81/Catppuccino.nvim', {'branch': 'main'}
  "Plug 'vim-airline/vim-airline-themes'
  " Status
  "Plug 'vim-airline/vim-airline'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'ryanoasis/vim-devicons'
call plug#end()
