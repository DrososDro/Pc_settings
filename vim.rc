
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=11
set noshowmode
set signcolumn=yes
set colorcolumn=80

syntax on
set cmdheight=4
set laststatus=2

" enable 256 colors
set t_Co=256
set t_ut=

" code folding
set foldmethod=indent
set foldlevel=99

"file formats
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set shortmess+=c
set spelllang=en_us
set complete+=kspell
"set completeopt=menuone,longest
autocmd FileType python setlocal completeopt-=preview
filetype plugin indent on
"let g:polyglot_disabled = ['autoindent']

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'mattn/emmet-vim', {'for':'html'}
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'vim-scripts/indentpython.vim'
Plug 'majutsushi/tagbar'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'maxmellon/vim-jsx-pretty'
"Plug 'davidhalter/jedi-vim'
Plug 'sheerun/vim-polyglot'
"Plug 'vim-scripts/AutoComplPop'
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

function! StartUp()
if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()
" tags
map <leader>t :TagbarToggle<CR>


colorscheme onedark

let g:lightline = { 'colorscheme': 'onedark' }

"remap ctrl w jklh

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" this need to install from root not from sudoer
let g:ale_linters = {'python':['flake8', 'pydocstyle', 'bandit','mypy'],'html': ['htmlhint'],'css': ['stylelint']}
let g:ale_fixers = {'python':["black", "isort"],'html': ['prettier'],'css': ['stylelint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=","
source ~/AppData/Local/nvim/coc-settings.json
function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
