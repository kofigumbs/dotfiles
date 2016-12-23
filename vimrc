call plug#begin("~/.vim/plugged")
Plug 'hkgumbs/vim-colors-m'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/matchit'
Plug 'ElmCast/elm-vim', {'for': 'elm'}
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
Plug 'Shougo/vimproc.vim', {'do' : 'make', 'for': 'haskell'}
call plug#end()

set clipboard=unnamed
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=2
set number
set wildmenu
set hlsearch
set incsearch
set noswapfile
set ls=2
set foldmethod=indent
set nofoldenable
set nowrap
set colorcolumn=81

let g:elm_format_autosave = 1
let g:elm_make_output_file = "/dev/null"

nnoremap j gj
nnoremap k gk

colorscheme m
