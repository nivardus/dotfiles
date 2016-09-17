#!/bin/bash

SKIP_INSTALL=false

for a in "$@"
do
  case $a in
  '--skip-install')
    SKIP_INSTALL=true
    ;;
  esac
done

echo $SKIP_INSTALL