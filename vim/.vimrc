set nocompatible    " Disable vi compatibility
set number          " Show line number
set hls             " Highlight Search
syntax enable       " Turn on syntax highlighting
set ts=4            " tabstop - Tab size
set sw=4            " shiftwidth - Indentation size
set sts=4           " softtabstop - Tabs/Spaces interop
set expandtab       " Expands tab to spaces

" Vundle Init
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'

" Vundle Ends
call vundle#end()
filetype plugin indent on

" Indentation for Ruby
:autocmd Filetype ruby set sts=2
:autocmd Filetype ruby set sw=2
:autocmd Filetype ruby set ts=2

" Airline
let g:airline_powerline_fonts = 1

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>

" FZF
set rtp+=~/.fzf
nnoremap <C-f> :FZF<CR>

" Colorscheme
colorscheme onedark
