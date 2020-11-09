" Perfomance {{{

if has_key ( plugs, 'vim-better-whitespace' )
	let g:better_whitespace_guicolor='#a4a4a4'
endif

if has_key(plugs, 'goyo.vim')
	nnoremap <silent> <leader>z :Goyo<cr>
	let g:goyo_width = '60%'
	let g:goyo_height = '100%'
endif

if has_key(plugs, 'indentLine')
	let g:indentLine_fileTypeExclude = ['help']
	let g:indentLine_leadingSpaceChar = '·'
	let g:indentLine_char = '┊'
	let g:indentLine_faster = 1
	let g:indentLine_leadingSpaceEnabled = 1
endif

if has_key(plugs, 'vim-gutentags')
	let g:gutentags_project_root = ['*.cpp', '.git']
	let g:gutentags_add_default_project_roots = 0
	let g:gutentags_cache_dir = expand('~/.cache/nvim/tags')
	command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
	let g:gutentags_generate_on_new = 1
	let g:gutentags_generate_on_missing = 1
	let g:gutentags_generate_on_write = 1
	let g:gutentags_generate_on_empty_buffer = 0
	let g:gutentags_ctags_extra_args = ['--tag-relative=yes']
	let g:gutentags_ctags_exclude = ['.git', '.svg', '.hg', '/tests/', 'build', 'dist',
											\ 'sites//files/', 'bin', 'node_modules', 'bower_components', 'cache',
											\ 'compiled', 'docs', 'example', 'bundle', 'vendor', '.md',
											\ '-lock.json', '.lock', 'bundle.js', 'build.js', '.rc', '.json',
											\ '.min.', '.map', '.bak', '.zip', '.pyc', '.class', '.sln',
											\ '.Master', '.csproj', '.tmp', '.csproj.user', '.cache', '.pdb',
											\ 'tags', 'cscope.', '.css', '.less', '.scss', '.exe', '.dll',
											\ '.mp3', '.ogg', '.flac', '.swp', '.swo', '.bmp', '.gif', '.ico',
											\ '.jpg', '.png', '.rar', '.zip', '.tar', '.tar.gz', '.tar.xz', '.tar.bz2',
											\ '.pdf', '.doc', '.docx', '.ppt', '.pptx',]
endif

if has_key(plugs, 'vim-airline')
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail'
	let g:airline#extensions#tabline#left_sep = ''
	let g:airline#extensions#tabline#left_alt_sep = ''
	let g:airline#extensions#tabline#right_sep = ''
	let g:airline#extensions#tabline#right_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
endif
if has_key(plugs, 'auto-pairs')
	let g:AutoPairsShortcutJump = ''
endif
if has_key(plugs, 'committia.vim')
	let g:committia_min_window_width = 70
endif
if has_key(plugs, 'vim-cursorword')
	augroup user_plugin_cursorword
		autocmd!
		autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif
		autocmd InsertEnter * let b:cursorword = 0
		autocmd InsertLeave * let b:cursorword = 1
	augroup END
endif
if has_key(plugs, 'rainbow')
	let g:rainbow_active = 1
endif
if has_key(plugs, 'vim-asterisk')
	map *   <Plug>(asterisk-*)
	map #   <Plug>(asterisk-#)
	map g*  <Plug>(asterisk-g*)
	map g#  <Plug>(asterisk-g#)
	map z*  <Plug>(asterisk-z*)
	map gz* <Plug>(asterisk-gz*)
	map z#  <Plug>(asterisk-z#)
	map gz# <Plug>(asterisk-gz#)
	let g:asterisk#keeppos = 1
endif
if has_key(plugs, 'coc.nvim')
	let g:coc_data_home = $DATA_PATH . '/coc'
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
