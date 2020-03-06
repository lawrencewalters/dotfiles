set nocompatible
filetype plugin on
syntax on
set background=dark

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number

call plug#begin('~/.vim/plugged')
 Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
" Plug 'airblade/vim-gitgutter' " uninstalled because causes vim to crash on
" file open / save?
 Plug 'vim-airline/vim-airline'
 Plug 'tpope/vim-surround'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
 Plug 'junegunn/fzf.vim'
call plug#end()

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_browse_split = 4

let g:ctrlp_user_command = 'find %s -type f' " Mingw/Cygwin/Git bash

let g:vimwiki_folding = 'expr'
