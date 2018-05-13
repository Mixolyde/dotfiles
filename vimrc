" File: vimrc (copy to ~/.vimrc or ~\_vimrc
" Author: Brian G.

"Basics {{{
set nocompatible      " never learned Vi, no need to stay compatible
set backspace=indent,eol,start
set nobackup  " DON'T keep a backup file
set encoding=utf-8
set history=50  " keep 50 lines of command line history
set laststatus=2
set hid      " allow switching buffers which have unsaved changes
set mouse=a  " use mouse in xterm to scroll
set nowrap   " don't wrap by default
set completeopt=menu,longest,preview
set confirm
set foldmethod=marker
"}}}

"Leader {{{
" key mappings (start with comma) 
let mapleader = ","
" v to select just pasted text for manipulation
nnoremap <leader>v V`]
" W to remove whitespace from file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" ft to fold tag (e.g. HTML)
nnoremap <leader>ft Vatzf
" q to hard rewrap paragraphs of text
nnoremap <leader>q gqip
" turns off highlights after a search
nnoremap <leader><space> :nohlsearch<cr>
"reload vimrc
nnoremap <leader>vv :source ~/.vimrc<CR>
"open vimrc in new tab
"if ~/.vimrc is a symlink, it resolves the symlink before opening so that
"fugitive is happy
nnoremap <leader>ve :execute "tab sp" resolve(expand("~/.vimrc"))<CR>
"}}}

"Sane Tab Settings {{{
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set smarttab autoindent
set cindent
"}}}

"Visual Appearance {{{
"color desert
set background=dark
syntax on        " color highlight code syntax
filetype plugin on
set number       " show line numbers
set ruler        " show the cursor position all the time
set scrolloff=5  " 5 lines before and after current line when scrolling
set showcmd      " display incomplete commands
set showmode     " always show mode
set wildmenu     " show completion menu
set wildmode=list:longest
" How to show whitespace chars
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
"}}}

"Searching Options {{{
nnoremap / /\v
vnoremap / /\v
set ignorecase  " ignore case when searching
set smartcase   " but don't ignore it when search string contains uppercase letters
set incsearch   " do incremental searching
set hlsearch    " highlight matching search terms
set showmatch   " show the matching bracket
"}}}

"Custom keys {{{
" Toggle paste mode via F2 to prevent cascading indents
set pastetoggle=<F2>
" Toggle white space chars
noremap <F11> :set list!<CR>
" set tab key to switch to next window
inoremap <tab> <ESC>:wincmd w<CR>
nnoremap <tab> :wincmd w<CR>
vnoremap <tab> :wincmd w<CR>
" open file explorer
nnoremap \ :Explore<CR>
" Don't use Ex mode, use Q for formatting
map Q gq
"use jj to escape from insert mode
inoremap jj <esc>
"Space toggles folds
nnoremap <Space> za
"}}}

"Commands {{{
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
              \ | wincmd p | diffthis
"}}}

"Plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Visuals:
Plug 'vim-airline/vim-airline'

"Essentials: simple extensions of vim functionality
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

"Programming:
Plug 'dart-lang/dart-vim-plugin'
call plug#end()
"}}}

"Dart {{{
" let dart_html_in_string=true
let dart_style_guide = 2
" let dart_format_on_save = 1
"}}}

