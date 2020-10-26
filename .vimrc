
call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim'
Plug 'Yggdroot/LeaderF'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'vim-test/vim-test'

Plug 'alvan/vim-closetag'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

call plug#end()

let g:deoplete#enable_at_startup = 1

" GUI
syntax on
hi normal                                    guibg=black
hi LineNr  ctermfg=DarkCyan   guifg=DarkGray guibg=LightGray
hi Type                       guifg=blue
hi Constant                   guifg=red
hi Comment                    guifg=DarkGray

set guifont=Monaco:h12

hi PmenuSel ctermfg=Black
set spelllang=de
set wildmenu
set clipboard=unnamed
set title

set guioptions-=T
set showmode
set showcmd
set ruler
set hidden
"set mouse=a
"set ttymouse=xterm
set wrap 
set linebreak
set number

set endofline

set novisualbell
set noerrorbells

set nocompatible

" Command Line 
cno $h ~ 

"set cursorline
set showmatch " jump to matching brace

set ignorecase
set backspace=2

"set autoindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab
 
filetype plugin on
"filetype indent on 

autocmd FileType bash,shell set tags=~/.vim/systags_binaries
autocmd FileType make       set tags=~/.vim/systags_binaries  noexpandtab shiftwidth=8
autocmd FileType python     set tags=~/.vim/systags_python    expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType txt       set syntax=rest

let g:syntastic_python_pylint_post_args="--max-line-length=120"

map <C-r> :exec("tag ".expand("<cword>"))<CR>


" Tabs 

" Show only filename as tab name
set guitablabel=%t
"set guitabtooltip=%f
"map <C-t> :tabnew<CR>
map <C-s> :w<CR>
map <F1> :tabnew<CR>
map <F2> :o .<CR>
map <F3> :tabprevious<CR>
map <F4> :tabnext<CR>

let Tlist_Ctags_Cmd='/opt/local/bin/ctags'

colorscheme lucius
"mac fix
set backupskip=/tmp/*,/private/tmp/*

let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_WindowPosition = 'popup'

map <C-R> :Leaderf file<CR>
map <C-T> :Leaderf tag<CR>

