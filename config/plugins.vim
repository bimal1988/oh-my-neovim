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
" Colorschemes
Plug 'icymind/neosolarized'
Plug 'joshdick/onedark.vim'
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

" Fuzzy finder
Plug '~/.fzf'

" Navigate files in sidebar
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'

" Asynchronous linting
Plug 'w0rp/ale'

" Asynchronous autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}

" Code snippets
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
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

" CTag generation and tagbar navigation
Plug 'craigemery/vim-autotag'
Plug 'majutsushi/tagbar'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Initialize plugin system
call plug#end()
