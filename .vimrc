if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline'

Plug 'junegunn/vim-easy-align'

Plug 'jistr/vim-nerdtree-tabs'

Plug 'kien/ctrlp.vim'

Plug 'altercation/vim-colors-solarized'

Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


call plug#end()

" Settings
set expandtab
set smarttab
set tabstop=4
set wrap
set ignorecase
set smartcase
set splitright
set encoding=utf-8
set incsearch
set nofoldenable
set noswapfile
set ai
set si
set number
set lbr
set showcmd
set scrolloff=5
set hls

" Shortcuts
let mapleader=","
:nnoremap <leader>ne :NERDTreeFocus<CR>
:nnoremap <space> za
:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-K> <C-W><C-K>
:nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>
:nnoremap <C-I> :tab YcmCompleter GoTo <CR>
:nnoremap gl :tab split \| YcmCompleter GoTo <CR>
:nnoremap gD :tab YcmCompleter GoToDeclaration <CR>
:nnoremap gd :YcmCompleter GetDoc <CR>
:nnoremap <F5> :NERDTree <CR>
:nnoremap <C-F> :Files 
:nnoremap <C-P> :Ag 

" YCM option setting
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_warning_symbol = '>*'
let g:ycm_python_binary_path = 'python'
let g:ycm_goto_buffer_command = 'split-or-existing-window'

" Airline
let g:airline#extensions#tabline#enabled = 1 "Enable list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'


" soloarized setting
let g:solarized_termcolors=256

" ctrl-p
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>  " enter file search mode

" Nerdtree
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>  " open and close file tree
nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree


" buffer management
set hidden "allow buffers to be hidden if you've modified a buffer
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

colorscheme jellybeans
set background=dark
