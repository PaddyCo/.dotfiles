" Plugins
call plug#begin('~/.config/nvim/plugged')

" Allows you to navigate out of vim into other tmux panes using the pane shortcuts, very handy
Plug 'christoomey/vim-tmux-navigator'

" Adds some good commands like :Move and :Rename
Plug 'tpope/vim-eunuch'

" Very good file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles -o -c --exclude-standard
  endif
endfun

" Easy motion
Plug 'easymotion/vim-easymotion'

" Add all file search like in sublime, bound to Ctrl-Shift-F
Plug 'dyng/ctrlsf.vim'
  let g:ctrlsf_default_root = 'cwd'

" File explorer
Plug 'scrooloose/nerdtree'
  " - Make it so it sets CWD when navigating using the tree
  "   this is to help fzf to search in the correct directory
  let g:NERDTreeChDirMode = 2
  let NERDTreeShowHidden = 1

" Tagbar, handy in certain languages
Plug 'majutsushi/tagbar'
  let g:tagbar_left = 1
  let g:tagbar_autofocus = 1
  let g:tagbar_autoclose = 1

" Create ctags automatically
Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_cache_dir = '~/.tags_cache'

" Highlight when yanking
Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration = 200

" Vim note taking
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" Syntax checking
Plug 'vim-syntastic/syntastic'

" Theme plugin
Plug 'morhetz/gruvbox'
call plug#end()
