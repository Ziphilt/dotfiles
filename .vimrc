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

" automagically leave insert mode after a delay
"autocmd InsertEnter * let updaterestore = &updatetime | set updatetime=10000
"autocmd InsertLeave * let &updatetime = updaterestore
"autocmd CursorHoldI * stopinsert
" }}}

" ftdetect {{{
autocmd BufNewFile,BufRead *.muttrc set filetype=muttrc
autocmd BufNewFile,BufRead *.strace* set filetype=strace
" vim thinks .md is modula2
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.ino set filetype=cpp
" vim thinks empty .tex file is plaintex
autocmd BufNewFile,BufRead *.tex set filetype=tex
" }}}

" ftplugin {{{
autocmd FileType mail setlocal formatoptions+=aw " support format=flowed
" TODO collapse these all into one line
autocmd FileType text setlocal textwidth=78 autoindent
autocmd FileType tex setlocal textwidth=78 autoindent
autocmd FileType markdown setlocal textwidth=78 autoindent
" }}}

" YouCompleteMe config {{{

let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_autoclose_preview_window_after_insertion = 1
" disable youcompleteme for C sources, because its warnings are annoying
" TODO configure ycm to not be annoying
"let g:ycm_filetype_blacklist = {'c': 1}

" }}}

" Syntastic config {{{

let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_java_checkers = ['javac', 'checkstyle']

" }}}

" RainbowParentheses config {{{

" let g:rbpt_colorpairs = [
"     \ ['13',  'DarkOrchid3'],
"     \ ['4',   'firebrick3'],
"     \ ['2',   'RoyalBlue3'],
"     \ ['3',   'SeaGreen3'],
"     \ ['9',   'DarkOrchid3'],
"     \ ['1',   'firebrick3'],
"     \ ]

" augroup RainbowParentheses
"     autocmd!
"     autocmd VimEnter * RainbowParenthesesToggle
"     autocmd Syntax * RainbowParenthesesLoadRound
"     autocmd Syntax * RainbowParenthesesLoadSquare
"     autocmd Syntax * RainbowParenthesesLoadBraces
" augroup END

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
" fix annoying delay in terminal when pressing ESC to exit insert mode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
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
let g:solarized_italic=0
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
set listchars=tab:>=,trail:■,extends:>,precedes:<,nbsp:+
set number
set ruler
set scrolloff=3
set showcmd
set showmatch
set sidescroll=1
set sidescrolloff=5
set splitbelow
set splitright
set statusline=%<%1*%f%0*\ %h%r%y%{fugitive#statusline()}%2*%m%0*%=%02.B\ %5.(%c%V%)\ %4.l/%L\ %P
set textwidth=0 " TODO make this depend on filetype
set title
set titlestring=vim\ %f\ %h%r%y%m
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
