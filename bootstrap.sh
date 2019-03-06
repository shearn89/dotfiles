#!/bin/bash

echo "This will install ansible and update the system. You will be prompted for a password."

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
