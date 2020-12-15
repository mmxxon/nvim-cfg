" Completion {{{

fu! s:check_back_space() abort
  let col = col('.') -1
  retu !col || getline('.')[col - 1] =~ '\s'
endf

" }}}
" Hover {{{

fu! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    exe 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  el
    exe '!' . &kp . " " . expand('<cword>')
  en
endf

" }}}

" Mappings
ino <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
ino <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" :
  \ <SID>check_back_space() ? "\<S-Tab>" :
  \ coc#refresh()

nn  <silent> K :call <SID>show_documentation()<cr>
