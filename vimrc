syntax on
set number
set bg=dark
colorscheme murphy
set cursorline
set wildmenu
set relativenumber
set scrolloff=3
set noswapfile

" Explorer
let g:netrw_liststyle=3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

" set colorcolumn=80
" highlight Colorcolumn ctermbg=3 guibg=lightgrey

" set nowrap

" Split behavior
set splitbelow
set splitright

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
set smartindent

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
