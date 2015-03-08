#!/bin/bash

export PATH="$HOME/bin:$HOME/.rbenv/bin:/usr/lib/smlnj/bin:$PATH"
export SMLNJ_HOME=/usr/lib/smlnj

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 

eval "$(rbenv init -)"

alias serve="python2 -m SimpleHTTPServer"

export GOPATH=$HOME/go
export GOARCH=amd64
