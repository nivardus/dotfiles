#!/bin/bash

echo "Running OS X bootstrap"

if [ ! type brew &> /dev/null ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew install caskroom/cask/brew-cask git zsh
brew install vim tmux bash the_silver_searcher
brew install gnu-sed --with-default-names

if [ $(grep -c /private/etc/shells /usr/local/bin/bash) -eq 0 ]; then
  sudo bash -c 'echo /usr/local/bin/bash >> /private/etc/shells'
fi

if [[ $SHELL != *"zsh" ]]; then
  chsh -s $(which zsh)
fi
