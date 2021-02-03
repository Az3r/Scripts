#!/bin/sh

cp ~/.zshrc .zshrc
cp -r ~/.config/nvim nvim
guake --save-preferences ./guake

git add .
git commit -m 'update'
git push
