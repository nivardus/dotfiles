#!/bin/bash

DISTRO=`gawk -F= '/^NAME/{print $2}' /etc/os-release`

if [[ $DISTRO == '"Arch Linux"' ]]; then
  ./install/arch.sh
else
  echo "No installation script for $DISTRO"
fi  
