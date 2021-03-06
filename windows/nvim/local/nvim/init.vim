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
set termguicolors
set hidden
set cmdheight=2
set noswapfile
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
setlocal spell spelllang=en_gb

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
highlight clear SignColumn
let base16colorspace=256  " Access colors present in 256 colorspace
let mapleader=" "
let $FZF_DEFAULT_COMMAND = 'rg -l ""'

nnoremap <silent> K :call <SID>show_documentation()<CR>

set rtp+=$USERPROFILE/vimfiles
call plug#begin('$USERPROFILE/plugged/')
 Plug 'chriskempson/base16-vim'
 Plug 'terryma/vim-multiple-cursors'
 Plug 'airblade/vim-rooter'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-sensible'
 Plug 'scrooloose/nerdtree'
 Plug 'itchyny/lightline.vim'
 Plug 'junegunn/fzf'
 Plug 'junegunn/fzf.vim'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:rooter_manual_only = 1

nnoremap <leader>; :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>w :w<cr>
imap <C-s> <ESC>:w<CR>
imap <C-j> <ESC>
map! <S-Insert> <C-R>+
map <leader>p "*p
vmap <C-c> <C-Ins>
tnoremap <C-j> <C-\><C-N>

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

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

set completeopt+=longest,menuone
set completeopt-=preview

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd VimEnter * if &filetype !=# 'gitcommit'  | colorscheme base16-monokai   | endif
set mouse=a
