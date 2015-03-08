#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DISTRO=`gawk -F= '/^NAME/{print $2}' /etc/os-release`

if [[ $DISTRO == '"Arch Linux"' ]]; then
  "$DIR/arch.sh"
else
  echo "No installation script for $DISTRO"
fi  
