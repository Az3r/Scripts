#!/bin/sh
# do not run this as sudo

export NVM_DIR=$HOME/.nvm
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# update system first
sudo apt-get update 

# get curl or wget to run our scripts from web
sudo apt-get -y install trash-cli curl wget git xclip firefox neovim apt-transport-https ca-certificates gnupg-agent software-properties-common file build-essential gnome-disk-utility gparted unzip python3-pip dosfstools

# unikey
sudo add-apt-repository -y ppa:ubuntu-vn/ppa
sudo apt-get update
sudo apt-get install -y ibus-unikey

# zsh and oh-my-zsh
rm -vrf $HOME/.oh-my-zsh
sudo apt-get -y install zsh
0>/dev/null sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# remove nodejs if exists
sudo apt-get -y remove nodejs
sudo apt-get -y autoremove

# package managers
sudo apt-get -y install ruby ruby-dev
sudo apt-get -y install snapd
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts

# search tools
sudo apt-get install -y fd-find fzf

# programmimg
sudo snap install --classic code
sudo snap install --classic android-studio
sudo snap install --classic kotlin 
sudo snap install --classic flutter
sudo snap install --classic postman
sudo snap install dotnet-sdk --channel=lts/stable --classic
sudo snap install --classic heroku
sudo apt-get -y install openjdk-8-jdk openjdk-11-jdk

# react-native
sudo gem install cocoapods
sudo apt-get -y install watchman

# docker
sudo apt-get -y remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

# tools
npm i vercel
npm i firebase-tools -g
npm i @openapitools/openapi-generator-cli -g

# fonts
sudo apt-get -y install fonts-hack-ttf

# terminal emulator
sudo apt-get -y install guake

# kvm for android emulator
sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
sudo adduser `id -un` libvirt
sudo adduser `id -un` kvm

sudo apt-get update && sudo apt-get upgrade -y

./config.sh

echo 'Done! you can remove this repo now'

