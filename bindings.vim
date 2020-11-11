" Resize {{{

nnoremap <silent><Up>    :<C-u>resize +1<CR>
nnoremap <silent><Down>  :<C-u>resize -1<CR>
nnoremap <silent><Right> :<C-u>vertical resize +1<CR>
nnoremap <silent><Left>  :<C-u>vertical resize -1<CR>

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
nnoremap ]l :<C-u>lnext<CR>
nnoremap [l :<C-u>lprev<CR>

" Move throught errors
nnoremap ]e :<C-u>cnext<CR>
nnoremap [e :<C-u>cprev<CR>

if has_key ( plugs, 'vim-better-whitespace')
	" Move throught unneded whitespaces
	nnoremap ]w :<C-u>NextTrailingWhitespace<CR>
	nnoremap [w :<C-u>PrevTrailingWhitespace<CR>
endif

nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-=> <c-w>=

cnoremap <C-h> <Home>
cnoremap <C-l> <End>
cnoremap <C-k> <Right>
cnoremap <C-j> <Left>

nnoremap <Tab> :<C-u>tabnext<CR>
nnoremap <S-Tab> :<C-u>tabprevious<CR>
nnoremap <silent><leader>ol :silent !xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR><CR><CR>

" }}}
" Annoying commands {{{

" Close by simply q
nnoremap <silent><c-q> :<C-u>q<CR>
xnoremap <silent><c-q> :<C-u>q<CR>
nnoremap <silent><a-q> :<C-u>qall<CR>
xnoremap <silent><a-q> :<C-u>qall<CR>
nnoremap <silent><c-s> :<C-u>w<CR>
xnoremap <silent><C-s> :<C-u>w<CR>gv
cnoremap <silent><C-s> :<C-u>w<CR>

autocmd FileType help noremap <buffer> q :<C-u>q<cr>

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
nnoremap <silent><Leader>n :<C-u>set relativenumber!<cr>
" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
