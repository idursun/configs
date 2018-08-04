let mapleader = "\<Space>"

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


hi Normal ctermbg=NONE

call plug#begin('~/.vim/plugged')
  Plug 'chriskempson/base16-vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-surround'
  Plug 'itchyny/lightline.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'Shougo/echodoc.vim'
  Plug 'cespare/vim-toml'
  Plug 'airblade/vim-rooter'
  "Plug 'rhysd/rust-doc.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'rust-lang/rust.vim'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

let g:rooter_manual_only = 1

" only lint on save
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_autoStart = 1
let g:rustfmt_autosave = 1

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls']
    \ }


set hidden
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>s :call LanguageClient#textDocument_documentSymbol()<CR>

"nnoremap gd :ALEGoToDefinitionInTab<CR>
map <leader>f :Files<CR>
nmap <leader>; :Buffers<CR>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

imap <C-s> <ESC>:w<CR>
nmap <leader>w :w<CR>
map <leader>p "*p
map <leader>y "*y
vmap <C-c> "*y

" Completion
" tab to select
" and don't hijack my enter key
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

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

