#### Setup script—`exec bash README.md`

    set -ex

#### Link "rc" files

    mkdir -p ~/.config/nvim
    ln -fs $PWD/bashrc ~/.bashrc
    ln -fs $PWD/bash_profile ~/.bash_profile
    ln -fs $PWD/inputrc ~/.inputrc
    ln -fs $PWD/vimrc ~/.vimrc

#### Install homebrew

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew bundle install

#### Install vim plugins

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall

#### Configure git

    git config --global init.defaultBranch main
    git config --global user.useConfigOnly true
    git config --global user.name 'Kofi Gumbs'
    git config --global --unset-all user.email # force per-project decision
