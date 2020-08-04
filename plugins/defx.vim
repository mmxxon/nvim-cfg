nnoremap <silent> <LocalLeader>e
	\ :<C-u>Defx -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
	\ :<C-u>Defx -search=`expand('%:p')` -buffer-name=tab`tabpagenr()`<CR>
