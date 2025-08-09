#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/bin
export MANPATH=:~/.man

# Vi mode
set -o vi

alias ls='ls --color=auto'
alias laa='ls -lah --color=auto'
alias sls='screen -ls'
alias grep='grep --color=auto'

# Quick command for moving to math classes directory
alias cm='cd ~/math/classes/undergrad'

# For working with dotfiles
alias homegit='/usr/bin/git --git-dir=$HOME/arch-setup/homegit/ --work-tree=$HOME'

# Math notes command
alias mn='source ~/scripts/lua/mn/mn.sh'

# Quick DRP reference
alias drp='cd /home/bigma/math/classes/undergrad/drp-s25; mupdf ~/math/classes/undergrad/drp-s25/Rat\ points\ on\ ECs\ -\ Silverman\ and\ Tate.pdf &'

# Quick GMTK game jam reference
alias gmtk='cd /home/bigma/coding/projects/gmtk-2025/gmtk-jam-2025'

# Quick ARML team reference
alias arml='cd ~/math/teaching/coaching/ARML-2025'

# Quick Putnam studying reference
alias putnam='cd ~/math/math-comp/meets/summer-2025/; mupdf PutnamAndBeyond-Andreescu.pdf &'

PS1='[\u@\h \W]\$ '
