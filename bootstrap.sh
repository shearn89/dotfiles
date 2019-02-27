#!/bin/bash

echo "This will install ansible and update the system. You will be prompted for a password."

if [[ -f /etc/redhat-release ]]
then
  # check for fedora?
  # sudo dnf upgrade -y
  # sudo dnf install python python-pip sshpass
  # pip install --user ansible
  # RedHat, set up ansible RPM repo
  sudo yum upgrade -y 
  sudo yum install -y ansible openssh-server
elif [[ -f /etc/os-release ]]
then
  sudo pacman -Syu --noconfirm
  sudo pacman -Sy --noconfirm python ansible openssh
else
  # Debian, set up ansible DEB repo
  sudo apt-get update -y
  sudo apt-get install -y software-properties-common openssh-server
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update -y
  sudo apt-get install -y ansible
  sudo apt-get upgrade -y
fi

echo "Getting ansible roles"
ansible-galaxy install rvm_io.ruby
echo "Ansible installed, now run the playbook."
