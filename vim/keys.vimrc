" Leader keys
let g:mapleader=','
let g:maplocalleader='//'

" Pane keys for faster navigation
nmap <C-j> :TmuxNavigateDown<cr>
nmap <C-k> :TmuxNavigateUp<cr>
nmap <C-h> :TmuxNavigateLeft<cr>
nmap <C-l> :TmuxNavigateRight<cr>

" Stop highlighting on Enter
map <silent> <CR> :noh<CR>

" Binds to move lines up and down
nnoremap <S-j> :m .+1<CR>
nnoremap <S-k> :m .-2<CR>
vnoremap <S-j> :m '>+1<CR>gv
vnoremap <S-k> :m '<-2<CR>gv

" CTRL-P to search files in CWD
nnoremap <C-p> :call FzfOmniFiles()<cr>

" CTRL-SHIFT-F to search file contents in CWD
map <C-S-f> :CtrlSF<Space>

" Leader+t to toggle file tree
nmap <silent> <leader>t :NERDTreeToggle<CR>

" F8 for tagbar
nmap <F8> :TagbarToggle<CR>

" Easy Motion
map <Leader> <Plug>(easymotion-prefix)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
