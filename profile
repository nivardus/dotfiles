#!/bin/bash

export PATH="$HOME/bin:$HOME/.rbenv/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 

eval "$(rbenv init -)"

alias serve="python -m http.server"
