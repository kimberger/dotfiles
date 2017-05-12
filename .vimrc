set nocompatible
set backspace=indent,eol,start
syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'

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
autocmd FocusGained * silent! checktime

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set rtp+=/usr/local/opt/fzf

"" Mappings
map <silent> <C-p> :Files<CR>
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

"" ALE
filetype off
let &runtimepath.=',~/.vim/bundle/ale'
filetype plugin on

"" FZF
let g:fzf_nvim_statusline = 0
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_history_dir = './.vim/fzf-history'

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
