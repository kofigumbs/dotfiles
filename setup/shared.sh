# Link `rc` files

ln -fs $PWD/inputrc ~/.inputrc
ln -fs $PWD/bashrc ~/.bashrc
ln -fs $PWD/bash_profile ~/.bash_profile

mkdir -p ~/.config/nvim
ln -fs $PWD/vimrc ~/.config/nvim/init.vim


# Install (n)vim plugins

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


nvim +PlugInstall +qall


# Set git email per project

git config --global user.useConfigOnly true
git config --global --unset-all user.email
git config --global user.name 'Kofi Gumbs'
