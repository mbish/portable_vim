scriptencoding utf-8
set nomodeline
if has('python3')
endif

if $MINIMAL
    colorscheme slate
    call plug#begin('~/.vim/plugged')
        Plug 'easymotion/vim-easymotion'
        Plug 'tpope/vim-surround'
        Plug 'tommcdo/vim-exchange'
        Plug 'machakann/vim-swap'
    call plug#end()
else
    let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_italic=1
    let g:jedi#goto_stubs_command = 0
    call plug#begin('~/.vim/plugged')
        Plug 'ap/vim-buftabline'
        Plug 'bps/vim-textobj-python'
        Plug 'davidhalter/jedi-vim'
        Plug 'drmingdrmer/vim-toggle-quickfix'
        Plug 'easymotion/vim-easymotion'
        Plug 'haya14busa/vim-easyoperator-line'
        Plug 'itchyny/lightline.vim', { 'do': 'cp ~/.vim/custom/lightline.vim/gruvbox.vim autoload/lightline/colorscheme/gruvbox.vim' }
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        Plug 'kana/vim-textobj-indent'
        Plug 'kana/vim-textobj-user'
        Plug 'machakann/vim-swap'
        Plug 'majutsushi/tagbar'
        Plug 'morhetz/gruvbox'
        " Plug 'nvie/vim-flake8'
        Plug 'romainl/vim-qf'
        Plug 'scrooloose/nerdtree'
        Plug 'sirVer/ultisnips'
        Plug 'tell-k/vim-autopep8'
        Plug 'tmux-plugins/vim-tmux-focus-events'
        Plug 'tommcdo/vim-exchange'
        Plug 'tomtom/tcomment_vim'
        Plug 'tpope/vim-dispatch'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'
        Plug 'valloric/YouCompleteMe', { 'do': './install.py' }
        Plug 'vim-scripts/SyntaxRange'
        Plug 'vim-scripts/vimwiki'
        Plug 'vim-scripts/ctags.vim'
        Plug 'w0rp/ale'
    call plug#end()
    colorscheme modified_slate
    colorscheme gruvbox
endif

