#!/bin/sh
# do not run this as sudo

export NVM_DIR=$HOME/.nvm
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# update system first
sudo apt-get update 

# get curl or wget to run our scripts from web
sudo apt-get -y install curl wget git xclip firefox neovim apt-transport-https ca-certificates gnupg-agent software-properties-common file

# zsh and oh-my-zsh
rm -vrf $HOME/.oh-my-zsh
sudo apt-get -y install zsh
0>/dev/null sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# remove nodejs if exists
sudo apt-get -y remove nodejs
sudo apt-get -y autoremove

# disk managers
sudo apt-get -y install gnome-disk-utility
sudo apt-get -y install gparted

# package managers
sudo apt-get -y install ruby ruby-dev
sudo apt-get -y install snapd
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source $NVM_DIR/nvm.sh
nvm install --lts

# programmimg
sudo snap install --classic code
sudo snap install --classic kotlin 
sudo snap install --classic flutter
sudo snap install --classic dotnet-sdk
sudo apt-get -y install openjdk-8-jdk openjdk-11-jdk

# react-native
gem install cocoapods
npm install -g nodemon typescript expo-cli
sudo apt-get -y install watchman

# docker
sudo apt-get -y remove docker docker-engine docker.io containerd runc
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

# tools
npm i firebase-tools -g
npm install @openapitools/openapi-generator-cli -g

# terminal emulator
sudo apt-get -y install guake

sudo apt-get update && sudo apt-get upgrade -y
