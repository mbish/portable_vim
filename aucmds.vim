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
