
set mouse=a
set nocompatible
filetype on
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-surround'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'scrooloose/syntastic'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'jiangmiao/auto-pairs'
call vundle#end()

" set colorcolumn=80

set number
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set hidden
set history=100
set hlsearch
set showmatch

map <leader>r :source ~/.vimrc<CR>
map <leader>q :q<CR>
map <leader>w :w!<CR>
map <leader>x :!./%<CR>

autocmd BufWritePre * :%s/\s\+$//e

let g:neocomplete#enable_at_startup = 1

map <leader>t :NERDTreeTabsToggle<CR>
map <Tab> :NERDTreeFocusToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 2
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' }, 'vimrc': {'left': ':"'}, 'haskell': { 'left': '-- ' } }

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

let g:powerline_pycmd = "py3"

map <leader>m :!make<CR>

