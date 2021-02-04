#!/bin/sh


export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# update system first
sudo apt-get update 

# get curl or wget to run our scripts from web
sudo apt-get -y install trash-cli curl wget git xclip neovim 
  
# zsh and oh-my-zsh
rm -vrf $HOME/.oh-my-zsh
sudo apt-get -y install zsh
0>/dev/null sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# remove nodejs if exists
sudo apt-get -y remove nodejs
sudo apt-get -y autoremove

# FTP server
sudo apt-get -y install samba

# Print server
sudo apt-get -y install cups

# config network

# others
echo 'Please enter your password'
chsh -s /bin/zsh

cp -r nvim ~/.config/nvim


