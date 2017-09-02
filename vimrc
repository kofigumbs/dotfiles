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
Plug 'keith/swift.vim', {'for': 'swift'}
call plug#end()

set backspace=2
set clipboard=unnamed
set expandtab
set foldmethod=indent
set hlsearch
set incsearch
set ls=2
set nofoldenable
set noswapfile
set nowrap
set number
set shiftwidth=2
set softtabstop=2
set spell
set tabstop=2
set wildmenu
set winminwidth=20
set winwidth=84

" Ignore line wrap with j/k
nnoremap j gj
nnoremap k gk

" Open NERDTree with Ctrl-N
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Readline shortcuts in insert mode
inoremap <silent> <C-b> <left>
inoremap <silent> <C-f> <right>

"Neovim terminal helpers
if has('nvim')
  tnoremap <C-[> <C-\><C-n>
  au TermOpen * setlocal nonumber norelativenumber
  command! -nargs=* TE split | terminal <args>
endif

"Neovim live search replace
if exists('&inccommand')
  set inccommand=split
endif

"Ignore junk
set wildignore+=*/tmp/*,*/elm-stuff/*,*/node_modules/*,*.class,*.pyc,*.beam

" Wrap words in quick fix
augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

" Indentation (default to 2)
filetype plugin indent on
au FileType elm setl sw=4 sts=4 et
au FileType json setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType swift setl sw=4 sts=4 et

let NERDTreeShowHidden = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'solarized'
let g:elm_format_autosave = 1
let g:elm_make_output_file = '/dev/null'
let g:solarized_hitrail = 1

colorscheme solarized

" Nicer vertical splits
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

" GVim
set gcr=n:blinkon0
set guioptions-=L
set guioptions-=R
set guioptions-=T
set guioptions-=b
set guioptions-=l
set guioptions-=r
set guioptions+=c
