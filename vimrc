"" Turn filetype off until vundle is loaded
filetype off

"" Install vundle if it isn't already installed
let iCanHazVundle=0
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing vundle..."
    echo
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=1
endif

"" Load vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"" Bundles to install
Bundle 'gmarik/vundle'
Bundle 'michalbachowski/vim-wombat256mod'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/VimClojure'
"Bundle 'wlangstroth/vim-racket'
"Bundle 'maxbrunsfeld/vim-yankstack'
"Bundle 'garbas/vim-snipmate'
"Bundle 'Raimondi/delimitMate'
"Bundle 'vim-scripts/vimwiki'
"Bundle 'scrooloose/syntastic'
"Bundle 'Lokaltog/vim-easymotion'

"" Install bundles if vundle was just installed for the first time
if iCanHazVundle == 1
    echo "Installing bundles"
    echo
    :BundleInstall
endif

"" Make vim less annoying
set nocompatible
filetype plugin indent on
set autoread
set lazyredraw
set noerrorbells
set timeout timeoutlen=1000 ttimeoutlen=100

"" Adding some color to vim
:syntax enable
set background=dark
set t_Co=256
:colorscheme wombat256mod
set showmatch

"" Backups and tmp files
silent !mkdir -p ~/.vim/{backup,tmp}
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"" Use spaces instead of tabs
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set backspace=indent,eol,start

"" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

"" Configure title and status bar
set title
set titlestring=%F\ [vim]
set laststatus=2
set report=0
set showcmd

"" Enable line numbers
set number
set numberwidth=5

"" Scrolling behavior
set scrolloff=10
set sidescrolloff=10

"" Better tab completion
set wildmenu
set wildmode=list:longest
set ofu=syntaxcomplete#Complete
set completeopt+=longest

"" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

"" Better search behavior
set incsearch
set ignorecase
set smartcase

"" Ignore whitespace and case in vimdiff
set diffopt+=iwhite
set diffopt+=icase

"" Set leader to ,
let mapleader = ","
let g:mapleader = ","

"" Mappings
"" t => down
"" T => join lines
"" n => up
"" N => help
"" s => right
"" S => screen bottom
"" j => jump(til)
"" J => jump(til) previous
"" k => klobber(subst) char
"" K => klobber(subst) line
"" l => leap(next)
"" L => leap(previous)
"" - => beg line
"" _ => end line
no t j
no T J
no n k
no N K
no s l
no S L
no j t
no J T
no k s
no K S
no l n
no L N
no - ^
no _ $

map ; :
nmap <leader>s :set spell!<CR>
nmap <leader>p :set paste!<CR>
nmap <leader>h :set hlsearch!<CR>
nmap <leader>n :exec &nu ? "set rnu" : "set nu"<CR>
nmap <leader>c :exec &cc=="" ? "set cc=80" : "set cc="<CR>
nmap <leader>x :exec &cuc && &cul ? "set nocuc nocul" : "set cuc cul"<CR>
