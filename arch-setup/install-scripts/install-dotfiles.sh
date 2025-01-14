#!/bin/bash

## Notes: You'll need to remove .bashrc, .bash_profile, and other
## files that could cause conflicts with git checkout
## If the last step fails, just run the last two commands here again

mkdir $HOME/arch-setup
git clone --bare https://github.com/BigMangoHead/Arch-Setup $HOME/arch-setup/homegit

## This one might fail
/usr/bin/git --git-dir=$HOME/arch-setup/homegit --work-tree=$HOME checkout

/usr/bin/git --git-dir=$HOME/arch-setup/homegit --work-tree=$HOME config --local status.showUntrackedFiles no
