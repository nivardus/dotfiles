export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="clean"
DISABLE_AUTO_UPDATE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

emulate sh
. ~/.bashrc
emulate zsh
