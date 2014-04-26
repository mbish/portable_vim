call pathogen#infect()

syntax on
imap <C-k> <Esc>
nmap ; a
nmap - :bp<CR>
nmap = :bn<CR>
nmap \ gt
nmap \| gT
nmap ds bdw
nmap <C-W>e <C-W>=-=
nmap <C-I> bi
set tabstop=4
set shiftwidth=4
set softtabstop=4
set dir=/tmp
set autoindent
set expandtab
set autowrite
set backspace=indent,eol,start
set nu
set ruler
set completeopt=menuone
set smarttab
set incsearch
set history=50
set hidden
set wildmode=list:longest,full

if filereadable(expand("~/.vimcolors"))
    source ~/.vimcolors
endif

let g:miniBufExplCheckDupeBufs = 0
