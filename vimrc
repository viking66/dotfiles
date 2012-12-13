filetype plugin indent on

" putting the fundle in your <vundle>
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

" <bundles> of joy
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
Bundle 'vim-scripts/VimClojure'
Bundle 'wlangstroth/vim-racket'
"Bundle 'garbas/vim-snipmate'
"Bundle 'Raimondi/delimitMate'
"Bundle 'vim-scripts/vimwiki'
"Bundle 'scrooloose/syntastic'
"Bundle 'Lokaltog/vim-easymotion'

" <bundles> gots to be <git>
if iCanHazVundle == 1
    echo "Installing bundles"
    echo
    :BundleInstall
endif

"" embrace the <random>
set nocompatible
filetype plugin indent on
set autoread
set lazyredraw
set noerrorbells

"" dream in <color>
:syntax enable
set background=dark
set t_Co=256
:colorscheme muon
set showmatch

"" <back> that shit <up>
silent !mkdir -p ~/.vim/{backup,tmp}
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"" i don't need <no> stinking <tabs>
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set backspace=indent,eol,start

"" bleed the <extra> <whitespace>
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

"" instert <status> and <title> here
set title
set titlestring=%f\ [vim]
set laststatus=2
set report=0
set showcmd
"set statusline=%F%m%r%h%w\ %y\ [%p%%]\ [%c:%l:%L]

"" safety in <numbers>
set number
set numberwidth=5

"" <scroll> like a mofo
set scrolloff=10
set sidescrolloff=10

"" expand to <completion>
set wildmenu
set wildmode=list:longest
set ofu=syntaxcomplete#Complete
set completeopt+=longest

"" check my bling <yankring> yo
let g:yankring_history_dir = '~/.vim/backup'

"" <supertab> is superfly
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

"" the <search> ends here
set incsearch
set ignorecase
set smartcase

"" hide some <vimdiff> madness
set diffopt+=iwhite
set diffopt+=icase

"" follow the <leader>
let mapleader = ","
let g:mapleader = ","
nmap <leader>s :set spell!<CR>

"" who needs a <map> when you have gps
map ; :
nmap <leader>h :set hlsearch!<CR>
nmap <leader>n :exec &nu ? "set rnu" : "set nu"<CR>
nmap <leader>c :exec &cc=="" ? "set cc=80" : "set cc="<CR>
nmap <leader>x :exec &cuc && &cul ? "set nocuc nocul" : "set cuc cul"<CR>
