
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'preservim/nerdtree'
  Plug 'majutsushi/tagbar'
  Plug 'Yggdroot/LeaderF'
  Plug 'neovim/nvim-lspconfig'
call plug#end()


" GUI
set guifont=Monaco:h12
set guitablabel=%t " Show only filename as tab name

colorscheme gruvbox
syntax on


set spelllang=de,en
set clipboard=unnamed
set title

set guioptions-=T
set hidden
set number

" Command Line 
cno $h ~ 

set showmatch " jump to matching brace

set ignorecase
set backspace=2
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab
 
filetype plugin on
autocmd FileType bash,shell set tags=~/.vim/systags_binaries
autocmd FileType make       set tags=~/.vim/systags_binaries  noexpandtab shiftwidth=8
autocmd FileType python     set tags=~/.vim/systags_python    expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType go					set noexpandtab

map <C-r> :exec("tag ".expand("<cword>"))<CR>

let Tlist_Ctags_Cmd='/opt/local/bin/ctags'

"mac fix
set backupskip=/tmp/*,/private/tmp/*

" autocompletion
inoremap <C-Space> <C-x><C-o>
set completeopt=noinsert,menuone
autocmd FileType * set omnifunc=v:lua.vim.lsp.omnifunc completeopt=noinsert,menuone

highlight LspDiagnosticsDefaultWarning ctermfg=238
highlight LspDiagnosticsDefaultHint ctermfg=238
highlight LspDiagnosticsDefaultInformation ctermfg=238
highlight LspDiagnosticsDefaultError ctermfg=88

lua << EOF
  local custom_lsp_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.fn.nvim_buf_set_keymap(0, 'n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  end


  for _, server in ipairs({'bashls', 'jdtls', 'rls'}) do
    require'lspconfig'[server].setup {
      on_attach = custom_lsp_attach
    }
  end

  require'lspconfig'.clangd.setup {
    cmd = {'/usr/local/opt/llvm/bin/clangd'},
    on_attach = custom_lsp_attach
  }
  require'lspconfig'.pyls.setup {
    settings = { pyls = { plugins = { pycodestyle = { enabled = false } } } },
    on_attach = custom_lsp_attach
  }
  require'lspconfig'.gopls.setup {
    cmd = { '/usr/local/bin/gopls' },
    on_attach = custom_lsp_attach
  }

  --  disable diagnostics
  --vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end
EOF

let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_WindowPosition = 'popup'

map <C-R> :Leaderf file<CR>
map <C-T> :Leaderf tag<CR>

