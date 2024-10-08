#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/bin

alias ls='ls --color=auto'
alias laa='ls -lah --color=auto'
alias sls='screen -ls'
alias grep='grep --color=auto'

# Competitive coding helper program
alias cpit='python3 /home/bigma/builds/python/CPIT/cpit.py' 

# Shortcut for creating code templates
alias cctemplate='bash /home/bigma/builds/python/CPIT-ADDON/add.sh'

# Shortcut for checking code
alias ccheck='cpit checker build/Debug/outDebug'

# For working with dotfiles
alias homegit='/usr/bin/git --git-dir=$HOME/arch-setup/homegit/ --work-tree=$HOME'

PS1='[\u@\h \W]\$ '


# Created by `pipx` on 2024-09-18 04:46:30
export PATH="$PATH:/home/bigma/.local/bin"

# Deactivate notifaction about cloudflare virtual environment
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Active cloudflare python package
source $HOME/.local/share/pipx/venvs/cloudscraper/bin/activate
