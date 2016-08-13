### GIT ###
git config --global core.editor $(which vim)
git config --global user.name "hkgumbs"
###########

### ZSH ###
chsh -s $(which zsh)
ln -s zshrc ~/.zshrc
###########

### VIM ###
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s vimrc ~/.vimrc
vim +PlugInstall +qall
###########
