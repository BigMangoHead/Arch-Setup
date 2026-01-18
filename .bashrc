#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/bin
export MANPATH=:~/.man
export EDITOR="nvim"

# Vi mode
set -o vi

alias ls='ls --color=auto'
alias laa='ls -lah --color=auto'
alias sls='screen -ls'
alias grep='grep --color=auto'

# Get java working
export JAVA_HOME=/usr/lib/jvm/java-24-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Prevent ranger from loading the default config
export RANGER_LOAD_DEFAULT_RC=false

# Quick command for moving to math classes directory
alias cm='cd ~/math/classes/undergrad'

# For working with dotfiles
alias homegit='/usr/bin/git --git-dir=$HOME/arch-setup/homegit/ --work-tree=$HOME'

# Math notes command
alias mn='source ~/scripts/lua/mn/mn.sh'

# Quick command for moving to math classes directory
alias cc='cd ~/coding/classes'

# Quick Putnam studying reference
alias putnam='cd ~/math/math-comp/meets/winter-2025/; mupdf PutnamAndBeyond-Andreescu.pdf &'

PS1='[\u@\h \W]\$ '

# Add zoxide
eval "$(zoxide init bash)"
