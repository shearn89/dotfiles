" @tpope's totally badass runtime management engine
execute pathogen#infect()

" Now we override stuff:
" Syntax highlighting, indentation by filetype
filetype indent plugin on
syntax on

" allow files to remain open when switching
set hidden

" delete indents etc
" make it easier to see where you are.
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set number
set cul

" scroll screen when we get to the bottom 5 lines
set scrolloff=5

" case-sens search off, unless we search for something with caps specifically.
set ignorecase
set smartcase
set incsearch

" highlight matches. Do ':set noh' to hide.
set showmatch

" typoz
nore ; :
:command WQ wq
:command Wq wq
:command W w
:command Q q

" don't wrap by default
set nowrap
set t_Co=16

"" Tabs and space stuff
" 4 space tabs
set tabstop=4 shiftwidth=4 softtabstop=4
" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4
" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4
" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4

" plugin shizzle.
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

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
set statusline+=\ %{fugitive#statusline()}  " vim-fugitive git status

" load tags files up to root
set tags=./tags;/
