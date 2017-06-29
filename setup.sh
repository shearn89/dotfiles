#!/bin/bash

# Install vim
sudo apt install vim

# Install git
sudo apt install git

# Install hub
xdg-open https://github.com/github/hub/releases/latest

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim-sensible
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-sensible.git

git clone tpope/vim-unimpaired
git clone tpope/vim-markdown
git clone tpope/vim-surround
git clone tpope/vim-characterize
git clone tpope/vim-commentary
git clone tpope/vim-abolish
git clone altercation/vim-colors-solarized

mkdir -p ~/repos ~/source
cd ~/source
git clone Anthony25/gnome-terminal-colors-solarized
git clone seebi/dircolors-solarized

