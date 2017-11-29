let mapleader=','
let maplocalleader = ','

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-system-copy'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'janko-m/vim-test'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
if has('nvim')
  tnoremap <C-[> <C-\><C-n>
  au TermOpen * setlocal nonumber norelativenumber
  let test#strategy = "neovim"
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
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'solarized'
let g:solarized_hitrail = 1
colorscheme solarized

" Invisible vertical splits
set fillchars+=vert:\ 
hi VertSplit ctermbg=7 guibg=7

" Formatters
function! s:withReload(cmd)
  execute a:cmd
  edit
endfunction
autocmd BufWritePost *.elm call s:withReload('!elm-format --yes %')
autocmd BufWritePost *.py call s:withReload('!yapf --in-place %')

" GVim
set gcr=n:blinkon0
set guioptions-=L
set guioptions-=R
set guioptions-=T
set guioptions-=b
set guioptions-=l
set guioptions-=r
set guioptions+=c
