# ~/.\*



### Get `.*rc` files
```
curl -o ~/.vimrc https://raw.githubusercontent.com/hkgumbs/dotfiles/master/vimrc
curl -o ~/.gvimrc https://raw.githubusercontent.com/hkgumbs/dotfiles/master/gvimrc
```


### Install vim plugins

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
gvim +PlugInstall +qall
```


### Setup bash

```
export PS1='\n\[\e[1m\]\w$(__git_ps1)\n$ \[\e[0m\]'
curl -o ~/.inputrc https://raw.githubusercontent.com/hkgumbs/dotfiles/master/inputrc
```

