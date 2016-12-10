# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.profile

alias ls='ls --color=auto'

if [ -f "$HOME/.machine" ]; then
  . "$HOME/.machine"
fi
