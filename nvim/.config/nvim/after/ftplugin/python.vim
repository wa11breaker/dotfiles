" Python specific settings.
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent

" Run the current file (buffer-local so they don't clobber the DAP F-keys elsewhere)
nnoremap <buffer> <F5> :w <CR> :!clear; python % <CR>
nnoremap <buffer> <F6> :w <CR> :!python %

let python_highlight_all=1

" Flag leading tabs and trailing whitespace as bad.
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /^\t\+\|\s\+$/
