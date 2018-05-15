scriptencoding utf-8

if $MINIMAL
    colorscheme elflord
    execute pathogen#interpose('bundle/vim-easymotion')
    execute pathogen#interpose('bundle/vim-surround')
    execute pathogen#interpose('bundle/vim-exchange')
else
    call pathogen#infect()
    colorscheme slate
endif

filetype plugin indent on
" Syntax settings
syntax on
syntax match Todo /{code\w\*}/ conceal

" Key bindings
imap <C-k> <Esc>
imap <C-d> <Esc>:w<CR>
nmap ; a
nmap - :bp<CR>
nmap = :bn<CR>
nmap _ :tabnext<CR>
nmap + :tabprevious<CR>
nmap <M-e> $
nmap ds bdw
nmap <C-W>e <C-W>=-=
nmap <C-I> bi
nmap <C-d> <Esc>:w<CR>
" nmap ö :r!xclip -o<CR>
imap ð <Esc>:wq<CR>
nmap ð :wq<CR>
nmap » cxiww.
nmap « cxiwb.
nmap ” cxiWw.
nmap “ cxiWb.
nmap µ %


"" package specific key bindings
nmap <c-n> :MBEFocus<CR>
nmap <F2> :NERDTreeToggle<CR>
imap <c-l> <Esc><Plug>(easymotion-bd-w)
map <c-l> <Plug>(easymotion-bd-w)
map <c-j> <Plug>(easymotion-bd-s)
nmap <c-p> :Ack
vmap P "zy :Ack <C-r>z<CR>

"" leader bindings
nmap <space> <leader>
nmap <leader>q :bd<CR>
nmap <silent> <Leader>t :call <SID>StripTrailingWhitespace()<CR>
nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>r :YcmCompleter GoToReferences<CR>
nmap <leader>f :CtrlP<CR>
nmap <leader>s :CtrlPBuffer<CR>
nmap <silent> <leader>aj :ALENextWrap<cr>
nmap <silent> <leader>ak :ALEPreviousWrap<cr>
nmap <leader>g "zyiw:execute 'silent! tag '.@z \| :silent! YcmCompleter GoTo<CR>
nmap <leader>c :ALELint<CR>
nmap <leader>x :q!<CR>
nmap <leader>m :Dispatch<CR>
" possibly add motion based search

"" esoteric keybindings
nmap <F7> :mks! /tmp/session.vim <CR>:wqa<CR>
nmap <F8> :let root = getcwd()<CR>:exec system("cat /tmp/session.vim \| grep  -P 'badd\|cd'") \| exec 'cd ' . root<CR>


" Options
set autoread
set noswapfile
set clipboard=unnamed
set noshowmode
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
set conceallevel=2
set updatetime=500
set mouse-=a

" Package Variables
let g:loaded_diminactive=1
let &colorcolumn=join(range(81,999),',')

let g:UltiSnipsExpandTrigger='<c-a>'
let g:UltiSnipsJumpForwardTrigger='<c-h>'
let g:UltiSnipsJumpBackwardTrigger='<c-g>'

let g:EasyMotion_smartcase = 1

let NERDTreeIgnore=['\.pyc$', '\~$'] 

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:miniBufExplCheckDupeBufs = 0

let g:NERDTreeQuitOnOpen=1

let g:R_in_buffer = 0
let g:R_applescript = 0

let g:ycm_collect_identifiers_from_tags_files = 1

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   l:all_non_errors,
    \   l:all_errors
    \)
endfunction

let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'ale', 'pyhelper' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#statusline',
      \   'ale': 'LinterStatus',
      \   'pyhelper': 'TagInStatusLine',
      \ },
      \ }

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|__pycache__)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_map = 'NONE'
let g:ctrlp_mruf_include = '*.REMEMBER*'
let g:ctrlp_mruf_max = 0
let g:ctrlp_mruf_save_on_update = 1
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

    autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
    autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
    autocmd FileType python let b:dispatch = 'python -m nose %'
    au FocusGained,BufEnter * :checktime
augroup END
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END



hi IncSearch               term=reverse ctermfg=black ctermbg=10 gui=reverse guifg=green guibg=black
hi Search                  term=reverse ctermfg=black ctermbg=red guifg=black guibg=red
hi OverLength ctermbg=white ctermfg=white guibg=#592929
hi ColorColumn ctermbg=235 guibg=#2c2d27
hi EOLWS ctermbg=red guibg=red
hi ErrorMsg ctermfg=black ctermbg=red

match OverLength /\%80v/

" Functions
function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let l:_s=@/
    let l:l = line('.')
    let l:c = col('.')
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=l:_s
    call cursor(l:l, l:c)
endfunction

" External Config
if filereadable(expand('~/.colors.vim'))
    source ~/.colors.vim
endif

if filereadable(expand('~/.local.vim'))
    source ~/.local.vim
endif

