#!/bin/sh
# do not run this as sudo
 
export NVM_DIR=$HOME/.nvm
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
 
# conflict with Windows
timedatectl set-local-rtc 1 --adjust-system-clock

# synchronize database
sudo pacman-mirrors --api --protocol https && sudo pacman -Syyu --noconfirm

# utilities
sudo pacman -S docker docker-compose virt-install qemu zsh oh-my-zsh base-devel nvm ibus-unikey ttf-hack xclip gnome-disk-utility guake gparted --needed --noconfirm

# install AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --needed --noconfirm

# neovim, vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
yay -s neovim --needed --noconfirm

# oh-my-zsh
# rm -vrf $HOME/.oh-my-zsh
# 0>/dev/null sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# my life
nvm install --lts
sudo pacman -S snapd --needed --noconfirm
sudo systemctl enable --now snapd.socket
sudo snap install --classic code
sudo snap install --classic flutter
sudo snap install --classic android-studio
sudo snap install --classic postman
sudo snap install dotnet-sdk --channel=lts/stable --classic
sudo pacman -S jdk8-openjdk jdk11-openjdk --needed --noconfirm
yay -S watchman --needed --noconfirm

sudo usermod -a -G libvirt $(whoami)

# configuration
./config.sh

