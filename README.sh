#!/usr/bin/env bash

set -ex

# Link "rc" files
mkdir -p ~/.config/nvim
ln -fs $PWD/bashrc ~/.bashrc
ln -fs $PWD/bash_profile ~/.bash_profile
ln -fs $PWD/inputrc ~/.inputrc
ln -fs $PWD/vimrc ~/.config/nvim/init.vim

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle install

# Install neovim plugins
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

# Set git email per project
git config --global init.defaultBranch main
git config --global user.useConfigOnly true
git config --global --unset-all user.email
git config --global user.name 'Kofi Gumbs'

# Exit terminal so that changes take effect
exit
