autocmd!

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-system-copy'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'hkgumbs/elm-vim'
Plug 'janko-m/vim-test'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
call plug#end()

" Sane defaults
set backspace=2
set foldmethod=indent
set hlsearch
set incsearch
set ls=2
set nofoldenable
set noswapfile
set nowrap
set number
set spell
set wildmenu
set winminwidth=20
set winwidth=84
syntax on

" Ignore line wrap with j/k
nnoremap j gj
nnoremap k gk

" Readline shortcuts in insert mode
inoremap <silent> <C-b> <left>
inoremap <silent> <C-f> <right>

"Neovim terminal helpers
tnoremap <C-[> <C-\><C-n>
au TermOpen * setlocal nonumber | startinsert
let test#strategy = "neovim"

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

" Formatters
autocmd BufWritePost *.elm call g:elm#format()

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
filetype plugin indent on
au FileType elm setl sw=4 sts=4 et
au FileType json setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType swift setl sw=4 sts=4 et

" Solarized
let g:solarized_hitrail = 1
colorscheme solarized

" Invisible vertical splits
set fillchars+=vert:\ 
hi VertSplit ctermbg=7 guibg=7

" GVim
set gcr=n:blinkon0
set guioptions-=L
set guioptions-=R
set guioptions-=T
set guioptions-=b
set guioptions-=l
set guioptions-=r
set guioptions+=c
