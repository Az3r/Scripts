#!/bin/bash

# oh-my-zsh
chsh -s "$(which zsh)"
cp ./.zshrc ~/.zshrc
source ~/.zshrc

# git
git config --global user.name 'azer'
git config --global user.email 'azerprojects@gmail.com'
git config --global mergetool.keepBackup false

# nvim
mkdir -p $HOME/.config/nvim
cp -r ./nvim/. $HOME/.config/nvim/

# guake
guake --restore-preferences ./guake

# generate ssh for github
ssh-keygen -t ed25519 -C "azerproject@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo 'Copy generated SSH key to clipboard'
xclip -sel clip < ~/.ssh/id_ed25519.pub
echo 'Paste the SSH key to your github account'
