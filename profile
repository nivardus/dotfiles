#!/bin/bash

export PATH="$HOME/bin:$HOME/.rbenv/bin:/usr/lib/smlnj/bin:$PATH"
export SMLNJ_HOME=/usr/lib/smlnj

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 

eval "$(rbenv init -)"

alias serve="python2 -m SimpleHTTPServer"

export GOPATH=$HOME/go
export GOARCH=amd64

function docker_fwd () {
  machine=$1
  localport=$2
  machineport=$3
  echo  "${localport}:localhost:${machineport}"
  ssh -i ~/.docker/machine/machines/$machine/id_rsa docker@$(docker-machine ip $machine) -N -L "${localport}:localhost:${machineport}"
}

function docker_rm_exited () {
  docker rm -v $(docker ps -aq -f status=exited)
}

function docker_rm_dangling () {
  docker rmi $(docker images -f "dangling=true" -q)
}

function docker_clean () {
  docker_rm_exited
  docker_rm_dangling
}

alias dfwd="docker_fwd"
alias dclean="docker_clean"
