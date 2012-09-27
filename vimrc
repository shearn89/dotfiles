call pathogen#infect() " enable pathogen

filetype indent plugin on	" enable file-specific indenting/plugins
syntax on

set hidden			" allows to hide a buffer
set backspace=indent,eol,start	" allows backspacing over indent, eol etc.
set autoindent
set nostartofline		" preserve column position when moving
set ruler			" show pos in statusline
set laststatus=2		" make status 2 lines tall
set confirm			" asks for confirmation if quitting with unsaved stuff
" set visualbell		" visual bell instead of audio bell
set number			" show line numbers
set cul				" highlight current line

" :command C let @/=""		" Use :C to clear search highlight, instead of :noh

set backup			" store backups etc in 1 directory.
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set scrolloff=5			" minimum lines between you and the top/bottom of screen
" set ttyfast			" fast terminal

set ignorecase
set smartcase			" ignore case if all lowercase, otherwise match.
set incsearch			" incremental search

set showmatch			" flash matching brackets

nore ; :			" map ; to :, saving shift-presses!
imap ii <C-[>			" map 'ii' to switch from insert to cmd.

" typo fixes:
:command WQ wq
:command Wq wq
:command W w
:command Q q

set nowrap			" turn off wrapping

set background=light
colorscheme solarized    " enable solarized colourscheme (pathogen bundle)