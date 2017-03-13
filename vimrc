let mapleader=','
let maplocalleader = ','

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-system-copy'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ElmCast/elm-vim', {'for': 'elm'}
Plug 'keith/swift.vim', {'for': 'swift'}
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
set winwidth=84
set winminwidth=20
set spell

nnoremap j gj
nnoremap k gk
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

inoremap <silent> <C-b> <left>
inoremap <silent> <C-f> <right>

let g:elm_format_autosave = 1
let g:elm_make_output_file = '/dev/null'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'solarized'
let g:solarized_hitrail = 1
let NERDTreeShowHidden = 1

colorscheme solarized
