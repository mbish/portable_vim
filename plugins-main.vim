" Plug 'LucHermitte/lh-vim-lib'
" Plug 'LucHermitte/local_vimrc'
" Plug 'davidhalter/jedi-vim'
" Plug 'nvie/vim-flake8'
" Plug 'romainl/vim-qf'
" Plug 'scrooloose/nerdtree'
" Plug 'tartansandal/vim-compiler-pytest'
" Plug 'thaerkh/vim-workspace'
" Plug 'valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'vim-scripts/c.vim'
Plug 'LnL7/vim-nix'
Plug 'ap/vim-buftabline'
Plug 'bps/vim-textobj-python'
Plug 'direnv/direnv.vim'
Plug 'drmingdrmer/vim-toggle-quickfix'
Plug 'fatih/vim-go'
Plug 'francoiscabrol/ranger.vim'
Plug 'habamax/vim-godot'
Plug 'itchyny/lightline.vim', { 'do': 'cp ~/.vim/custom/lightline.vim/gruvbox.vim autoload/lightline/colorscheme/gruvbox.vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'machakann/vim-swap'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'sdiehl/vim-ormolu'
Plug 'sirVer/ultisnips'
Plug 'sirtaj/vim-openscad'
Plug 'tarekbecker/vim-yaml-formatter'
Plug 'tell-k/vim-autopep8'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-exchange'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/ctags.vim'
Plug 'vim-scripts/vimwiki'
Plug 'w0rp/ale'

if has('nvim')
    Plug 'MrcJkb/haskell-tools.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'mfussenegger/nvim-dap'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'phaazon/hop.nvim'
    Plug 'rbgrouleff/bclose.vim'
else
    Plug 'easymotion/vim-easymotion'
    Plug 'haya14busa/vim-easyoperator-line'
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
