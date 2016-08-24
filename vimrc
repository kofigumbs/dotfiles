call plug#begin("~/.vim/plugged")
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'wikitopian/hardmode'
call plug#end()

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
set foldmethod=indent
set nofoldenable

nnoremap j gj
nnoremap k gk
