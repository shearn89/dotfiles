#!/bin/bash

echo "This will clone some git repos and set up the colours."
git clone https://github.com/karlin/mintty-colors-solarized
cp mintty-colors-solarized/.mintty--solarized-light ~/.minttyrc

git clone https://github.com/seebi/dircolors-solarized
cp dircolours-solarized/dircolors.ansi-light ~/.dir_colors

echo 'alias ls="ls --color"' >> ~/.bashrc
echo 'eval `dircolors ~/.dir_colors`' >> ~/.bashrc

git clone https://github.com/altercation/vim-colors-solarized\
mkdir -p ~/.vim/colors
cp vim-colors-solarized/colors/solarized.vim ~/.vim/colors/

echo "
set background=light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized" >> ~/.vimrc
