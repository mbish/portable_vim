call pathogen#infect()

colorscheme slate
" Syntax settings 
syntax on
syntax match Todo /{code\w\*}/ conceal

" Key bindings
" imap <C-k> <Esc>
" imap <C-d> <Esc>:w<CR>
" nmap ; a
" nmap - :bp<CR>
" nmap = :bn<CR>
" nmap _ :tabnext<CR>
" nmap + :tabprevious<CR>
" nmap \ gt
" nmap \| gT
" nmap ds bdw
" nmap <C-W>e <C-W>=-=
" nmap <C-I> bi
" nmap <C-d> <Esc>:w<CR>
"
"" package specific key bindings
nmap <c-n> :MBEFocus<CR>
nmap <F2> :NERDTreeToggle<CR>
imap <c-l> <Esc><Plug>(easymotion-bd-w)
nmap <c-l> <Plug>(easymotion-bd-w)
nmap <c-j> <Plug>(easymotion-bd-s)
nmap <c-p> :Ack 

"" leader bindings
nmap <space> <leader>
nmap <leader>q :bd<CR>

"" esoteric keybindings
nmap <F7> :mks! /tmp/session.vim <CR>:wqa<CR>
nmap <F8> :let root = getcwd()<CR>:exec system("cat /tmp/session.vim \| grep -P 'badd\|cd'") \| exec 'cd ' . root<CR>

" Options
set tabstop=4
set shiftwidth=4
set softtabstop=4
set directory=/tmp
set autoindent
set expandtab
set autowrite
set backspace=indent,eol,start
set number
set ruler
set completeopt=menuone
set incsearch
set history=50
set hidden
set wildmode=list:longest,full
set tags=~/mytags
set conceallevel=2
set updatetime=500
set mouse-=a

" Package Variables
let g:loaded_diminactive=1
let &colorcolumn=join(range(81,999),',')

let g:EasyMotion_smartcase = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_pug_checkers = ['pug_lint']
let g:syntastic_less_checkers = ['lessc']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_python_checkers = ['flake8']

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ale_lint_on_text_changed = 'never'

let g:miniBufExplCheckDupeBufs = 0

let g:NERDTreeQuitOnOpen=1

let g:R_in_buffer = 0
let g:R_applescript = 0


" Autocmds
augroup vimrc
    autocmd!
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType json setlocal shiftwidth=2 tabstop=2

    autocmd Syntax html call SyntaxRange#Include("<markdown>", "</markdown>", "markdown")
    autocmd Syntax html call SyntaxRange#Include("```python", "```", "python")
    autocmd Syntax markdown call SyntaxRange#Include("```python", "```", "python")
    autocmd Syntax perl call SyntaxRange#Include("<<SQL;", "SQL", "sql")

    autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
augroup END


hi link EasyMotionShade  Comment
hi link EasyMotionTarget Underlined
hi MBENormal               guifg=#808080 guibg=fg ctermfg=DarkBlue
hi MBEChanged              guifg=red guibg=blue ctermbg=red ctermfg=DarkBlue
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg ctermfg=yellow
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg ctermfg=white
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
hi IncSearch               term=reverse ctermfg=black ctermbg=10 gui=reverse guifg=green guibg=black
hi Search                  term=reverse ctermfg=black ctermbg=red guifg=black guibg=red
hi OverLength ctermbg=white ctermfg=white guibg=#592929
hi ColorColumn ctermbg=235 guibg=#2c2d27

match OverLength /\%80v/


" External Config
if filereadable(expand('~/.colors.vim'))
    source ~/.colors.vim
endif

if filereadable(expand('~/.local.vim'))
    source ~/.local.vim
endif
