# ~/.\*



### Get the files
```
rc() {
  curl -o ~/.$1rc https://raw.githubusercontent.com/hkgumbs/dotfiles/master/$1rc
}

rc vim
rc input
rc bash
```


### Install vim plugins

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
```

