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
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/creationix/nvm.git ~/.nvm && (cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`)

# Install pathogen.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# sensible.vim
git clone git://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible

if [[ ! -d ~/.vim/colors ]]; then
  mkdir -p ~/.vim/colors
fi

(cd ~/.vim/colors && curl -Sso https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim)
