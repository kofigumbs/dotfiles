" begin Vundle config
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on
" end Vundle config

syntax on
set clipboard=unnamed
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=2
set number
set wildmenu
set hlsearch
set incsearch

" Solarized theme settings
set background=dark
colorscheme solarized

" Toggle NERDTree with ctrl-n
map <NUL> :NERDTreeToggle<CR>
