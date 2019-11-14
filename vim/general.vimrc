" Make it so yank also copies to the system clipboard.
if has("win32")
  set clipboard=unnamed
else
  set clipboard+=unnamedplus
end

let g:netrw_keepdir=0

" Remove trailing white space on save
autocmd BufWritePre * %s/\s\+$//e

" Set title of terminal to reflect current file
set title

" Disable mouse integration
set mouse=""

" Highlight cursor position
set cursorline
set cursorcolumn

" Activate line numbering
set number

" Lets try deactivating swap files
set noswapfile

" No wrapping
set nowrap

" Searching
" - Highlight search results
set hlsearch
" - Incremental search, search as you type
set incsearch
" - Ignore case when searching
set ignorecase
" - Ignore case only when searching lowercase
set smartcase
" - nicer incremental search
set inccommand=nosplit

" Indentation
set tabstop=4

" - Filetype specific indentation settings
autocmd Filetype cs setlocal ts=4 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab

" Autoformat
au BufWrite *.rs :Autoformat
