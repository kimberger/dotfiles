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
Plug 'elixir-lang/vim-elixir'
Plug 'rking/ag.vim'
Plug 'tpope/vim-surround'
Plug 'evidens/vim-twig'
Plug 'tpope/vim-rails'
Plug 'rhysd/vim-crystal'

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

set relativenumber
set number                      " always show line numbers
set noswapfile                  " Git handles version controlling
set autoread                    " Auto-reload changed files

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Mappings
map <Leader>f :NERDTreeFind<CR>
map <Leader>ra :!bundle exec rspec<CR>
map <Leader>vt :vsplit\|terminal<CR>
map <Leader>ht :split\|terminal<CR>
map <Leader><Leader> :!

"" Quicker split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

colorscheme hybrid_material

syntax on
filetype on
au BufNewFile,BufRead *.ecr set filetype=html

"" Use Ag
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<CR>
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
