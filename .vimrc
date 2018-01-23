set bs=2

set wildmenu

set number

set clipboard=unnamed

set ignorecase

execute pathogen#infect()

syntax on
colorschem lucius
LuciusBlack

highlight LineNr ctermfg=4 ctermbg=NONE

filetype indent on

autocmd filetype python set ts=4 sw=4 sts=4 et

autocmd filetype ldif Tagbar
autocmd filetype ldif syntax region Title start="dn:"hs=s+3 end=","he=e-1
autocmd filetype ldif set foldmethod=expr foldexpr=getline(v:lnum)=~'dn:'?'>1':1
autocmd filetype ldif set iskeyword+=\=,.,-,_,\

" Log4J
autocmd BufNewFile,BufReadPost *.log :set filetype=log4j
autocmd BufNewFile,BufReadPost *.log :set nowrap
autocmd filetype log4j syntax region Function start='\( INFO\|DEBUG\)'hs=s+5 end="|"he=e-1




