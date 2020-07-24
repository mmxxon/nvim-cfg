" Perfomance {{{

if has_key( plugs, 'accelerated-jk' )
	nmap <silent> j <Plug>(accelerated_jk_gj)
	nmap <silent> k <Plug>(accelerated_jk_gk)

endif

if has_key ( plugs, 'vim-better-whitespace' )
	let g:better_whitespace_guicolor='#a4a4a4'

endif

" }}}
" Colorschemes {{{

if has_key(plugs, 'Sierra')
"	let g:sierra_Sunset = 1
"	let g:sierra_Twilight = 1
"	let g:sierra_Midnight = 1
 	let g:sierra_Pitch = 1
endif

" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
