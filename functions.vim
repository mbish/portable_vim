"" could be generalized to include other file types
function! RunTests() abort
    let g:test_target = expand("%")
    let g:dispatch = 'remote-test specific '.g:test_target
    autocmd BufWrite *.py Dispatch
endfunction

function! IsQuickFixOpen() abort
    filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"') != []
endfunction

function! GetTestTarget() abort
    return g:test_target
endfunction

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
