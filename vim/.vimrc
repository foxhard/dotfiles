set nocompatible    " Disable vi compatibility
set number          " Show line number
syntax enable       " Turn on syntax highlighting
set ts=4            " tabstop - Tab size
set sw=4            " shiftwidth - Indentation size
set sts=4           " softtabstop - Tabs/Spaces interop
set expandtab       " Expands tab to spaces
set incsearch       " Inclusive search (highlighting when typing)
set nohlsearch      " Do not highlight word after press enter

" Vundle Init
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'mattn/emmet-vim'
Plugin 'preservim/nerdcommenter'
Plugin 'neoclide/coc.nvim'

" Vundle Ends
call vundle#end()
filetype plugin indent on

" Indentation for Ruby
:autocmd Filetype ruby set sts=2
:autocmd Filetype ruby set sw=2
:autocmd Filetype ruby set ts=2

" Indentation for JavaScript
:autocmd Filetype javascript set sts=2
:autocmd Filetype javascript set sw=2
:autocmd Filetype javascript set ts=2

" Airline
let g:airline_powerline_fonts = 1

" NERDTree
nnoremap - :NERDTreeToggle<CR>
map ] :NERDTreeFind<CR>

" FZF
set rtp+=~/.fzf
nnoremap <C-f> :FZF<CR>

" Colorscheme
colorscheme onedark

" Emmet
let g:user_emmet_leader_key=','

" ALE
" --- Set specific linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
" --- Only run linters named in ale_linters settings
let g:ale_linters_explicit = 1
" --- Integration with airline
let g:airline#extensions#ale#enabled = 1
" --- Set linting column always visible
let g:ale_sign_column_always = 1
" --- Disable ALE auto highlights
let g:ale_set_highlights = 0
" --- Don't run linters on text changed
let g:ale_lint_on_text_changed = 'never'
" --- Don't run linters on leaving insert mode
let g:ale_lint_on_insert_leave = 0
" --- Don't run linters on opening a file
let g:ale_lint_on_enter = 0
" --- Don't run linters on saving file
let g:ale_lint_on_save = 1
" --- Run fixers on saving file
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'ruby': ['rubocop'],
\}

" Custom maps
" --- Save current file
nmap <C-g> :w<cr>
" --- Run rspec on current file
nmap <Leader>r :!clear && rspec %<cr>
" --- Run jest on current file
nmap <Leader>j :!clear && npx jest %<cr>
" --- Toggle search highlights
nnoremap <c-h> :set hlsearch!<cr>
" --- Use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
