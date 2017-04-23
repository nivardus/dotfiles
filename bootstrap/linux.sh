#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DISTRO=`gawk -F= '/^NAME/{print $2}' /etc/os-release`

case "$DISTRO" in
'"Arch Linux"')
  "$DIR/arch.sh"
  ;;
'"Debian GNU/Linux"')
  "$DIR/debian.sh"
  ;;
'"Alpine Linux"')
  "$DIR/alpine.sh"
  ;;
*)
  echo "No installation script for $DISTRO"
esac
