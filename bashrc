# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# User specific aliases and functions
HISTCONTROL=ignoreboth
EDITOR=vim
TERMINAL=xterm

export PS1='[\h:\W]\$ '
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Set flags
# set -o vi
