set bs=2

set wildmenu

set number

set clipboard=unnamed

set ignorecase

"execute pathogen#infect()

call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'



call plug#end()

syntax on

colorschem lucius
LuciusBlack

highlight LineNr ctermfg=4 ctermbg=NONE

filetype indent on

autocmd filetype python set ts=4 sw=4 sts=4 et

" LDIF
let g:tagbar_type_ldif = {
    \ 'ctagstype' : 'ldif',
    \ 'kinds'     : [
        \ 's:syntax',
        \ 'c:objectClasses',
        \ 'a:attributes',
        \ 'v:userAdaptation',
        \ 'u:userName',
        \ 'g:groupName',
        \ 'q:qosProfile',
        \ 't:triggerViewExtension',
    \ ]
    \ }

autocmd filetype ldif syntax region Title start="dn:"hs=s+3 end=","he=e-1
autocmd filetype ldif Tagbar

function LdifFoldLevel(line) 
	if a:line=~'dn:'
		return '>1'
	elseif a:line =~ '^##' || a:line =~ '^\s*$'
		return '0'
	endif
	return 1
endfunction


autocmd filetype ldif set foldmethod=expr foldexpr=LdifFoldLevel(getline(v:lnum)) foldlevel=2
autocmd filetype ldif set iskeyword+=\=,.,-,_,\, tags=~/Teamshare/10_Modules/tags 

" Log4J
autocmd BufNewFile,BufReadPost *.log :set filetype=log4j
autocmd BufNewFile,BufReadPost *.log :set nowrap
autocmd filetype log4j syntax region Function start='\( INFO\|DEBUG\)'hs=s+5 end="|"he=e-1




let g:deoplete#enable_at_startup = 1
