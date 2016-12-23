# ~/.\*



### Link `rc` files
```
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/bashrc ~/.bashrc
ln -s $PWD/inputrc ~/.inputrc
```


### Install vim plugins

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
```

