export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="clean"
DISABLE_AUTO_UPDATE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

emulate sh
. ~/.profile

emulate zsh

if [ -f "$HOME/.machine" ]; then
  . "$HOME/.machine"
fi

# zsh clean theme prompt with hostname added
PROMPT='%{$fg[$NCOLOR]%}%n@%M%{$reset_color%}:%{$fg[blue]%}%B%c/%b%{$reset_color%} $(git_prompt_info)%(!.#.$) '
