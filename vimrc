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
" Triumph
Plug 'kofigumbs/fugitive-azure-devops.vim'
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

" Make solarized terminal colors less harsh
highlight Search ctermbg=LightGray

" Configure FZF
function! ProjectFiles()
  let l:cmd = " <(git -C @ ls-files --cached --others --exclude-standard | sed 's|^|@/|')"
  return 'cat'
        \ . substitute(l:cmd, '@', 'decode', 'g')
        \ . substitute(l:cmd, '@', 'hubtran-web', 'g')
        \ . substitute(l:cmd, '@', 'payments-network', 'g')
        \ . substitute(l:cmd, '@', 'signer', 'g')
        \ . substitute(l:cmd, '@', 'unified-api', 'g')
        \ . substitute(l:cmd, '@', 'unified-api-messages', 'g')
        \ . substitute(l:cmd, '@', 'TriumphPay', 'g')
endfunction
nnoremap <C-p> :call fzf#run(fzf#wrap(fzf#vim#with_preview({ 'source': ProjectFiles() })))<CR>

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

" Invisible vertical splits
set fillchars+=vert:\ 
hi VertSplit ctermbg=7 guibg=7

" Language-specific
au FileType cpp setl sw=4 sts=4 et
au FileType elm setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType swift setl sw=4 sts=4 et

" Elm format
function! s:withReload(cmd)
  execute a:cmd
  edit
endfunction
autocmd BufWritePost *.elm call s:withReload('!elm-format --yes %')
