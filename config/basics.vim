" ===========================================================
" ===               Environment Variables                 ===    
" ===========================================================
let $NVIM_TUI_ENABLE_TRUE_COLOR=1	" Enable true colors in neovim
let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let $VARPATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.config/nvim').'/tmp')

" ===========================================================
" ===                  General Settings                   ===    
" ===========================================================
" Enable filetype plugins
filetype plugin on
filetype indent on

set modeline			        " automatically setting options from modelines
set autoread			        " Auto read when a file is changed from outside
set magic   			        " For regular expressions turn magic on
set hidden  			        " Hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac 	" Use Unix as the standard file type
set lazyredraw			        " Don't redraw while executing macros (good performance)
set noerrorbells		        " Dont trigger bell on error
set visualbell			        " Use visual bell instead of beeping
set encoding=utf-8		        " Set encoding
scriptencoding utf-8		    " Set script encoding
set clipboard+=unnamedplus	    " Copies using system clipboard

" ===========================================================
" ===                      Wild menu                      ===    
" ===========================================================
set wildmenu
set wildmode=list:longest,full
set wildignorecase

" Ignore specific files
set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
set wildignore+=__pycache__,*.egg-info

" ===========================================================
" ===                     Searching                       ===    
" ===========================================================
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed

" ===========================================================
" ===                      Behavior                       ===    
" ===========================================================
set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,usetab    " Jump to the first open window in any tab
set switchbuf+=vsplit           " Switch buffer behavior to vsplit
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore white
set showfulltag                 " Show tag and tidy search in completion
set complete=.                  " No wins, buffs, tags, include scanning
set completeopt=menuone         " Show menu even for one item
set completeopt+=noselect       " Do not select a match in the menu

" ===========================================================
" ===                Text, Tab and Indents                ===    
" ===========================================================
set textwidth=80    " Text width maximum chars before wrapping
set expandtab		" Expand tabs to spaces.
set tabstop=4       " The number of spaces a tab is
set softtabstop=4	" While performing editing operations
set shiftwidth=4	" Number of spaces to use in auto(indent)
set smarttab		" Tab insert blanks according to 'shiftwidth'
set autoindent		" Use same indenting on new lines
set smartindent		" Smart autoindenting on new lines
set shiftround		" Round indent to multiple of 'shiftwidth'

" ===========================================================
" ===                    User interface                   ===    
" ===========================================================
set noshowmode          " Don't show mode in cmd window
set shortmess=aoOTI     " Shorten messages and don't show intro

set scrolloff=5	       	" Keep at least 5 lines above/below
set sidescrolloff=2     " Keep at least 2 chars left/right
set foldcolumn=1	    " Add a bit extra margin to the left

set number		        " Show line numbers
set relativenumber	    " Show relative line numbers
set ruler		        " Always show current position
set cursorline		    " Highlights current line

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winheight=1         " Minimum height for active window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set noshowcmd           " Don't show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set noequalalways       " Don't resize windows on split or close
set laststatus=2        " Always show a status line
set colorcolumn=80      " Highlight the 80th character limit
set mat=2		        " How many tenths of a second to blink when matching brackets
set display=lastline	" Display as much as possible for last line

" ===========================================================
" ===                        Timeout                      ===    
" ===========================================================
set timeout ttimeout
set timeoutlen=750	" Time out on mappings
set updatetime=1000	" Idle time to write swap and trigger CursorHold
set ttimeoutlen=10	" Time out on key codes

" ===========================================================
" ===              Files and Directory Settings           ===    
" ===========================================================
set undofile swapfile nobackup
set directory=$VARPATH/swap,$VARPATH,~/tmp,/var/tmp,/tmp
set undodir=$VARPATH/undo,$VARPATH,~/tmp,/var/tmp,/tmp
set backupdir=$VARPATH/backup,$VARPATH,~/tmp,/var/tmp,/tmp
set viewdir=$VARPATH/view/
set nospell spellfile=$VIMPATH/spell/en.utf-8.add

set history=500			" History saving

" ===========================================================
" ===                   Colors and Fonts                  ===    
" ===========================================================
if $COLORTERM == 'gnome-terminal'	" Enable 256 colors palette in Gnome Terminal
    set t_Co=256
    set termguicolors
endif

" Enable syntax highlighting
syntax enable 

" Set colors in terminal
" NeoSolarized / onedark
set background=dark
colorscheme gruvbox

" Set extra options when running in GUI mode
if has("gui_running")
    set background=dark
    set lines=40
    set columns=150
endif

" Set font according to system
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

