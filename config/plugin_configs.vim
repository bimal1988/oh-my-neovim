" ===========================================================
" ===                       Nerd Tree                     ===    
" ===========================================================
let g:NERDTreeWinPos = "left"
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35

" ===========================================================
" ===                        Ale                          ===    
" ===========================================================
let g:ale_completion_enabled = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '◆'
highlight ALEWarningSign ctermfg=172

" ===========================================================
" ===                      Polyglot                       ===
" ===========================================================
let g:python_highlight_space_errors = 0

" ===========================================================
" ===                      Ligthline                      ===    
" ===========================================================
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'cocstatus', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'lineinfo': ' %3l:%-2v'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'cocstatus': 'coc#status'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'component_expand': {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok'
      \ },
      \ 'component_type': {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left'
      \ }
\ }

function! LightlineFugitive()
      if exists('*fugitive#head')
            let branch = fugitive#head()
            return branch !=# '' ? ' '.branch : ''
      endif
      return ''
endfunction

let g:lightline.separator = {
      \   'left': '', 'right': ''
\ }
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
\ }

let g:lightline.tabline = {
      \   'left': [ ['tabs'] ],
      \   'right': [ ['close'] ]
\ }

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
let g:lightline#ale#indicator_checking = "⌛"
let g:lightline#ale#indicator_warnings = "◆ "
let g:lightline#ale#indicator_errors = "✗ "
let g:lightline#ale#indicator_ok = "✔︎"

" ===========================================================
" ===              Git gutter (Git diff)                  ===    
" ===========================================================
let g:gitgutter_enabled=0

" ===========================================================
" ===                       Coc                      ===    
" ===========================================================


" ===========================================================
" ===                         FZF                         ===
" ===========================================================
let g:fzf_files_options =
      \ '--preview "(bat --style=numbers --color=always {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200"'
