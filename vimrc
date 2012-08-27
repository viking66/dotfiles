" Setting up vundle
let iCanHazVundle=0
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing vundle..."
    echo
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=1
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" plugins
Bundle 'gmarik/vundle'
Bundle 'gregsexton/Muon'
Bundle 'michalbachowski/vim-wombat256mod'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/L9'
"Bundle 'garbas/vim-snipmate'
"Bundle 'Raimondi/delimitMate'
"Bundle 'vim-scripts/vimwiki'
"Bundle 'scrooloose/syntastic'

" install plugins
if iCanHazVundle == 1
    echo "Installing bundles"
    echo
    :BundleInstall
endif
" End of vundle

""vim not vi
set nocompatible

""""""" colors """"""
""syntax highlighting
:syntax enable
""dark background
set background=dark
""enable 256 colors
set t_Co=256
""make things pretty
:colorscheme muon

"""""" misc """"""
""filetype specific plugins and indents
filetype plugin indent on
""when file changes outsied of vim autoread changes
set autoread

""""""" dackups and swap """"""
""make sure the dirs exist
silent !mkdir -p ~/.vim/{backup,tmp}
""backup before overwriting
set backup
""set the backup dir
set backupdir=~/.vim/backup
""set the swap file dir
set directory=~/.vim/tmp

"""""" whitespace """"""
""no extra pixels added between lines
set linespace=0
""in insert mode tabs expand to spaces
set expandtab
""tab at front of line inserts spaces (not autocomplete)
set smarttab
""\t = 4 spaces
set tabstop=4
""4 spaces for each step of (auto)indent
set shiftwidth=4
""tab is 4 spaces in edit operations
set softtabstop=4
""copy indent from current line to next line
set autoindent
""make backspace more friendly
set backspace=indent,eol,start

"""""" look and feel """""" 
""title on
set title
""title = filename [vim]
set titlestring=%f\ [vim]
""always show status bar
set laststatus=2
""pretty status line
set statusline=%F%m%r%h%w\ %y\ [%p%%]\ [%c:%l:%L]
""print line numbers
set number
""at least 5 columns for line numbers
set numberwidth=5
""minimum num lines above and below cursor
set scrolloff=10
""minimum num columns left and right of cursor
set sidescrolloff=10
""highlight matching bracket
set showmatch
""always report changes for ':' commands
set report=0
""show partial command at bottom of screen
set showcmd
""do not redraw while executing macros
set lazyredraw
""stop the beep for error messages
set noerrorbells

"""""" completion """"""
""enable completion menu
set wildmenu
""list matches and complete longest matching substring
set wildmode=list:longest
""turn on omnicompletion
set ofu=syntaxcomplete#Complete
""complete up to longest matching substring
set completeopt+=longest
""use conext to decide completion
let g:SuperTabDefaultCompletionType = "context"
""only complete up to longest matching substring
let g:SuperTabLongestEnhanced = 1
""automatically highlight first possible match
let g:SuperTabLongestHighlight = 1

"""""" search """"""
""goto match as you type
set incsearch
""ignore case in search
set ignorecase
""search has upper case chars -> case sensitive
set smartcase

"""""" vimdiff """"""
""in diff mode ignore changes in amount of whitespaces
set diffopt+=iwhite
""in diff mode ignore changes in case
set diffopt+=icase

"""""" mappings """"""
""now ';' con be used instead of ':'
map ; :
""leader is ','
let mapleader = ","
""leader is ','
let g:mapleader = ","
""toggle spell/nospell
nmap <leader>s :call g:ToggleSpell()<CR>
""toggle crosshair
nmap <leader>c :call g:ToggleCrosshair()<CR>
""toggle relative/absolute line numbers
nmap <leader>n :call g:ToggleRnu()<Esc>h 

"""""" yankring """"""
""dir for history file
let g:yankring_history_dir = '~/.vim/backup'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""toggles between relative line numbers and absolute line numbers
function! g:ToggleRnu()
    if (&rnu == 1)
        set nu
    else
        set rnu
    endif
endfunc

""toggles spellcheck on/off
function! g:ToggleSpell()
    if (&spell == 1)
        set nospell
    else
        set spell
    endif
endfunc

""toggles crosshair on/off
function! g:ToggleCrosshair()
    if (&cursorline || &cursorcolumn)
        set nocursorline
        set nocursorcolumn
    else
        set cursorline
        set cursorcolumn
    endif
endfunc
