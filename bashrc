# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ $OSTYPE == 'linux-gnu' ]]; then
  alias ls='ls --color=auto'
elif [[ $OSTYPE == 'darwin' ]]; then
  alias ls='ls -G'
fi

export PS1="\u@\h \[\033[32m\]\W\[\033[33m\]\[\033[00m\] $ "

if [ -f "$HOME/.machine" ]; then
  . "$HOME/.machine"
fi
