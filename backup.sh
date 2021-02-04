#!/bin/sh

cp -v ~/.zshrc ./.zshrc
cp -vr ~/.config/nvim .
guake --save-preferences ./guake
