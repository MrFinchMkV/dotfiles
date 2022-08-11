syntax on
set number
set bg=dark
colorscheme koehler
set cursorline
set wildmenu
set relativenumber
set scrolloff=3

" Split behavior
set splitbelow
set splitright

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" Master vim
set nocompatible
filetype plugin on
set path+=**
set termwinsize=15x0

" Commands
command! MakeTags !ctags -R .

" Colors
highlight TabLineSel ctermfg=White
highlight TabLineSel ctermbg=DarkGrey
highlight StatusLine ctermfg=White
highlight StatusLine ctermbg=DarkGrey
highlight StatusLineNC ctermfg=White
highlight StatusLineNC ctermbg=DarkGrey
