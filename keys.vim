" Editor key bindings
imap <C-d> <Esc>:w<CR>
imap <C-k> <Esc>l
imap ð <Esc>:wq<CR>|    "\-d"
map ¥ <Plug>(IndentWisePreviousLesserIndent)|   "\--
map « <Plug>(IndentWisePreviousEqualIndent)|    "\-[
map » <Plug>(IndentWiseNextEqualIndent)|    "\-]
map × <Plug>(IndentWiseNextGreaterIndent)|  "\-=
nmap + :tabprevious<CR>
nmap - :bp<cr>
nmap ; a
nmap <C-I> bi
nmap <C-W>e <C-W>=-=
nmap <C-d> <Esc>:w<CR>
nmap <M-/> :noh<CR>
nmap <M-e> $
nmap <silent> Þ :let g:test_target = "" \| autocmd! BufWrite *.py<CR>|  " \-T
nmap <silent> þ :call RunTests()<CR>
nmap = :bn<CR>
nmap _ :tabnext<CR>
nmap ds bdw
nmap µ %|   "\-m
nmap ð :wq<CR>| "\-d"
omap <C-k> <Esc>l
vmap / "zy:Rg "<C-r>z"<CR>
vmap s :sort<CR>
xmap <C-k> <Esc>l

"" Package specific key bindings
imap <F2> <Esc>:NERDTreeToggle<CR>
map <c-a> <Plug>(easymotion-overwin-w)
map <c-l> <Plug>(easymotion-bd-w)
nmap <F2> :NERDTreeToggle<CR>
nmap <c-n> <Plug>(qf_qf_toggle)
nmap <c-p> :Rg 
nmap c/ :nohlsearch<CR>
nmap dm <Plug>(easyoperator-line-delete)
nmap s <Plug>(easymotion-bd-w)
nmap ym <Plug>(easyoperator-line-yank)
xnoremap P "zy :Rg <C-r>z<CR>
xnoremap f :'<,'>Autopep8<CR>:ALELint<CR>

"" Leader bindings
if has('win32')
  nmap <leader>cf :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
else
  nmap <leader>cf :let @*=expand("%:p")<CR>
endif
" map <leader>j <Plug>(easymotion-overwin-f2)
" nmap g/ :call setqflist([]) \| bufdo! vimgrepadd! //j %<Left><Left><Left><Left>
" possibly add motion based search
imap <F4> <esc>:TagbarToggle<CR>
map <F4> :TagbarToggle<CR>
map <leader>/ <Plug>(easymotion-sn)
map <leader>J <Plug>(easymotion-overwin-line)
map <leader>T :Dispatch vagrant ssh -c "make; make test"<CR>
map <leader>V :Dispatch! lighton --pulse --duration 2000 -- remote-test install<CR>
map <leader>ef :e %:h/
map <leader>ep :call GetCommand(":")<left><left>
map <leader>jb :Lines import pdb; pdb.set_trace()<CR>
map <leader>jt :BTags<CR>
map <leader>l :Lines<CR>
map <leader>pf :ALEFix<CR>
map <leader>pi :Dispatch! remote-sync; lighton --pulse --duration 2000 --index 2 -- remote-build inc <CR>
map <leader>pm :Dispatch! remote-sync; lighton --pulse --duration 2000 --index 2 -- remote-build full <CR>
map <leader>pt :Dispatch! remote-sync; lighton --pulse --duration 2000 --index 2 -- remote-build itest <CR>
map <leader>pv :Dispatch! lighton --pulse --duration 2000 -- remote-sync <CR>
nmap <leader>cc :ALELint<CR>
nmap <leader>f :Files<CR>
nmap <leader>g "zyiw:execute 'silent! tag '.@z \| :silent! YcmCompleter GoTo<CR>
nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>m :Dispatch<CR>
nmap <leader>q :bd<CR>
nmap <leader>r :YcmCompleter GoToReferences<CR>
nmap <leader>x :q!<CR>
nmap <silent> <leader>aj :ALENextWrap<cr>
nmap <silent> <leader>ak :ALEPreviousWrap<cr>
nmap <silent> <leader>t :call <SID>StripTrailingWhitespace()<CR>
nmap <space> <leader>
nmap gD :Copen<CR>
nmap gn :NERDTreeRefreshRoot<CR>:NERDTreeFind<CR>
nmap gt :TagbarOpen 'fjc'<CR>
nmap gu :call jedi#usages()<CR>
nmap gx :syntax on<CR>
nnoremap <leader>k "zyiw :Rg <C-r>z<CR>
nnoremap <leader>s :Buffers<CR>

"" esoteric keybindings
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nnoremap <F7> :mks! /tmp/session.vim \| :wqa \| exit<CR>
nmap <F8> :let root = getcwd()<CR>:exec system("cat /tmp/session.vim \| grep  -P 'badd\|cd'") \| exec 'cd ' . root<CR>
