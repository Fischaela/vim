" Initialize Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
execute pathogen#infect()

" Enable syntax highlighting
syntax on
filetype plugin indent on

" Add line numbers
set number
set ruler

" Colorscheme
color smyck

" Fonts
set guifont=Monaco\ Regular:h15

" Set encoding
set encoding=utf-8

" Whitespace stuff
" set nowrap
set wrap linebreak nolist
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show matching parenthesis
set showmatch

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Search related settings
set incsearch
set hlsearch

" Add ability to cancel a search with Escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Make uses real tabs
au FileType make set noexpandtab

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Nerdtree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Hit the right arrow to open a node
let NERDTreeMapActivateNode='<right>'
" Display hidden files
let NERDTreeShowHidden=1
" Do not display some useless files in the tree
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" Get rid of pipe in split view separator
set fillchars+=vert:\ 