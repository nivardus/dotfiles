# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ $OSTYPE == 'linux-gnu' ]]; then
  alias ls='ls --color=auto'
  PS1='[\u@\h \W]\$ '
elif [[ $OSTYPE == 'darwin' ]]; then
  alias ls='ls -G'
fi

if [ -f "$HOME/.machine" ]; then
  . "$HOME/.machine"
fi
