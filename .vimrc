set nocompatible
set backspace=indent,eol,start
syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'tpope/vim-dispatch'
Plug 'elixir-lang/vim-elixir'
Plug 'terryma/vim-expand-region'

call plug#end()

let mapleader = ","

"" Whitespace
set nowrap                      " don't wrap lines
set softtabstop=2 shiftwidth=2  " a tab is two spaces
set expandtab                   " use spaces
set cursorline                  " highlight current line
set colorcolumn=80              " highlight end of line 
set scrolloff=8                 " keep 8 lines around cursor 
set sidescroll=1
set sidescrolloff=15
set list listchars=tab:»·,trail:·

set hlsearch
set number                      " always show line numbers
set noswapfile                  " Git handles version controlling
set autoread                    " Auto-reload changed files

"" Mappings
map <Leader>f :NERDTreeFind<CR>
map <Leader>ra :Dispatch bundle exec rspec<CR>
map = <Plug>(expand_region_expand)
map - <Plug>(expand_region_shrink)

"" Quicker split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

colorscheme hybrid_material
