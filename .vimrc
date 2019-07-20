
set encoding=UTF-8

set mouse=a
set nocompatible
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-surround'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'scrooloose/syntastic'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'junegunn/fzf.vim'
  Plugin 'junegunn/fzf'

  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'           " required for deoplete
  Plugin 'roxma/vim-hug-neovim-rpc'  " required for deoplete

  " typescript plugins
"   Plugin 'leafgarland/typescript-vim'
  " Plugin 'Quramy/tsuquyomi'
  " Plugin 'Shougo/vimproc.vim', {
    " \ 'build' : {
    " \     'windows' : 'tools\\update-dll-mingw',
    " \     'cygwin' : 'make -f make_cygwin.mak',
    " \     'mac' : 'make -f make_mac.mak',
    " \     'linux' : 'make',
    " \     'unix' : 'gmake',
    " \    },
    " \ }

  Plugin 'AnsiEsc.vim'
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  " Plugin 'sjl/badwolf'
  " Plugin 'tomasr/molokai'
  " Plugin 'morhetz/gruvbox'
  " Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
  " Plugin 'junegunn/limelight.vim'
  " Plugin 'mkarmona/colorsbox'
  " Plugin 'romainl/Apprentice'
  " Plugin 'Lokaltog/vim-distinguished'
  " Plugin 'chriskempson/base16-vim'
  " Plugin 'w0ng/vim-hybrid'
  " Plugin 'AlessandroYorba/Sierra'
  " Plugin 'daylerees/colour-schemes'
  " Plugin 'effkay/argonaut.vim'
  " Plugin 'ajh17/Spacegray.vim'
  " Plugin 'atelierbram/Base2Tone-vim'
  " Plugin 'colepeters/spacemacs-theme.vim'
  " Plugin 'dylanaraps/wal.vim'
  Plugin 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

  Plugin 'ashisha/image.vim'
call vundle#end()

" vim configs
set number
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hidden
set history=100
set hlsearch
set showmatch
set cursorline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:powerline_pycmd = "py3"

colorscheme challenger_deep

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='murmur'


"" nerd config
" tree tabs
let g:nerdtree_tabs_open_on_console_startup = 2

" commenter
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' }, 'vimrc': {'left': ':"'}, 'haskell': { 'left': '-- ' } }


"" syntax highlighting
" typescript
" au BufRead,BufNewFile *.ts   set ft=typescript syntax=typescript


" deoplete config
let g:deoplete#enable_at_startup = 1


"" key bindings
" vim
map <leader>r :source ~/.vimrc<CR>
map <leader>q :q<CR>
map <leader>Q :q!<CR>
map <leader>w :w!<CR>
map <leader>ww :wa!<CR>
map <leader>W :wa!<CR>

" misc
map <leader>x :!./%<CR>
map <leader>X :!chmod +x %<CR>
map <leader>m :!make run<CR>

" file management
map <leader>fn :!echo -n "Filename: "; read fn; touch $fn<CR>
map <leader>dn :!echo -n "Dirname: "; read dn; mkdir -p $dn<CR>
map <leader>fd :!echo -n "Filename: "; read fn; rm $fn<CR>
map <leader>dd :!echo -n "Dirname: "; read dn; rm -rf $dn<CR>

" git
map <leader>ga :!git add .<CR>
map <leader>gs :!git status<CR>
map <leader>gco :!echo -n "Commit Message: "; read msg; git commit -m $msg<CR>
map <leader>gbl :!git branch --list<CR>
map <leader>gbn :!echo -n "New Branch: "; read branch; git branch $branch<CR>
map <leader>gch :!echo -n "Branch: "; read branch; git checkout $branch<CR>

" tsuquyomi
map <leader>ti :TsuImport<CR>
map <leader>tf :TsuQuickFix<CR>
map <leader>tr :TsuReloadProject<CR>
map <leader>td :TsuDefinition<CR>

" NERDTreeTabs
map <leader>t :NERDTreeTabsToggle<CR>
map <Tab> :NERDTreeFocusToggle<CR>

