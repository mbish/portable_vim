function PipeSelection(command) range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'|'. a:command)
endfunction
com -range=% -nargs=1 PipeSelection :<line1>,<line2>call PipeSelection(<args>)

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

function! GetMakeTarget() abort
    return dispatch#make_focus(v:count > 1 ? 0 : v:count ? line(".") : -1)
endfunction

function! GetFocusTarget() abort
    let haslnum = a:0 && a:1 >= 0
    if exists('b:Dispatch') && !haslnum
      let [what, why] = [b:Dispatch, 'Buffer local focus']
    elseif exists('w:Dispatch') && !haslnum
      let [what, why] = [w:Dispatch, 'Window local focus']
    elseif exists('t:Dispatch') && !haslnum
      let [what, why] = [t:Dispatch, 'Tab local focus']
    elseif exists('g:Dispatch') && !haslnum
      let [what, why] = [g:Dispatch, 'Global focus']
    elseif exists('b:dispatch')
      let [what, why] = [b:dispatch, 'Buffer default']
    else
      let [what, why] = ['--', (len(&l:makeprg) ? 'Buffer' : 'Global') . ' default']
      let default = 1
    endif
    return what
endfunction

" call add(g:swap#default_keymappings, {'input': "\<C-k>", 'output': "\<Plug>(swap-mode-Esc)"})

" Functions
" function AutoTest()
"     if exists(&g:test_focus)

function! GetCommand(command)
    redir @*
    silent exe a:command
    redir END
endfunction
