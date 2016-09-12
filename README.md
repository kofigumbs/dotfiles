# ~/.\*



### Get the files
```
rc() {
  curl -o ~/.$1rc https://raw.githubusercontent.com/hkgumbs/dotfiles/master/$1rc
}

rc vim
rc gvim
rc input
```


### Install vim plugins

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
gvim +PlugInstall +qall
```


### Append to bash config file

```
stty -ixon      # fixes ctrl-s issue in terminal applications
export PS1='\n\[\e[1m\]\w$(__git_ps1)\n$ \[\e[0m\]'  # prompt
```
