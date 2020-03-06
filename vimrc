scriptencoding utf-8
set nomodeline

" Make python3 preeminent
if has('python3')
endif

" Load plugins
call plug#begin('~/.vim/plugged')
if $MINIMAL
    source ~/.vim/plugins-mim.vim
else
    source ~/.vim/plugins-main.vim
    colorscheme modified_slate
endif
call plug#end()

" Set colorscheme
if $MINIMAL
    colorscheme slate
else
    let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_italic=1
    let g:jedi#goto_stubs_command = 0
    colorscheme gruvbox
endif

if $VIM_NONINTERACTIVE != 1
    filetype indent plugin on
    " Syntax settings
    syntax on
    syntax match Todo /{code\w\*}/ conceal

    source ~/.vim/functions.vim
    source ~/.vim/keys.vim
    source ~/.vim/options.vim
    source ~/.vim/vars.vim
    source ~/.vim/command.vim
    source ~/.vim/aucmds.vim
    source ~/.vim/highlight.vim

    " Allow for local overrides
    if filereadable(expand('~/.local.vim'))
        source ~/.local.vim
    endif
endif
