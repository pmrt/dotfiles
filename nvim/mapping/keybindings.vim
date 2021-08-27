" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

inoremap kj <Esc>

" Easy CAPS
nnoremap <c-u> viwU<Esc>

" Undo in insert mode
inoremap <c-u> <C-o>u

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> <ESC>:wq!<CR>
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? ("\<C-n>") : ("\<TAB>")

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Move lines with Alt (MacOs)
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" LSP config
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>h <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>s <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Fzf
"map <leader>f :Files<CR>
"map <leader>b :Buffers<CR>
"nnoremap <leader>g :Rg<CR>
"nnoremap <leader>t :Tags<CR>
"nnoremap <leader>m :Marks<CR>
"tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" Insert line without entering insert mode and without moving cursor
"nnoremap Ø :set paste<CR>m`O<Esc>``:set nopaste<CR>
"nnoremap ø :set paste<CR>m`o<Esc>``:set nopaste<CR>
" o with a blank line of separation
" ø = alt + o (macos)
inoremap Ø <C-o>O
nnoremap Ø O<Esc>O
nnoremap ø o<Esc>o
inoremap ø <C-o>o

" Paste with a blank line of separation
" π = alt + p (macos)
nnoremap π o<Esc>o<Esc>p

" Remove search highlight
" ¬ = alt + l (macos)
nnoremap ¬ :nohl<CR>

map <F1> :NERDTreeToggle<CR>
"map <leader>r :source $MYVIMRC<CR> <bar> :AirlineToggle<CR> <bar> :AirlineToggle<CR>
map <leader>r :source $HOME/.config/nvim/init.vim<CR>

nmap ; ;
nmap . .
