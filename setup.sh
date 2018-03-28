#!/bin/bash

if [[ -f /etc/redhat-release ]]
then
  sudo yum install -y \
    vim \
    git \
    tree \
    jq \
    curl
else
  sudo apt -y install \
    vim \
    git \
    tree \
    jq \
    curl \
    build-essential \
    apt-transport-https \
    ca-certificates \
    software-properties-common

  # Repo setup
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
  curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo add-apt-repository "deb https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
  sudo add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
  
  pushd /tmp
  wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
  sudo dpkg -i puppetlabs-release-pc1-xenial.deb
  rm -f puppetlabs-release-pc1-xenial.deb
  popd
  
  # Post-repo setup installs
  sudo apt update
  sudo apt install -y \
    docker-ce \
    virtualbox-5.2 \
    google-chrome \
    puppet-agent
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
git clone https://github.com/rodjek/vim-puppet
git clone https://github.com/altercation/vim-colors-solarized

mkdir -p ~/repos ~/source
pushd ~/source
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
git clone https://github.com/seebi/dircolors-solarized
popd

# Install hub
echo "please install hub from https://github.com/github/hub/releases/latest"

cp vimrc ~/.vimrc
cp bash_aliases ~/.bash_aliases
cp gemrc ~/.gemrc
cp tmux.conf ~/.tmux.conf

# rvm
echo "installing RVM"
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1
source "$HOME/.rvm/scripts/rvm"
rvm use 2.1 --default
gem install bundler

cp profile ~/.profile
echo "complete"
