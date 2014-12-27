echo "Running OS X bootstrap"

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
brew install git
brew install zsh
brew tap thoughtbot/formulae
brew install rcm

chsh -s $(which zsh)
