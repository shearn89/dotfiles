#!/bin/bash

echo "This script requires you to set up your user account with NOPASSWD sudo access."
echo "Exit now if this needs doing... You have 30 seconds to ctrl-c."
sleep 30
echo "This will install ansible and configure the system. You may be prompted for a password."

if [[ -f /etc/redhat-release ]]
then
  grep Fedora /etc/redhat-release >/dev/null 2>&1
  if [[ $? == 0 ]]
  then
    sudo dnf upgrade -y
    sudo dnf install -y python python-pip sshpass git
    pip install --user ansible
  else
    sudo yum upgrade -y 
    sudo yum install -y ansible openssh-server git
  fi
elif [[ -f /etc/os-release ]]
then
  sudo pacman -Syu --noconfirm
  sudo pacman -Sy --noconfirm python ansible openssh git
elif [[ $(uname) == "Darwin" ]]
  # mac
  pip install --user ansible
else
  # Debian, set up ansible DEB repo
  sudo apt-get update -y
  sudo apt-get install -y software-properties-common openssh-server git
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update -y
  sudo apt-get install -y ansible
  sudo apt-get upgrade -y
fi

if [[ ! -d .git ]]
then
  mkdir -p ~/repos/
  pushd ~/repos/
  git clone https://github.com/shearn89/dotfiles.git
  cd dotfiles
fi

echo "Getting ansible roles"
ansible-galaxy install rvm.ruby
echo "Ansible installed, now running the playbook."
ansible-playbook site.yml
