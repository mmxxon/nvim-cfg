" Resize {{{

nnoremap <silent><Up>    :resize +1<CR>
nnoremap <silent><Down>  :resize -1<CR>
nnoremap <silent><Right> :vertical resize +1<CR>
nnoremap <silent><Left>  :vertical resize -1<CR>

" }}}
" Folds {{{


nnoremap <CR> za
nnoremap <A-CR> zMzvzt

" }}}
" Navigation {{{

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


" }}}
" Code edit {{{

nnoremap <silent> <Leader>cw :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

if has_key(plugs, 'asyncomplete')
	inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ asyncomplete#force_refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
endif

" }}}
" Abbreviations {{{

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa

" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
