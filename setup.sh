#!/usr/bin/env bash

### GIT ###
git config --global core.editor $(which vim)
git config --global user.name "hkgumbs"
###########

### ZSH ###
chsh -s $(which zsh)
ln -s zshrc ~/.zshrc
###########

### VIM ###
curl ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s vimrc ~/.vimrc
vim +PlugInstall +qall
###########
