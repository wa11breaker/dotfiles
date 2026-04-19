set syntax=off
set clipboard=unnamedplus
set paste

xnoremap Y "+y
let mapleader="\<Space>"

" Better up/down
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'

" Better escape using jk in insert and terminal mode
inoremap jk <Esc>
tnoremap jk <C-\><C-n>

" Move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Join lines without moving the cursor to the end
nnoremap J mzJ`z

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Clear search with leader h
nnoremap <leader>h :noh<CR><Esc>

" Half page jumping and cursor stays in the middle
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Center after search and jumps
nnoremap n nzzzv
nnoremap N Nzzzv

" Paste and without overwriting register
xnoremap <leader>p "_dP

" Delete and without overwriting register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <Leader>sf <Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>
nnoremap <Leader>e <Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>
nnoremap <Leader>ca <Cmd>call VSCodeNotify("editor.action.quickFix")<CR>
nnoremap <Leader>rn <Cmd>call VSCodeNotify("editor.action.rename")<CR>
nnoremap <Leader>f <Cmd>call VSCodeNotify("editor.action.formatDocument")<CR>

nnoremap <silent> <c-k> <Cmd>call VSCodeCall('editor.action.showHover')<CR>
nnoremap <silent> gd <Cmd>call VSCodeCall('editor.action.revealDefinition')<CR>
nnoremap <silent> gi <Cmd>call VSCodeCall('editor.action.goToImplementation')<CR>
nnoremap <silent> gD <Cmd>call VSCodeCall('editor.action.revealDeclaration')<CR>
nnoremap <silent> gr <Cmd>call VSCodeCall('references-view.find')<CR>
nnoremap <silent> K <Cmd>call VSCodeCall('editor.action.showHover')<CR>
