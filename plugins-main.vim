source ~/.vim/plugins-mim.vim
Plug 'ap/vim-buftabline'
Plug 'bps/vim-textobj-python'
" Plug 'davidhalter/jedi-vim'
Plug 'drmingdrmer/vim-toggle-quickfix'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'itchyny/lightline.vim', { 'do': 'cp ~/.vim/custom/lightline.vim/gruvbox.vim autoload/lightline/colorscheme/gruvbox.vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
" Plug 'nvie/vim-flake8'
" Plug 'romainl/vim-qf'
" Plug 'scrooloose/nerdtree'
Plug 'sirVer/ultisnips'
Plug 'tell-k/vim-autopep8'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
" Plug 'valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/vimwiki'
Plug 'vim-scripts/ctags.vim'
Plug 'w0rp/ale'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'tarekbecker/vim-yaml-formatter'
Plug 'sirtaj/vim-openscad'
Plug 'francoiscabrol/ranger.vim'
" Plug 'tartansandal/vim-compiler-pytest'
" Plug 'vim-scripts/c.vim'
Plug 'tpope/vim-projectionist'
" Plug 'thaerkh/vim-workspace'
Plug 'LnL7/vim-nix'
Plug 'rust-lang/rust.vim'
" Plug 'LucHermitte/lh-vim-lib'
" Plug 'LucHermitte/local_vimrc'
Plug 'direnv/direnv.vim'
Plug 'habamax/vim-godot'

if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
else
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
