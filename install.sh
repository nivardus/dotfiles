#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  ./bootstrap/linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  ./bootstrap/darwin.sh
else
  echo "Unsupported OS $OSTYPE"
  return 1
fi

# Install oh my zsh, rbenv, ruby build, nvm 
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/creationix/nvm.git ~/.nvm && (cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`)

if [[ ! -d ~/.vim/colors ]]; then
  mkdir -p ~/.vim/colors
fi

(cd ~/.vim/colors && curl -O https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim)
