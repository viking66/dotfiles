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
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'

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
:colorscheme solarized
set showmatch
set synmaxcol=120

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

"" Supertab settings
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

"" Better search behavior
set incsearch
set ignorecase
set smartcase

"" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"" Ignore whitespace and case in vimdiff
set diffopt+=iwhite
set diffopt+=icase

"" Automatically leave insert mode after 15 seconds of inactivity
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
au InsertLeave * let &updatetime=updaterestore

"" Airline settings
let g:airline_theme="solarized"
let g:airline_powerline_fonts=1
let g:powerline_loaded=1

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
nmap <leader>b :exec &cc=="" ? "set cc=80" : "set cc="<CR>
nmap <leader>c :qa<CR>
nmap <leader>x :exec &cuc && &cul ? "set nocuc nocul" : "set cuc cul"<CR>
nmap <leader>w :%s/ \+$//g<CR>
