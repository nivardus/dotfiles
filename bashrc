# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ $OSTYPE == 'linux-gnu' ]]; then
  alias ls='ls --color=auto'
elif [[ $OSTYPE == 'darwin' ]]; then
  alias ls='ls -G'
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

if [ -f "$HOME/.machine" ]; then
  . "$HOME/.machine"
fi
