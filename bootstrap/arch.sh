echo "Running Arch Linux bootstrap"

AURA_TARBALL="aura-bin.tar.gz"
AURA_TMP_DIR="/tmp/aura-bin-build"
AURA_URL="https://aur.archlinux.org/cgit/aur.git/snapshot/$AURA_TARBALL"

sudo pacman -Sy
sudo pacman -S tmux git vim curl abs gmp pcre the_silver_searcher --noconfirm --needed

# Install packer
if ! type "aura" > /dev/null; then
(
  mkdir $AURA_TMP_DIR
  cd $AURA_TMP_DIR
  curl -SsO $AURA_URL
  tar -xvf $AURA_TARBALL
  cd aura-bin
  makepkg -i
  cd $HOME
  rm -rf $AURA_TMP_DIR
)
fi

if [[ $DESIRED_SHELL == "zsh" ]]; then
  sudo pacman -S zsh
  if [[ $SHELL != *"zsh" ]]; then
    chsh -s $(which zsh)
  fi
fi
