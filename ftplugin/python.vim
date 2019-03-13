let b:ale_linters = ['flake8']
let g:autopep8_aggressive=2
let g:autopep8_disable_show_diff=1
set equalprg=autopep8\ -

xnoremap f :Autopep8<CR>:ALELint<CR>

nmap <buffer> yf [pfwvt(
nmap <buffer> yc [pcwvt(
