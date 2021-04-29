"-------------------------------------------------------------------------------
" GLOBAL
"-------------------------------------------------------------------------------

syntax on
filetype plugin indent on
set termguicolors
set shortmess+=c
set clipboard+=unnamedplus
set nobackup 
set nowritebackup
set noswapfile
set undofile
set undodir=~/.cache/nvim/undo

"-------------------------------------------------------------------------------
" WINDOW
"-------------------------------------------------------------------------------

set nowrap
set number
set relativenumber
set scrolloff=32
set ruler
set laststatus=2
set showcmd
set showmode
 
"-------------------------------------------------------------------------------
" BUFFER
"-------------------------------------------------------------------------------

set hidden
set expandtab
set shiftwidth=4
set smarttab
set autoindent
set hlsearch
set ignorecase
set smartcase

"-------------------------------------------------------------------------------
" KEYMAP
"-------------------------------------------------------------------------------

let mapleader=" "

" <Leader>;s replace word under cursor using . to repeat process with next
nnoremap <Leader>; *``cgn
nnoremap <Leader>, #``cgN
nnoremap <Leader>gs :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <Leader>g% :%s/\<<C-r>=expand("<cword>")<CR>\>/

noremap L $
noremap H 0
noremap Y g_

" Register each insert command into the undo tree
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
