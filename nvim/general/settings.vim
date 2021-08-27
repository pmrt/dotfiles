"leader key
let g:mapleader = "\<Space>"
"colorscheme nord
"let g:airline_theme='nord'
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

"Syntax highlighing
syntax on
filetype on
filetype indent on
filetype plugin on

set hidden "When editing a unsaved file 'A', if a file 'B' is opened, hide
"buffer of 'A' instead of asking for saving and closing 'A'
set ignorecase "Ignore case by default for searches
set nowrap "Long lines will be displayed as one line
set tabstop=2 "Indent tab with this many spaces
set shiftwidth=2 "Indent with this many spaces
set expandtab "Convert tabs to spaces
set formatoptions-=cro " Auto-wrap comments using textwidth, inserting the current comment leader automatically.
set textwidth=80 "Max line size when formatting
set history=100
set autoindent
set smartindent
set mouse=a "Enable mouse
set noshowmode "Hide mode
set number
set hlsearch
set modifiable
set encoding=utf-8
set fileencoding=utf-8
set pumheight=10 "Popup menu height
set ruler "Always show cursorj
set iskeyword+=- "Kebab case words will be act as single word
set splitbelow "Horizontal split below
set splitright "Vertical split right
set t_Co=256 "Support 256 colors
set conceallevel=0 "Don't hide ` symbol in markdown
set laststatus=2 "Always show status line
set cursorline "Highlight current line
set background=dark "Informs vim about bg color
"set showtabline=2 "Always show tabs
set nobackup
set nowritebackup
set updatetime=300 "Faster autocompletion
set timeoutlen=500 "Time in milliseconds to wait for a mapped sequence to complete.
set clipboard=unnamedplus "Sync system clipboard and vim clipboard
"set autochdir "Set working dir the same as the file
set termguicolors
"au! BufWritePost $MYVIMRC source %      auto source when writing to init.vm alternatively you can run :source $MYVIMRC

"remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
"w!! command to write with sudo permissions
cmap w!! w !sudo tee %

"hide tmux status bar when using vim
"if has_key(environ(), 'TMUX')
  "augroup tmux_something
    "autocmd VimResume  * call system('tmux set status off')
    "autocmd VimEnter   * call system('tmux set status off')
    "autocmd VimLeave   * call system('tmux set status on')
    "autocmd VimSuspend * call system('tmux set status on')
  "augroup END
"endif

let g:python3_host_prog = expand("~/python/bin/python")

" Better gf
set path=.,src
set suffixesadd=.js,.jsx,.ts
" For js files, if file is not found with gf, append node_modules at the start
" and try it again
function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction
autocmd FileType javascript,javascriptreact,typescript,typescriptreact set includeexpr=LoadMainNodeModule(v:fname)

" For golang files, order imports when saving
lua <<EOF
  function goimports(timeout_ms)
    local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
  end
EOF
autocmd BufWritePre *.go lua goimports(1000)
" For go files, CTRL+o
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
