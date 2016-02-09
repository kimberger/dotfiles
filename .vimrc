set nocompatible
set backspace=indent,eol,start
syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'wellsjo/wellsokai.vim'    " colorscheme

call plug#end()

:let mapleader = ","

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces
set cursorline                  " highlight current line
set colorcolumn=80              " highlight end of line 
set scrolloff=8                 " keep 8 lines around cursor 
set sidescroll=1
set sidescrolloff=15
set list listchars=tab:»·,trail:·

set number                      " always show line numbers
set noswapfile                  " Git handles version controlling
set autoread                    " Auto-reload changed files

"" Mappings
:map <Leader>f :NERDTreeFind<CR>

colorscheme wellsokai
