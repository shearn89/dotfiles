#!/bin/bash

if [[ -f /etc/redhat-release ]]
then
  sudo yum install -y vim git
else
  sudo apt install vim git -y
fi

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim-sensible
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-sensible.git

git clone https://github.com/tpope/vim-unimpaired
git clone https://github.com/tpope/vim-markdown
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-characterize
git clone https://github.com/tpope/vim-commentary
git clone https://github.com/tpope/vim-abolish
git clone https://github.com/altercation/vim-colors-solarized

mkdir -p ~/repos ~/source
cd ~/source
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
git clone https://github.com/seebi/dircolors-solarized

# Install hub
echo "please install hub from https://github.com/github/hub/releases/latest"

cp vimrc ~/.vimrc
