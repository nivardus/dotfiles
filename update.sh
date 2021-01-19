#!/bin/bash

DESIRED_SHELL=bash
DESKTOP=false
HELP_TEXT="usage: update.sh [--skip-install] [--desktop]"
SKIP_INSTALL=false

for a in "$@"
do
  case $a in
  '--skip-install')
    SKIP_INSTALL=true
    ;;
  '--desktop')
    DESKTOP=true
    ;;
  *)
    echo $HELP_TEXT
    exit 1
    ;;
  esac
done


DOTFILES=(
  'bashrc'
  'tmux.conf'
  'vim'
  'vimrc'
)

DESKTOP_DOTFILES=(
  'config'
  'Xresources'
)

# git-based plugins
REPOS=(
  'https://github.com/benmills/vimux.git'                  "$HOME/.vim/pack/plugins/start/vimux"
  'https://github.com/christoomey/vim-tmux-navigator.git'  "$HOME/.vim/pack/plugins/start/vim-tmux-navigator"
  'https://github.com/ctrlpvim/ctrlp.vim.git'              "$HOME/.vim/pack/plugins/start/ctrlp.vim"
  'https://github.com/danro/rename.vim.git'                "$HOME/.vim/pack/plugins/start/rename.vim"
  'https://github.com/junegunn/vim-easy-align.git'         "$HOME/.vim/pack/plugins/start/vim-easy-align"
  'https://github.com/michaeljsmith/vim-indent-object.git' "$HOME/.vim/pack/plugins/start/vim-indent-object"
  'https://github.com/scrooloose/nerdcommenter.git'        "$HOME/.vim/pack/plugins/start/nerdcommenter"
  'https://github.com/tmux-plugins/tmux-sensible.git'      "$HOME/.tmux/plugins/tmux-sensible"
  'https://github.com/tmux-plugins/tpm.git'                "$HOME/.tmux/plugins/tpm"
  'https://github.com/tpope/vim-sensible.git'              "$HOME/.vim/pack/plugins/start/vim-sensible"
  'https://github.com/tpope/vim-surround.git'              "$HOME/.vim/pack/plugins/start/vim-surround"
)

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Source ignore file
if [[ -f '$DIR/.ignore' ]]; then
  source "$DIR/.ignore"
fi

# Create local tmp dir for vim swap files
mkdir -p "$HOME/tmp"

clone_or_update_git_repo () {
  repo=$1
  path=$2
  short=`echo $repo | sed -r 's|^.*/([^/]*)\.git$|\1|'`

  if [ -d "$path/.git" ]; then
    echo "Updating $short ($path)"
    (cd $path && git pull)
  else
    echo "Cloning $short ($path)"
    git clone $repo $path
  fi
}

install_and_update () {
  if [[ "$OSTYPE" == "linux-gnu" || "$OSTYPE" == "linux-musl" ]]; then
    "$DIR/bootstrap/linux.sh"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    "$DIR/bootstrap/darwin.sh"
  else
    echo "Unsupported OS $OSTYPE"
    return 1
  fi

  echo "Installing pathogen"
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -Sso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

  echo "Installing monokai vim theme"
  mkdir -p ~/.vim/colors
  curl -Sso ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim

  echo "Installing onedark vim theme"
  curl -Sso ~/.vim/colors/onedark.vim https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
  curl -Sso ~/.vim/autoload/onedark.vim https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim

  mkdir -p ~/.tmux/plugins

  # Update or install git-based plugins

  REPO_LENGTH=${#REPOS[@]}
  for ((i=0; i < $REPO_LENGTH; i=$i+2));
  do
    clone_or_update_git_repo ${REPOS[$i]} ${REPOS[$i+1]}
  done
}

link_dotfiles () {
  args=("$@")
  for i in "${args[@]}" 
  do
    if [[ ! $IGNORE =~ $i ]]; then
      if [[ -f "$DIR/$i" ]]; then
        # symlink files
        echo "$DIR/$i -> ~/.$i"
        ln -fs "$DIR/$i" "$HOME/.$i"
      elif [[ -d "$DIR/$i" ]]; then
        # recurse directories, symlinking
        # files within
        files=`find $DIR/$i -type f`
        for file in ${files[@]}
        do
          dest="$HOME/.${file#$DIR/}"
          echo "$file -> $dest"
          mkdir -p `dirname $dest`
          ln -fs $file $dest
        done
      fi
    fi
  done
}

if ! $SKIP_INSTALL ; then
  install_and_update
fi

echo "Linking dotfiles"
link_dotfiles "${DOTFILES[@]}"

if $DESKTOP ; then
  echo "Linking desktop dotfiles"
  link_dotfiles "${DESKTOP_DOTFILES[@]}"
fi
