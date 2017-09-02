# ~/.\*



### Link `rc` files
```
ln -s $PWD/inputrc ~/.inputrc
ln -s $PWD/bash_profile ~/.bash_profile
ln -s $PWD/vimrc ~/.config/nvim/init.vim
```


### Install (n)vim plugins

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
```



### Set git email per project

```
git config --global user.useConfigOnly true
git config --global --unset-all user.email
```
