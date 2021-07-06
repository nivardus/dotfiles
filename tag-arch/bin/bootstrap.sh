#!/usr/bin/env bash

set -e


echo "Running Arch Linux bootstrap"

sudo pacman -Sy
sudo pacman -S tmux git vim curl abs gmp pcre the_silver_searcher --noconfirm --needed
