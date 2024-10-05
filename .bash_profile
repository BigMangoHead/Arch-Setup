#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

# Created by `pipx` on 2024-09-18 04:46:30
export PATH="$PATH:/home/bigma/.local/bin"
