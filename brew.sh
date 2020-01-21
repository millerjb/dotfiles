#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if which brew > /dev/null; then
  echo "brew is installed"
else
  echo "brew not installed - installing"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Taps

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash bash-completion2
bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash

# Install essential tools
brew install \
axel \
dos2unix \
fzf \
git \
openssl \
ripgrep \
the_silver_searcher \
thefuck \
tree \
vim \
wget \
zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k ~/.powerlevel10k


# Install development libraries
brew install \
glide \
go \
maven \
nvm \
python \
python@2

nvm install 8

# Install IDEs
brew cask install \
adoptopenjdk \
docker \
intellij-idea-ce \
p4v \
powershell \
visual-studio-code

# Install essential business apps
brew cask install \
dropbox \
evernote \
slack \
spotify \
the-unarchiver

# Install UI customizations
brew cask install \
alfred \
bartender \
caffeine \
homebrew/cask-drivers/logitech-options \
rcdefaultapp \
sizeup \
spectacle

# Remove outdated versions from the cellar
brew cleanup

# put brew first in path
echo "Fixing path to have /usr/local/bin first"
sudo sed -i '' '/\/usr\/local\/bin/d' /private/etc/paths
sudo sed -i '' '1s/^/\/usr\/local\/bin\'$'\n/' /private/etc/paths

