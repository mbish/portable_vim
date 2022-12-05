" Package Variables
let g:loaded_diminactive=1
let &colorcolumn=join(range(101,999),',')

let g:autopep8_disable_show_diff=1
let g:autopep8_aggressive=3

let g:EasyMotion_smartcase = 1

let g:NERDTreeIgnore=['\.pyc$', '\~$']

let g:ackprg = 'rg --nogroup --nocolor --column'

let g:NERDTreeQuitOnOpen=1

let g:R_in_buffer = 0
let g:R_applescript = 0

let g:ycm_collect_identifiers_from_tags_files = 1
let g:test_target = ""
let g:ycm_server_python_interpreter = "/usr/bin/python3"

let g:jedi#force_py_version=3
let g:pymode_rope = 0
let g:jedi#show_call_signatures=1

let g:UltiSnipsExpandTrigger='<c-a>'
let g:UltiSnipsJumpForwardTrigger='<c-l>'
let g:UltiSnipsJumpBackwardTrigger='<c-h>'

let g:local_vimrc = [".vimrc", ".local.vim", "_vimrc_local.vim"]

" let g:ale_python_flake8_executable = 'python3'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'yaml': ['yamllint'],
\   'sh': ['shellcheck'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'c': ['clangd', 'clangtidy', 'flawfinder', 'cppcheck'],
\}
" let b:ale_linters = ['yamllint', 'shellcheck', 'govet', 'gobuild', 'gofmt']
"
if has_key(plugs, 'ale')
    call ale#linter#Define('gdscript', {
    \   'name': 'godot',
    \   'lsp': 'socket',
    \   'address': '127.0.0.1:6008',
    \   'project_root': 'project.godot',
    \})
endif

let g:ale_fixers = {
\   'bash': ['shfmt'],
\   'sh': ['shfmt'],
\   'json': ['prettier'],
\   'ruby': ['rubocop'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'yaml': ['yamlfix'],
\   'rust': ['rustfmt'],
\}
if has('nvim')
    let g:ale_enabled=0
endif

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
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'ale', 'tagbar' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'GetTestTarget', 'GetFocusTarget', 'GetMakeTarget','fileformat', 'fileencoding', 'filetype'],
      \            ],
      \ },
      \ 'component': {
      \   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#statusline',
      \   'ale': 'LinterStatus',
      \   'GetTestTarget': 'GetTestTarget',
      \   'GetMakeTarget': 'GetMakeTarget',
      \   'GetFocusTarget': 'GetFocusTarget',
      \ },
      \ }

let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0

let g:fzf_buffers_jump = 1
let g:vim_markdown_folding_disabled = 1
let g:ycm_auto_hover = ''

let g:ranger_map_keys = 0

set updatetime=300
set shortmess+=c
set signcolumn=yes
if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif
