echo "Running Debian bootstrap"

sudo apt-get update -y
sudo apt-get install -y vim tmux git silversearcher-ag

if [[ $DESIRED_SHELL == "zsh" ]]; then
  sudo apt-get install -y zsh
  if [[ $SHELL != *"zsh" ]]; then
    chsh -s $(which zsh)
  fi
fi
