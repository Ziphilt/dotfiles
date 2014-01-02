set nocompatible

syntax enable
set background=dark
colors solarized

execute pathogen#infect()
filetype plugin indent on
syntax sync fromstart

" misc
set autowrite
set backspace=indent,eol,start
" sentences are separated by two spaces
set cpoptions+=J
set history=1000
set modelines=0
set mouse=a
set nomodeline
set viminfo='1000,f1,<50,s10,h

" searching
set nohlsearch
set ignorecase
set incsearch
set smartcase

" indentation
set expandtab
set shiftwidth=4
set softtabstop=4
" only indent one sw in python after open paren
let g:pyindent_open_paren = '&sw'

" display
set cursorcolumn
set cursorline
"set foldcolumn=1
set foldcolumn=0
set foldmethod=manual
set laststatus=2
set linebreak
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set number
set ruler
set scrolloff=3
set showcmd
set showmatch
set splitright
set statusline=%<%f\ %h%r%y%m%=%02.B\ %5.(%c%V%)\ %4.l/%L\ %P
set textwidth=78
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

" make movement keys nice for dvorak
" (h is fine where it is)
noremap t j
noremap n k
noremap s l

" shift makes movement faster
noremap H 5h
noremap T 5j
noremap N 5k
noremap S 5l
" j, k, l unused
" t, n, s unbound
" TODO assign these something useful
noremap l <nop>
noremap k <nop>
" seems like a reasonable place to put this
noremap j n

nnoremap <leader><space> :set hlsearch!<cr>
" search for non-ascii characters (space and tilde are the limits of
" ascii printable chars)
nnoremap <leader>a /[^ -~]<cr>
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
