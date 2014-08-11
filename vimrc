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
" set visualbell
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

" 4 space tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4

" plugin shizzle.
syntax enable
if has('gui_running')
	set background=light
else
	set background=dark
endif
colorscheme solarized

execute pathogen#infect()
