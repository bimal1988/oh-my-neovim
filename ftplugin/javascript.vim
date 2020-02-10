let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
autocmd FileType javascript setlocal omnifunc=tern#Complete

" Check Python files with flake8 and pylint.
let b:ale_linters = ['eslint']

" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['eslint']

set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
