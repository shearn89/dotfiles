call plug#begin()
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-characterize'
  Plug 'rodjek/vim-puppet'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'altercation/vim-colors-solarized'
  " Plug 'scrooloose/nerdtree'
  " Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'cormacrelf/dark-notify'
  " Plug 'ryanoasis/vim-devicons'
call plug#end()

:lua <<EOF
require('dark_notify').run()
EOF

" Configure plugins for tab completion and status bar
let g:lightline = {
	\ 'component': {
	\   'lineinfo': ' %3l:%-2v',
	\ },
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
        \ },
	\ 'component_function': {
	\   'readonly': 'LightlineReadonly',
	\   'fugitive': 'LightlineFugitive'
	\ },
        \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
        \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
	\ }

" Custom functions for statusbar
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? ' '.branch : ''
	endif
	return ''
endfunction

" Basic stuff
syntax on
set notermguicolors
colorscheme solarized

filetype plugin indent on
set autoindent

set cul
set ruler
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set sts=2 sw=2 et

set scrolloff=5

set splitbelow
set splitright

set noshowmode
"" not needed in nvim
" set encoding=UTF-8

" normal mode remaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Run nerdtree, make it non-focussed and then close if it's the only thing
" open
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd l
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" set textwidth=72
" set wrap
