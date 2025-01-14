#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/bin
export MANPATH=:~/.man

alias ls='ls --color=auto'
alias laa='ls -lah --color=auto'
alias sls='screen -ls'
alias grep='grep --color=auto'

# Quick command for moving to math classes directory
alias cm='cd ~/math/classes/undergrad'

# Competitive coding helper program
alias cpit='python3 /home/bigma/builds/python/CPIT/cpit.py' 

# Shortcut for creating code templates
alias cctemplate='bash /home/bigma/builds/python/CPIT-ADDON/add.sh'

# Shortcut for checking code
alias ccheck='cpit checker build/Debug/outDebug'

# For working with dotfiles
alias homegit='/usr/bin/git --git-dir=$HOME/arch-setup/homegit/ --work-tree=$HOME'

# Math notes command
alias mn='source ~/scripts/lua/mn/mn.sh'

PS1='[\u@\h \W]\$ '
