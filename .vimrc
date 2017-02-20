if has("win32")
  language English_United States
else
  language en_US.UTF-8
endif

if has("gui_running")
  " Turn of GVIm toolbar and menu
  set guioptions-=m  "menu bar
  set guioptions-=T  "toolbar
  set guioptions-=r  "scrollbar
endif

set mouse="" " Disable mouse integration

" Set title of terminal to reflect current file
set title

" Make it so yank also copies to the system clipboard.
if has("win32")
  set clipboard=unnamed
else
  set clipboard=unnamedplus
end

" Stop VIM from suspending on Ctrl+Z
nnoremap <c-z> <nop>

" Highlight cursor position
set cursorline
set cursorcolumn

" Disable line wrapping
set nowrap
set textwidth=0 wrapmargin=0

" Tabs
" - 2 spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2
" - Enable backwards tabbing with shift-tab
inoremap <S-Tab> <C-d>
" - Enable indenting with tab in normal mode
nmap <Tab> a<C-t><Esc>
nmap <S-Tab> a<C-d><Esc>

" Leader keys
let g:mapleader=','
let g:maplocalleader='//'

" Buffer keys
nmap <leader><Tab> :bnext<CR>
nmap <leader><S-Tab> :bprev<CR>

" Binds to move lines up and down
nnoremap <S-j> :m .+1<CR>
nnoremap <S-k> :m .-2<CR>
vnoremap <S-j> :m '>+1<CR>gv
vnoremap <S-k> :m '<-2<CR>gv

" Pane keys
nmap <C-j> :TmuxNavigateDown<cr>
nmap <C-k> :TmuxNavigateUp<cr>
nmap <C-h> :TmuxNavigateLeft<cr>
nmap <C-l> :TmuxNavigateRight<cr>
" - Fix for nvim where Ctrl-j doesn't work correctly
if has('nvim')
  nmap <BS> <C-W>h
endif

" Command for creating file relative to current file
function! s:NewRelative(filename)
  execute 'new %:h/' . a:filename
endfunction

command! -nargs=1 New call s:NewRelative(<f-args>)

" Activate line numbering
set number

" Searching
" - Highlight search results
set hlsearch
" - Incremental search, search as you type
set incsearch
" - Ignore case when searching
set ignorecase
" - Ignore case only when searching lowercase
set smartcase
" - Stop highlighting on Enter
map <silent> <CR> :noh<CR>

" Remove trailing white space on save
autocmd BufWritePre * %s/\s\+$//e

" Plugins
call plug#begin('~/.config/nvim/plugged')

" Use Deoplete for basic autocompletion:
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  " use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Use Molokai as the theme
Plug 'dracula/vim'

" Polyglot loads language support on demand
Plug 'sheerun/vim-polyglot'

" Support ansi escape codes when viewing documentation
Plug 'powerman/vim-plugin-AnsiEsc'

" Execute code checks and find errors and issues with code.
Plug 'neomake/neomake'
  " Run neomake on save
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END

" Make it easier to close files (buffers) without messing up window setup
Plug 'moll/vim-bbye'
  :nnoremap <Leader>q :Bdelete<CR>

" Add file searching like in sublime, bound to Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'rw'

" Add all file search like in sublime, bound to Ctrl-Shift-F
Plug 'dyng/ctrlsf.vim'
  map <C-S-f> :CtrlSF
  let g:ctrlsf_default_root = 'cwd'

Plug 'godlygeek/tabular'
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>
  vmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>

" Create tags automatically
Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_cache_dir = '~/.tags_cache'

Plug 'tpope/vim-rails'

Plug 'tpope/vim-repeat'

Plug 'scrooloose/nerdtree'
  " - Make sure it opens automatically when opening a directory with vim
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  " - Make it so it sets CWD when navigating using the tree
  "   this is to help ctrlp to search in the correct directory
  let g:NERDTreeChDirMode = 2
  let NERDTreeShowHidden=1
  " - Bind to hide/show the tree)
  nmap <silent> <leader>t :NERDTreeToggle<CR>

" Add sublime-style multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Add vim-airline
Plug 'vim-airline/vim-airline'
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'wombat'
  " Confiugre airline sections
  let g:airline_section_y = ""
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

Plug 'majutsushi/tagbar'
  nmap <F8> :TagbarToggle<CR>

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-abolish'

Plug 'tpope/vim-fugitive'

Plug 'blueyed/vim-diminactive'

Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Setup theme
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme Dracula
