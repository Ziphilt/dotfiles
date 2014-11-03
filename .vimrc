set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax enable
syntax sync fromstart
filetype plugin indent on

" autocommands {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" misc {{{
"set autowrite
set hidden
set backspace=indent,eol,start
set cpoptions+=J " sentences are separated by two spaces
" TODO set t flag on things that aren't code: markdown, latex, mail, and text
" and the a flag too for autoformat while typing
set formatoptions+=croqj " make comments nicer to format
set gdefault
set history=1000
set modelines=0 " no mode lines
set mouse=a " enable mouse everywhere
set nomodeline
set viminfo='1000,f1,<50,s10,h
" }}}

" searching {{{
set ignorecase
set incsearch
set nohlsearch
set nowrapscan
set smartcase
" }}}

" indentation {{{
set expandtab
set shiftwidth=4
set softtabstop=4
" only indent one sw in python after open paren
let g:pyindent_open_paren = '&sw'
" }}}

" display {{{
set background=dark
" TODO this doesn't seem to work, unless I reload the vimrc after opening a
" file
"let g:solarized_italic=0
colorscheme solarized

"set foldcolumn=1
set cmdwinheight=3
set cursorcolumn
set cursorline
set foldcolumn=0
set foldmethod=manual
set laststatus=2 " always show status line
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
set textwidth=0 " TODO make this depend on filetype
set virtualedit=all
" highlight column 81 of lines that are at least that long
highlight ColorColumn ctermbg=10
call matchadd('ColorColumn', '\%81v', 100)
" }}}

" these break plugin indent
"set autoindent
" TODO set this with filetypes for which there are no indent rules
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

" bindings {{{

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
noremap w <nop>
noremap { <nop>
noremap } <nop>
" make arrow keys useful
inoremap <right> <nop>
inoremap <up> <c-x><c-y>
inoremap <left> <nop>
inoremap <down> <c-x><c-e>
noremap <right> zl
noremap <s-right> zL
noremap <up> <c-y>
noremap <left> zh
noremap <s-left> zH
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

" split line at cursor
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
nnoremap <leader>p :set paste! paste?<cr>
" reload config
nnoremap <leader>r :source $MYVIMRC<cr>
" search for extra space at the end of lines
nnoremap <leader>s / \+$<cr>
" edit .vimrc
nnoremap <leader>v :split $MYVIMRC<cr>
nnoremap <leader>V :edit $MYVIMRC<cr>
nnoremap b :write<cr>
" fold with matching delimiters
nnoremap <leader>z v%:fo<cr>
" }}} bindings
