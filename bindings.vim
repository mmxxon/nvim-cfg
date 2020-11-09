" Resize {{{

nnoremap <silent><Up>    :resize +1<CR>
nnoremap <silent><Down>  :resize -1<CR>
nnoremap <silent><Right> :vertical resize +1<CR>
nnoremap <silent><Left>  :vertical resize -1<CR>

" }}}
" Folds {{{


nnoremap <cr> za
nnoremap <a-cr> zMzvzt

" }}}
" Navigation {{{

if has_key( plugs, 'accelerated-jk' )
	nmap <silent> j <Plug>(accelerated_jk_gj)
	nmap <silent> k <Plug>(accelerated_jk_gk)
endif

" Move throught locations
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

" Move throught errors
nnoremap ]e :cnext<CR>
nnoremap [e :cprev<CR>

if has_key ( plugs, 'vim-better-whitespace')
	" Move throught unneded whitespaces
	nnoremap ]w :NextTrailingWhitespace<CR>
	nnoremap [w :PrevTrailingWhitespace<CR>
endif

nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

cnoremap <C-h> <Home>
cnoremap <C-l> <End>
cnoremap <C-k> <Right>
cnoremap <C-j> <Left>

nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

" }}}
" Annoying commands {{{

" Close by simply q
nnoremap <silent><c-q> :q<CR>
xnoremap <silent><c-q> :q<CR>
nnoremap <silent><a-q> :x<CR>
xnoremap <silent><a-q> :x<CR>
nnoremap <silent><c-s> :w<CR>
xnoremap <silent><C-S> :<C-U>w<CR>gv
cnoremap <silent><C-S> :<C-U>w<CR>

autocmd FileType help noremap <buffer> q :q<cr>

" Re-select blocks after indenting in visual/select mode
xnoremap < <gv
xnoremap > >gv|

" }}}
" Code edit {{{

nnoremap <silent> <Leader>cw :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" }}}
" Abbreviations {{{

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa

" }}}
" Look {{{
nnoremap <silent><Leader>tn :<C-u>set relativenumber!<cr>
" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
