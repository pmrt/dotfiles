let g:startify_custom_header = ''
" Session folder
let g:startify_session_dir = '~/.config/nvim/session'
" Load session if vim is started in a dir with a session.vim file
let g:startify_session_autoload = 1
" Take care of buffers
let g:startify_session_delete_buffers = 1
" Change working dir
let g:startify_change_to_vcs_root = 1
" Update sessions
let g:startify_session_persistence = 1
" Use unicode
let g:startify_fortune_use_unicode = 1
" Get rid of empty buffers and quit
let g:startify_enable_special = 0

let g:startify_lists = [
  "\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'files',     'header': ['   Files']            },
\ ]
let g:startify_bookmarks = [
  \ { 'c': '~/.config/nvim/init.vim' },
\ ]
