#!/usr/bin/env bash

set -ex

# Install Homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew bundle install


# Link `rc` files

ln -fs $PWD/inputrc ~/.inputrc
ln -fs $PWD/bashrc ~/.bashrc
ln -fs $PWD/bash_profile ~/.bash_profile

mkdir -p ~/.config/nvim
ln -fs $PWD/vimrc ~/.config/nvim/init.vim


# Install neovim plugins

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall

sudo pip3 install neovim-remote


# Set git email per project

git config --global user.useConfigOnly true
git config --global --unset-all user.email
git config --global user.name 'Kofi Gumbs'
