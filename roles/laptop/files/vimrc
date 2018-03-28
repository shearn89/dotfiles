execute pathogen#infect()

syntax enable
filetype plugin indent on

" case-sens search off, unless we search for something with caps specifically.
set ignorecase
set smartcase
set incsearch

" highlight matches. Do ':set noh' to hide.
set showmatch

" scroll screen when we get to the bottom 5 lines
set scrolloff=5

" theme
" set background=dark
" colorscheme solarized

" spacing
set et
set sw=2
set sts=2

" where are we?
set number
set ruler
set cul

" remove silly tablimit
set tabpagemax=100

" badass statusline
set statusline=%t       "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

