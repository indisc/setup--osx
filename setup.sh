#!/bin/bash

#Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# make sure we´re using the latest Homebrew
brew update

# upgrade any

brew upgrade

formulae=(
  coreutils
  moreutils
  findutils
  wget -enable-iri
  vim --override-system-vi
  homebrew/dupes/grep
  homebrew/dupes/screen
  openssl
  git
  gnugp
  imagemagick
  postgresql
  memcached
  mysql
  sqlite
  caskroom/cask/brew-cask
)

for item in formulae
  do
    brew install $item
done

brew link openssl --force

#cask
#apps
apps=(
  google-chrome
  firefox
  1password
  iterm2
  slack
  virtualbox
  evernote
  dash
  flux
  skype
  sourcetree
  sqlitebrowser
  dnscrypt
  opera
  vagrant
  mamp
  transmit
  libreoffice
  seqel-pro
  sublime-text3
  vlc
  zsh
)
# install apps to ~/applications
#default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="~/Applications" ${apps[@]}

#remove outdated version from the cellar
brew cleanup

# rvm

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

#NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

git clone https://github.com/indisc/dotfiles_hukl dotfiles | gitsubmodule init && submodule update

