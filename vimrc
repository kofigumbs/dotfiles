autocmd!

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-system-copy'
Plug 'inkarkat/vim-SyntaxRange'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'maxbrunsfeld/vim-emacs-bindings'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
call plug#end()

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
set ruler
set wildignore+=*/tmp/*,*/elm-stuff/*,*/node_modules/*,*.class,*.pyc,*.beam
set wildmenu
set winminwidth=20
set winwidth=84

" Highlighting
syntax on
highlight Search ctermbg=LightGray
autocmd FileType javascript call SyntaxRange#Include('sql`', '`', 'sql')
autocmd FileType javascriptreact call SyntaxRange#Include('sql`', '`', 'sql')
autocmd FileType ruby call SyntaxRange#Include('\(<<[~-]SQL.*\n\s*\)\@<=.', '^\s*SQL', 'sql')
autocmd FileType ruby call SyntaxRange#Include('\(<<[~-]ERB.*\n\s*\)\@<=.', '^\s*ERB', 'eruby')

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
autocmd FileType cpp setlocal sw=4 sts=4 et
autocmd FileType elm setlocal sw=4 sts=4 et
autocmd FileType python setlocal sw=4 sts=4 et
autocmd FileType swift setlocal sw=4 sts=4 et
filetype plugin indent on

" Terminal
set termwinkey=<Esc>
autocmd TerminalWinOpen * setlocal nonumber

" FZF
nnoremap <C-p> :call fzf#run(fzf#wrap(fzf#vim#with_preview({ 'dir': FugitiveWorkTree(), 'source': 'git ls-files --cached --others --exclude-standard' })))<CR>

" SQL
let g:ftplugin_sql_omni_key = '<C-;>'
let g:omni_sql_default_compl_type = 'syntax' " https://github.com/neovim/neovim/issues/14433
