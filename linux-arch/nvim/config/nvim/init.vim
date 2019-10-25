set shell=/bin/bash
set encoding=utf-8
set relativenumber
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nowrap
set hls
set ruler
set incsearch
set backspace=2
set background=dark
set splitbelow
highlight clear SignColumn
set signcolumn="yes"
let mapleader=" "
let $FZF_DEFAULT_COMMAND='rg -l ""'
setlocal spell spelllang=en_gb
set rtp+=$HOME/vimfiles
call plug#begin('$HOME/plugged/')
 Plug 'chriskempson/base16-vim'
 Plug 'terryma/vim-multiple-cursors'
 Plug 'machakann/vim-highlightedyank'
 Plug 'airblade/vim-rooter'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-sensible'
 Plug 'scrooloose/nerdtree'
 Plug 'rust-lang/rust.vim'
 Plug 'itchyny/lightline.vim'
 Plug 'junegunn/fzf'
 Plug 'junegunn/fzf.vim'
 Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 " Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
call plug#end()

let g:rustfmt_autosave = 1
let g:rooter_manual_only = 1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
                 \ 'rust': ['rustup', 'run', 'stable', 'rls'],
                 \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <leader>s :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>t :call LanguageClient_workspace_symbol()<CR>
nnoremap <leader>; :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>w :w<cr>
imap <C-s> <ESC>:w<CR>
imap <C-j> <ESC>
map! <S-Insert> <C-R>+
map <leader>n :nohl<cr>
map <leader>p "*p
vmap <C-c> <C-Ins>
tnoremap <C-j> <C-\><C-N>

set completeopt+=longest,menuone
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#deoplete_onmni_patterns = get(g:, 'deoplete#force_omni_input_patterns', {})

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-monokai
