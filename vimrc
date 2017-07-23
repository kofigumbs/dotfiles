let mapleader=','
let maplocalleader = ','

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-system-copy'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
""""
Plug 'ElmCast/elm-vim', {'for': 'elm'}
Plug 'Quramy/tsuquyomi', {'for': 'typescript'}
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
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
set nowrap
set winwidth=84
set winminwidth=20

" Ignore line wrap with j/k
nnoremap j gj
nnoremap k gk

" Toggle spell check with Leader-S
nnoremap <leader>s :setlocal spell!<cr>

" Open NERDTree with Ctrl-N
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Readline shortcuts in insert mode
inoremap <silent> <C-b> <left>
inoremap <silent> <C-f> <right>

"Neovim terminal leader
if has('nvim')
  tnoremap <C-[> <C-\><C-n>
endif

"Neovim live search replace
if exists('&inccommand')
  set inccommand=split
endif

"Ignore junk
set wildignore+=*/tmp/*,*/node_modules/*,*.class,*.pyc,*.beam

" Wrap words in quick fix
augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

filetype plugin indent on

let g:elm_format_autosave = 1
let g:elm_make_output_file = '/dev/null'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'solarized'
let g:solarized_hitrail = 1
let NERDTreeShowHidden = 1

colorscheme solarized

" Nicer vertical splits
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE
