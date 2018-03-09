" Plugins
call plug#begin('~/.config/nvim/plugged')

" Allows you to navigate out of vim into other tmux panes using the pane shortcuts, very handy
Plug 'christoomey/vim-tmux-navigator'

" Adds some good commands like :Move and :Rename
Plug 'tpope/vim-eunuch'

" Syntax for a ton of languages
Plug 'sheerun/vim-polyglot'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Detect whitespace settings
Plug 'tpope/vim-sleuth'

" Snippets manager
Plug 'SirVer/ultisnips'

" Deoplete for all completions
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

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

" Indent guides
Plug 'Yggdroot/indentLine'

" Syntax checking
Plug 'vim-syntastic/syntastic'

" Theme plugin
Plug 'morhetz/gruvbox'
call plug#end()
