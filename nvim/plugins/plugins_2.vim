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
  "Plug 'vim-airline/vim-airline'
  Plug 'hoob3rt/lualine.nvim'
call plug#end()
