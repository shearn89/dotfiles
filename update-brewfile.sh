#!/bin/zsh
brew bundle dump --file=~/.Brewfile --force
python roles/laptop/files/update_files.py
