" i need to do CocInstall coc-pyright

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

set mouse=

set nu
set relativenumber
syntax on
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set termguicolors
set scrolloff=11
"this is for buftabline
set hidden

set signcolumn=yes
set colorcolumn=80
set cmdheight=4
set laststatus=2

set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set spelllang=en_us
set complete+=kspell

" code folding
set foldmethod=indent
set foldlevel=99

set exrc
set guicursor=
set nohlsearch
set hidden
set noerrorbells
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set noshowmode

" enable 256 colors
set t_Co=256
set t_ut=

" code folding
set foldmethod=indent
set foldlevel=99

set completeopt=menuone,longest
set shortmess+=c
filetype plugin indent on
filetype on


" here i install the plugs
call plug#begin('~/.vim/plugged')
"emet for html
Plug 'mattn/emmet-vim', {'for':'html'}

" auto close tags on html
Plug 'alvan/vim-closetag'

"add a buffer tab line up
Plug 'ap/vim-buftabline'

" add auto pairs M-n to go to next pair
Plug 'jiangmiao/auto-pairs'

" linter and fixers
Plug 'dense-analysis/ale'

" this is file index 
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

"highligt synstax
Plug 'sheerun/vim-polyglot'

" show git changes
Plug 'airblade/vim-gitgutter'

" this is the tagbar
Plug 'majutsushi/tagbar'

" this is the task bar
Plug 'itchyny/lightline.vim'

" this is the colorsheme
Plug 'joshdick/onedark.vim'

"this plug is for autocomplete 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" this is the colorsheme
colorscheme onedark

" this is the task bar
let g:lightline = { 'colorscheme': 'onedark' }

"this close tags on this files
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'


" this remap the coc to tab and space
function! s:check_back_space() abort
  let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
      endfunction

      inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

" for ale fixers and linters
" this need to install from root not from sudoer
let g:ale_linters = {'python':['flake8', 'pydocstyle','bandit','mypy'],'html': ['htmlhint'],'css': ['stylelint']}
let g:ale_fixers = {'python':["black", "isort"],'html': ['prettier'],'css':['stylelint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1

" this is for emet
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=","

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
    endif
endfunction

function! StartUp()
if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()
" tags
map <leader>t :TagbarToggle<CR>                                              :TagbarToggle<CR>"
autocmd FileType python setlocal indentkeys-=<:>



"remap ctrl w  to ctrl jklh
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"remap crtl n p to move in buffers
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
"

"mouse settings
"set mouse=a
"let g:is_mouse_enabled = 1
"noremap <silent> <Leader>m :call ToggleMouse()<CR>
"function ToggleMouse()
"    if g:is_mouse_enabled == 1
"        echo "Mouse OFF"
"        set mouse=
"        let g:is_mouse_enabled = 0
"    else
"        echo "Mouse ON"
"        set mouse=a
"        let g:is_mouse_enabled = 1
"    endif
"endfunction
