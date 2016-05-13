" begin Vundle config
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'hkgumbs/vim-colors-m'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on
" end Vundle config

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
set noswapfile
set ls=2

colorscheme m

" Toggle NERDTree with ctrl-space
map <NUL> :NERDTreeToggle<CR>
