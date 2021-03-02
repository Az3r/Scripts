#!/bin/sh

cp -v ~/.zshrc ./.zshrc
cp -vr ~/.config/nvim .
guake --save-preferences ./guake

# copy Microsoft boot files
sudo cp -vr /boot/efi/EFI/Microsoft .
