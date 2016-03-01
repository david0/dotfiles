set bs=2

set wildmenu

set number

set clipboard=unnamed

execute pathogen#infect()

syntax on
colorschem lucius
LuciusBlack

highlight LineNr ctermfg=4 ctermbg=NONE

filetype indent on

autocmd filetype python set ts=4 sw=4 sts=4 et

autocmd filetype ldif syntax region Title start="dn:"hs=s+3 end=","he=e-1
