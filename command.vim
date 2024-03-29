command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, {'options': ['--bind=ctrl-l:jump-accept', '--preview', 'bat --color=always {}']}, <bang>0)
command! -bang -nargs=? -complete=dir BTags
\ call fzf#vim#buffer_tags(<q-args>, {'options': ['--bind=ctrl-l:jump-accept']}, <bang>0)
" command! -bang -nargs=? -complete=dir Rg
"             \ call fzf#vim#grep("rg --column --no-heading --color=always --smart-case -e ".shellescape(<q-args>),
"             \1, {'options': ['--bind=ctrl-l:jump', '--preview', '~/.vim/utils/rg-preview.sh {}']},
"                                  \ <bang>0)
command! -bang -nargs=* Rgi
  \ call fzf#vim#grep("rg --column --no-ignore-vcs --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

command! -nargs=? -bang Paste call fzf#run({'source': 'fzfclip'})
