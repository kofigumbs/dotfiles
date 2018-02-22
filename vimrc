autocmd!

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-system-copy'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'maxbrunsfeld/vim-emacs-bindings'
Plug 'sheerun/vim-polyglot'
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

" Neovim - I should check out Vim8 at some point,
" since I'm really only taking advantage of terminals.
if has('nvim')
  tnoremap <C-[> <C-\><C-n>
  au TermOpen * setlocal nonumber | startinsert
  set inccommand=split
endif

" Ignore junk
set wildignore+=*/tmp/*,*/elm-stuff/*,*/node_modules/*,*.class,*.pyc,*.beam

" Formatters
autocmd BufWritePost *.elm call g:elm#format()

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
filetype plugin indent on

" Solarized
let g:solarized_hitrail = 1
colorscheme solarized

" Invisible vertical splits
set fillchars+=vert:\ 
hi VertSplit ctermbg=7 guibg=7

" Language-specific 😕
let g:elm_make_output_file = '/dev/null'
let g:elm_format_autosave = 1
let g:omni_sql_no_default_maps = 1
au FileType elm setl sw=4 sts=4 et
au FileType json setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType swift setl sw=4 sts=4 et
