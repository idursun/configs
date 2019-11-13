let mapleader = "\<Space>"

set pyxversion=3
set relativenumber
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nojoinspaces
set number
set nowrap
set hls
set ruler
set incsearch
set backspace=2
set signcolumn=yes
set splitbelow
set termguicolors

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

hi Normal ctermbg=NONE

call plug#begin('~/.vim/plugged')
  Plug 'chriskempson/base16-vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-sensible'
  Plug 'itchyny/lightline.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'Shougo/echodoc.vim'
  Plug 'cespare/vim-toml'
  Plug 'airblade/vim-rooter'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'rust-lang/rust.vim'
  Plug 'dense-analysis/ale'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
  endif
   Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
call plug#end()


let g:rooter_manual_only = 1
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_autoStart = 1
let g:rustfmt_autosave = 1
let g:ale_set_highlights = 0

highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEWarning ctermbg=DarkMagenta

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'nightly', 'rls']
"     \ }

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls']
    \ }



set hidden

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

set completeopt-=preview
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

" nvim
if has('nvim')
	runtime! plugin/python_setup.vim
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Colors
colorscheme base16-monokai
