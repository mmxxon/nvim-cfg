let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 200

" Groups

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'priority': 3,
      \ 'allowlist': ['*'],
      \ 'completor': function('asyncomplete#sources#file#completor'),
      \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
      \ 'name': 'buffer',
      \ 'priority': 4,
      \ 'allowlist': ['*'],
      \ 'blocklist': ['go'],
      \ 'completor': function('asyncomplete#sources#buffer#completor'),
      \ 'config': {
      \    'max_buffer_size': 5000000,
      \  },
      \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
      \ 'name': 'tags',
      \ 'priority': 5,
      \ 'allowlist': ['c'],
      \ 'completor': function('asyncomplete#sources#tags#completor'),
      \ 'config': {
      \    'max_file_size': 300000000,
      \  },
      \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
      \ 'name': 'necosyntax',
      \ 'priority': 7,
      \ 'allowlist': ['*'],
      \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
      \ }))

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

