" ===========================================================
" ===    Scripts relevant to the dein plugin manager      ===    
" ===    Has to run first in order to set the runtime     ===
" ===========================================================

if &compatible
    set nocompatible               " Be iMproved
endif


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Add or remove your plugins here:
" Make sure you use single quotes
" Colorscheme
Plug 'morhetz/gruvbox'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Show colors in CSS
Plug 'ap/vim-css-color'

" Physics-based smooth motion in Vim
Plug 'yuttie/comfortable-motion.vim'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" DevIcons
Plug 'ryanoasis/vim-devicons'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Navigate files in sidebar
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'

" Asynchronous linting
Plug 'dense-analysis/ale'

" Asynchronous autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-pyright'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-rls'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-html'
Plug 'neoclide/coc-css'

" Code snippets
Plug 'neoclide/coc-snippets'
Plug 'honza/vim-snippets'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Code-folding, Commenting, Quoting, Tab indicator, Paired brackets
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'jiangmiao/auto-pairs'

" Tagbar navigation
Plug 'majutsushi/tagbar'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Initialize plugin system
call plug#end()
