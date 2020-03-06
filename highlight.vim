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
