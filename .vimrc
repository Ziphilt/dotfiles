set nocompatible

syntax enable
set background=dark
colorscheme solarized

execute pathogen#infect()
filetype plugin indent on
syntax sync fromstart

" misc
set autowrite
set backspace=indent,eol,start
" sentences are separated by two spaces
set cpoptions+=J
set gdefault
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
set nowrapscan

" indentation
set expandtab
set shiftwidth=4
set softtabstop=4
" only indent one sw in python after open paren
let g:pyindent_open_paren = '&sw'

" display
"set foldcolumn=1
set cmdwinheight=3
set cursorcolumn
set cursorline
set foldcolumn=0
set foldmethod=manual
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=tab:>=,trail:-,extends:>,precedes:<,nbsp:+
set number
set ruler
set scrolloff=3
set showcmd
set showmatch
set sidescroll=1
set sidescrolloff=5
set splitbelow
set splitright
set statusline=%<%1*%f%0*\ %h%r%y%2*%m%0*%=%02.B\ %5.(%c%V%)\ %4.l/%L\ %P
set textwidth=78
set virtualedit=all

" these break plugin indent
"set autoindent
"set smartindent

if has('persistent_undo')
    set undofile
    set undodir=~/.vim/backup/
endif

" possibly not a good idea on multi-user system
"set backupdir=~/.vim/backup/
"set directory=~/.vim/backup/

" gui specific
"set guifont=Envy\ Code\ R\ 10
"nnoremap<leader>t :au! FocusLost<cr>
"au FocusLost * :wa

" bindings

" all of these will change
noremap <C-e> <nop>
noremap H <nop>
noremap K <nop>
noremap L <nop>
noremap M <nop>
noremap N <nop>
noremap S <nop>
noremap T <nop>
noremap V <nop>
noremap k <nop>
noremap l <nop>
noremap n <nop>
noremap s <nop>
noremap t <nop>
noremap v <nop>
" as yet unused
noremap <C-v> <nop>
noremap B <nop>
noremap W <nop>
noremap b <nop>
noremap j <nop>
noremap w <nop>
noremap { <nop>
noremap } <nop>
" make arrow keys useful
inoremap <right> <nop>
inoremap <up> <c-x><c-y>
inoremap <left> <nop>
inoremap <down> <c-x><c-e>
noremap <right> e
noremap <s-right> E
noremap <up> <c-y>
noremap <left> ge
noremap <s-left> gE
noremap <down> <c-e>

" make movement keys nice for dvorak
" (h is fine where it is)
noremap t j
noremap n k
noremap s l

" shift makes movement faster
noremap H b
noremap T }
noremap N {
noremap S w

" put s and S somewhere
noremap v s
noremap V S

" put n and N somewhere
noremap l n
noremap L N

" M for 'manual'; free up K
noremap M K

" put t and T somewhere
noremap k t
noremap K T

" visual on home row
noremap e v
noremap E V
noremap <C-e> <C-V>

nnoremap j i<cr><esc>k$

" prefer ex mode, start in insert
nnoremap : q:i
nnoremap q: :

" execute macro over all lines
vnoremap @q :normal @q<cr>

nnoremap <leader><space> :set hlsearch! hlsearch?<cr>
" search for non-ascii characters (space and tilde are the limits of
" ascii printable chars)
nnoremap <leader>a /[^ -~]<cr>
nnoremap <leader>d :read !date +\%Y-\%m-\%d<cr>
nnoremap <leader>l :set list! list?<cr>
nnoremap <leader>m :make<cr>
nnoremap <leader>o :browse oldfiles<cr>
" reload config
nnoremap <leader>r :source $MYVIMRC<cr>
" search for extra space at the end of lines
nnoremap <leader>s / \+$<cr>
" edit .vimrc
nnoremap <leader>v :split $MYVIMRC<cr>
nnoremap <leader>V :edit $MYVIMRC<cr>
nnoremap <leader>w :write<cr>
" fold with matching delimiters
nnoremap <leader>z v%:fo<cr>
