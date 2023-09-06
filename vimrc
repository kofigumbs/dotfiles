autocmd!

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-system-copy'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'maxbrunsfeld/vim-emacs-bindings'
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
call plug#end()

syntax on
highlight Search ctermbg=LightGray

set backspace=2
set fillchars+=vert:\ 
set foldmethod=indent
set hlsearch
set incsearch
set linebreak
set ls=2
set nofoldenable
set noswapfile
set nowrap
set number
set wildignore+=*/tmp/*,*/elm-stuff/*,*/node_modules/*,*.class,*.pyc,*.beam
set wildmenu
set winminwidth=20
set winwidth=84

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
au FileType cpp setl sw=4 sts=4 et
au FileType elm setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType swift setl sw=4 sts=4 et
filetype plugin indent on

" Terminal
set termwinkey=<Esc>
autocmd TerminalWinOpen * setlocal nonumber

" FZF
nnoremap <C-p> :call fzf#run(fzf#wrap(fzf#vim#with_preview({ 'dir': FugitiveWorkTree(), 'source': 'git ls-files --cached --others --exclude-standard' })))<CR>
