autocmd!

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-system-copy'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'maxbrunsfeld/vim-emacs-bindings'
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
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
set wildmenu
set winminwidth=20
set winwidth=84
syntax on

" Ignore line wrap with j/k
nnoremap j gj
nnoremap k gk

" Make solarized terminal colors less harsh
highlight Search ctermbg=LightGray

" Fast fuzzy file finder that respects .gitignore
nnoremap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" Terminal settings
tnoremap <C-[> <C-\><C-n>
au TermOpen * setlocal nonumber | startinsert
set inccommand=split

" Ignore junk
set wildignore+=*/tmp/*,*/elm-stuff/*,*/node_modules/*,*.class,*.pyc,*.beam

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
filetype plugin indent on

" Invisible vertical splits
set fillchars+=vert:\ 
hi VertSplit ctermbg=7 guibg=7

" Language-specific
au FileType cpp setl sw=4 sts=4 et
au FileType elm setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType swift setl sw=4 sts=4 et
