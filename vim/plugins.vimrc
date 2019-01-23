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
if !exists("g:gui_oni")
  Plug 'SirVer/ultisnips'
endif

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
if !exists("g:gui_oni")
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
endif

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

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" - Plugin for TS autocompletion
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'Shougo/vimproc.vim', { 'for': 'typescript' }

" Ale for linting
Plug 'w0rp/ale'

" Autoformat
Plug 'Chiel92/vim-autoformat'

" Neomake
Plug 'neomake/neomake', { 'for': 'rust' }
au BufWritePost *.rs Neomake

" Rust
if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
  set hidden
  let g:racer_cmd = "/home/patrik/.cargo/bin/racer"
  let g:racer_experimental_completer = 1
  au FileType rust nmap <leader>gx <Plug>(rust-doc)
  au FileType rust nmap <leader>gd <Plug>(rust-def)
  au FileType rust nmap <leader>gs <Plug>(rust-def-split)
endif

" Theme plugin
Plug 'morhetz/gruvbox'
call plug#end()
