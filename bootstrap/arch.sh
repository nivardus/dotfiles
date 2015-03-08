echo "Running Arch Linux bootstrap"

PACKER_TARBALL="packer.tar.gz"
PACKER_TMP_DIR="/tmp/packer-build"
PACKER_URL="https://aur.archlinux.org/packages/pa/packer/$PACKER_TARBALL"

sudo pacman -Sy
sudo pacman -S git ruby zsh nodejs vim curl expac jshon makepkg --noconfirm --needed

# Install packer
if ! type "packer" > /dev/null; then
(
mkdir $PACKER_TMP_DIR
cd $PACKER_TMP_DIR
curl -Ss $PACKER_URL
tar -xvf $PACKER_TARBALL
cd packer
makepkg -i
cd $HOME
rm -rf $PACKER_TMP_DIR
)
fi

packer -S rcm-git --noconfirm --noedit

chsh -s $(which zsh)
