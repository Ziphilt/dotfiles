set nocompatible

colors molokai

filetype plugin indent on
syntax enable
syntax sync fromstart

" misc
set autowrite
set backspace=indent,eol,start
set modelines=0
set mouse=a
set history=1000
set viminfo='1000,f1,<50,s10,h

" searching
set hlsearch
set ignorecase
set incsearch
set smartcase

" indentation
set expandtab
set shiftwidth=4
set softtabstop=4

" display
set cursorcolumn
set cursorline
set foldcolumn=1
set foldmethod=manual
set laststatus=2
set linebreak
set number
set ruler
set showmatch
set virtualedit=all

" might not be a good default
"set gdefault

" these break plugin indent
"set autoindent
"set smartindent

" not supported everywhere
"set undofile

" possibly not a good idea on multi-user system
"set backupdir=~/.vim/backup/
"set directory=~/.vim/backup/
"set undodir=~/.vim/backup/

" gui specific
"set guifont=Envy\ Code\ R\ 10
"nnoremap<leader>t :au! FocusLost<cr>
"au FocusLost * :wa

nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>d :read !date +\%Y-\%m-\%d<cr>
nnoremap <leader>l :set list!<cr>
nnoremap <leader>o :browse oldfiles<cr>
" reload config
nnoremap <leader>r :source ~/.vimrc<cr>
" search for extra space at the end of lines
nnoremap <leader>s / \+$<cr>
" edit .vimrc
nnoremap <leader>v :vsplit ~/.vimrc<cr>
nnoremap <leader>w :write<cr>
" fold with matching delimiters
nnoremap <leader>z v%:fo<cr>
