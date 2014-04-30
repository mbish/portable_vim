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

if filereadable(expand("~/.colors.vim"))
    source ~/.colors.vim
endif

let g:miniBufExplCheckDupeBufs = 0
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

autocmd Syntax html call SyntaxRange#Include("<markdown>", "</markdown>", "markdown")
autocmd Syntax html call SyntaxRange#Include("```python", "```", "python")
autocmd Syntax markdown call SyntaxRange#Include("```python", "```", "python")
set conceallevel=2
syntax match Todo /{code\w\*}/ conceal

if filereadable(expand("~/.local.vim"))
    source ~/.local.vim
endif
