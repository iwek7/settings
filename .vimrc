:colorscheme pablo

" copying stuff to clipboard
set clipboard=unnamedplus
set mouse=a

" line highlighting
:set cursorline
:hi CursorLine ctermbg=236 cterm=NONE

" display line numbers
set number
:hi LineNr ctermfg=245

" display spaces
:set list
:set listchars=space:·
:hi SpecialKey ctermfg=240 guifg=gray

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" this one makes matching paranhesis highlight better on weirdly colored
" paranthesis
:hi! MatchParen cterm=NONE,bold gui=NONE,bold  guibg=#eee8d5 guifg=NONE

:hi Cursor cterm=reverse gui=reverse

" plugin manager 
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/kien/rainbow_parentheses.vim'

call plug#end()

" rainbow parentheses config
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
