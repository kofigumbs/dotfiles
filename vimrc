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

" Defaults
set backspace=2
set foldmethod=indent
set hlsearch
set incsearch
set linebreak
set ls=2
set nofoldenable
set noswapfile
set nowrap
set number
set wildmenu
set winminwidth=20
set winwidth=84
syntax on

" Tweak colors for Terminal.app Solarized
set background=light
set fillchars+=vert:\ 
highlight Search ctermbg=LightGray
highlight VertSplit ctermbg=7 guibg=7

" Configure FZF to show untracked files, exclude .gitignore'd files, and use the same directory as fugitive
nnoremap <C-p> :call fzf#run(fzf#wrap(fzf#vim#with_preview({ 'dir': FugitiveWorkTree(), 'source': 'git ls-files --cached --others --exclude-standard' })))<CR>

" Terminal settings
tnoremap <C-[> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
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

" Language-specific
au FileType cpp setl sw=4 sts=4 et
au FileType elm setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType swift setl sw=4 sts=4 et