if $VIM_NONINTERACTIVE != 1
    filetype indent plugin on
    " Syntax settings
    syntax on
    syntax match Todo /{code\w\*}/ conceal

    " Key bindings
    vmap s :sort<CR>
    vmap / "zy:Rg "<C-r>z"<CR>
    imap <C-k> <Esc>l
    omap <C-k> <Esc>l
    xmap <C-k> <Esc>l
    imap <C-d> <Esc>:w<CR>
    nmap ; a
    nmap - :bp<cr>
    nmap = :bn<CR>
    nmap _ :tabnext<CR>
    nmap + :tabprevious<CR>
    nmap <M-e> $
    nmap ds bdw
    nmap <C-W>e <C-W>=-=
    nmap <C-I> bi
    nmap <C-d> <Esc>:w<CR>
    " nmap ö :r!xclip -o<CR>
    "\-d"
    imap ð <Esc>:wq<CR>
    "\-d"
    nmap ð :wq<CR>
    "\-]
    map » <Plug>(IndentWiseNextEqualIndent)
    "\-[
    map « <Plug>(IndentWisePreviousEqualIndent)
    "\-=
    map × <Plug>(IndentWiseNextGreaterIndent)
    "\--
    map ¥ <Plug>(IndentWisePreviousLesserIndent)
    "\-m
    nmap µ %
    nmap <M-/> :noh<CR>

    "" could be generalized to include other file types
    function! RunTests() abort
        let g:test_target = expand("%")
        let g:dispatch = 'remote-test specific '.g:test_target
        autocmd BufWrite *.py Dispatch
    endfunction
    " \-t
    nmap <silent> þ :call RunTests()<CR>
    " \-T
    nmap <silent> Þ :let g:test_target = "" \| autocmd! BufWrite *.py<CR>

    function! IsQuickFixOpen() abort
        filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"') != []
    endfunction


    "" package specific key bindings
    nmap <c-n> <Plug>(qf_qf_toggle)
    nmap <F2> :NERDTreeToggle<CR>
    imap <F2> <Esc>:NERDTreeToggle<CR>
    map <c-l> <Plug>(easymotion-bd-w)
    map <c-a> <Plug>(easymotion-overwin-w)
    nmap s <Plug>(easymotion-bd-w)
    nmap ym <Plug>(easyoperator-line-yank)
    nmap dm <Plug>(easyoperator-line-delete)
    nmap <c-p> :Rg 
    xnoremap P "zy :Rg <C-r>z<CR>
    xnoremap f :'<,'>Autopep8<CR>:ALELint<CR>
    nmap c/ :nohlsearch<CR>

    "" leader bindings
    nnoremap <leader>s :Buffers<CR>
    nmap <space> <leader>
    nmap <leader>q :bd<CR>
    map <leader>l :Lines<CR>
    map <leader>jb :Lines import pdb; pdb.set_trace()<CR>
    nmap <silent> <leader>t :call <SID>StripTrailingWhitespace()<CR>
    nmap <leader>g :YcmCompleter GoTo<CR>
    nnoremap <leader>k "zyiw :Rg <C-r>z<CR>
    nmap <leader>r :YcmCompleter GoToReferences<CR>
    nmap <leader>f :Files<CR>
    nmap <silent> <leader>aj :ALENextWrap<cr>
    nmap <silent> <leader>ak :ALEPreviousWrap<cr>
    nmap <leader>g "zyiw:execute 'silent! tag '.@z \| :silent! YcmCompleter GoTo<CR>
    if has('win32')
      nmap <leader>cf :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
    else
      nmap <leader>cf :let @*=expand("%:p")<CR>
    endif
    nmap <leader>cc :ALELint<CR>
    nmap <leader>x :q!<CR>
    nmap <leader>m :Dispatch<CR>
    map <leader>/ <Plug>(easymotion-sn)
    " map <leader>j <Plug>(easymotion-overwin-f2)
    map <leader>jt :BTags<CR>
    map <leader>J <Plug>(easymotion-overwin-line)
    map <leader>pv :Dispatch! lighton --pulse --duration 2000 -- remote-sync <CR>
    map <leader>pi :Dispatch! remote-sync; lighton --pulse --duration 2000 --index 2 -- remote-build inc <CR>
    map <leader>pm :Dispatch! remote-sync; lighton --pulse --duration 2000 --index 2 -- remote-build full <CR>
    map <leader>pt :Dispatch! remote-sync; lighton --pulse --duration 2000 --index 2 -- remote-build itest <CR>
    map <leader>pf :ALEFix<CR>
    map <leader>ep :call GetCommand(":")<left><left>
    map <leader>ef :e %:h/
    map <leader>V :Dispatch! lighton --pulse --duration 2000 -- remote-test install<CR>
    map <leader>T :Dispatch vagrant ssh -c "make; make test"<CR>
    map <F4> :TagbarToggle<CR>
    imap <F4> <esc>:TagbarToggle<CR>
    nmap gn :NERDTreeRefreshRoot<CR>:NERDTreeFind<CR>
    nmap gt :TagbarOpen 'fjc'<CR>
    nmap gD :Copen<CR>
    nmap gu :call jedi#usages()<CR>
    " nmap g/ :call setqflist([]) \| bufdo! vimgrepadd! //j %<Left><Left><Left><Left>
    nmap gx :syntax on<CR>
    " possibly add motion based search

    "" esoteric keybindings
    map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
    nnoremap <F7> :mks! /tmp/session.vim \| :wqa \| exit<CR>
    nmap <F8> :let root = getcwd()<CR>:exec system("cat /tmp/session.vim \| grep  -P 'badd\|cd'") \| exec 'cd ' . root<CR>


    " Options
    set tags^=./.git/tags;
    set fillchars+=vert:│
    set hlsearch
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
    set laststatus=2
    set termguicolors

    " Package Variables
    let g:loaded_diminactive=1
    let &colorcolumn=join(range(101,999),',')

    let g:autopep8_disable_show_diff=1
    let g:autopep8_aggressive=3

    let g:UltiSnipsExpandTrigger='<c-a>'
    let g:UltiSnipsJumpForwardTrigger='<c-j>'
    let g:UltiSnipsJumpBackwardTrigger='<c-k>'

    let g:EasyMotion_smartcase = 1

    let g:NERDTreeIgnore=['\.pyc$', '\~$']

    let g:ackprg = 'rg --nogroup --nocolor --column'

    "let g:ale_python_flake8_executable = 'python3'
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 0
    let g:ale_linters = {
    \   'yaml': ['yamllint'],
    \}
    let b:ale_linters = ['yamllint']

    let g:NERDTreeQuitOnOpen=1

    let g:R_in_buffer = 0
    let g:R_applescript = 0

    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:test_target = ""
    let g:ycm_server_python_interpreter = "/usr/bin/python3"

    let g:jedi#force_py_version=3
    let g:pymode_rope = 0
    let g:jedi#show_call_signatures=1

    command! -bang -nargs=? -complete=dir Files
                \ call fzf#vim#files(<q-args>, {'options': ['--bind=ctrl-l:jump-accept', '--preview', 'bat --color=always {}']}, <bang>0)
    command! -bang -nargs=? -complete=dir BTags
    \ call fzf#vim#buffer_tags(<q-args>, {'options': ['--bind=ctrl-l:jump-accept']}, <bang>0)
    command! -bang -nargs=? -complete=dir Rg
                \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>),
                \1, {'options': ['--bind=ctrl-l:jump', '--preview', '~/.vim/utils/rg-preview.sh {}']},
                                     \ <bang>0)

    let g:fzf_buffers_jump = 1

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

    function! GetTestTarget() abort
        return g:test_target
    endfunction

    let g:lightline = {
          \ 'colorscheme': 'gruvbox',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'readonly', 'filename', 'modified', 'ale', 'tagbar' ] ],
          \   'right': [ [ 'lineinfo' ],
          \              [ 'percent' ],
          \              [ 'GetTestTarget', 'fileformat', 'fileencoding', 'filetype'],
          \            ],
          \ },
          \ 'component': {
          \   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
          \ },
          \ 'component_function': {
          \   'gitbranch': 'fugitive#statusline',
          \   'ale': 'LinterStatus',
          \   'GetTestTarget': 'GetTestTarget',
          \ },
          \ }

    let g:qf_auto_open_quickfix = 0
    let g:qf_auto_open_loclist = 0

    let g:ale_fixers = {
    \   'bash': ['shellharden --transform'],
    \   'sh': ['shellharden',' --transform'],
    \   'go': ['gofmt'],
    \   'json': ['prettier'],
    \}
    " Autocmds
    augroup vimrc
        autocmd!
        autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
        autocmd FileType json setlocal shiftwidth=2 tabstop=2
        autocmd FileType java set tags=../.tags,/usr/lib/jvm/java-8-openjdk/.tags
        autocmd FileType haskell let b:dispatch="ghci %"
        autocmd FileType haskell map <buffer> <leader>h :Dispatch! xmonad --recompile<CR>

        autocmd Syntax html call SyntaxRange#Include("<markdown>", "</markdown>", "markdown")
        autocmd Syntax html call SyntaxRange#Include("```python", "```", "python")
        autocmd Syntax markdown call SyntaxRange#Include("```python", "```", "python")
        autocmd Syntax perl call SyntaxRange#Include("<<SQL;", "SQL", "sql")
        autocmd FileType python nnoremap <buffer> <leader>pR :Focus 
        autocmd FileType python nnoremap <buffer> <leader>pr :Dispatch<CR>
        autocmd FileType python nmap <buffer> yf [pfwvt(
        autocmd FileType python nmap <buffer> yc [pcwvt(
        autocmd FileType python nmap <buffer> yc [pcwvt(
        autocmd FileType python nmap <leader>jd :Rg ^\\s*def 
        autocmd FileType python nmap <buffer> <leader>jD "zyiw:Rg ^\\s*def <C-r>z<CR>
        autocmd FileType python nmap <leader>jc :Rg ^\\s*class 
        autocmd FileType python nmap <buffer> <leader>jC "zyiw:Rg ^\\s*class <C-r>z<CR>
        autocmd FileType python map <buffer> <F5> :call Autopep8()<CR>
        autocmd FileType python nnoremap <buffer> gm "zyiW :Pyimport <C-r>z<CR>
        autocmd FileType go nnoremap <leader>pb :Dispatch go build %<CR>
        au BufRead,BufNewFile *.wiki setlocal textwidth=80
        "autocmd BufWriteCmd *.go ALEFix

        autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

        autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
        autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
        autocmd FileType python set equalprg=autopep8\ -

        au FocusGained,BufEnter * :checktime
    augroup END
    augroup qf
        autocmd!
        autocmd FileType qf set nobuflisted
    augroup END



    "hi IncSearch               term=reverse ctermfg=black ctermbg=10 gui=reverse guifg=green guibg=black
    "hi Search                  term=reverse ctermfg=black ctermbg=red guifg=black guibg=red
    hi OverLength ctermbg=white ctermfg=white guibg=#592929
    "hi ColorColumn ctermbg=235 guibg=#2c2d27
    hi EOLWS ctermbg=red guibg=red
    "hi ErrorMsg ctermfg=black ctermbg=red
    hi clear BufTabLineCurrent
    hi clear BufTabLineActive
    hi clear ColorColumn
    hi link BufTabLineCurrent GruvboxYellowSign 
    hi BufTabLineHidden guibg=#282828 ctermfg=214 ctermbg=237 guifg=#a89984
    hi BufTabLineActive guibg=#3c3836 ctermfg=214 ctermbg=237 guifg=#fabd2f
    hi BufTabLineCurrent guibg=#504945 ctermfg=214 ctermbg=237 guifg=#fabd2f gui=bold cterm=bold
    hi BufTabLineFill guibg=#282828 ctermfg=214 ctermbg=237 guifg=#a89984
    hi link BufTabLineActive GruvboxYellow
    hi link jediFat CtrlPMode2
    hi ColorColumn guibg=#282828

    match OverLength /\%100v/

    " call add(g:swap#default_keymappings, {'input': "\<C-k>", 'output': "\<Plug>(swap-mode-Esc)"})

    " Functions
    " function AutoTest()
    "     if exists(&g:test_focus)

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

    function! GetCommand(command)
        redir @*
        silent exe a:command
        redir END
    endfunction

    " External Config
    if filereadable(expand('~/.vim/colors.vim'))
        source ~/.vim/colors.vim
    endif

    if filereadable(expand('~/.local.vim'))
        source ~/.local.vim
    endif
endif
