if has_key ( plugs, 'vim-better-whitespace' )
	let g:better_whitespace_guicolor='#a4a4a4'
endif

if has_key(plugs, 'goyo.vim')
	nnoremap <silent> <leader>zz :Goyo<cr>
	let g:goyo_width = '60%'
	let g:goyo_height = '100%'
endif

if has_key(plugs, 'indentLine')
	let g:indentLine_char = '│'
	let g:indentLine_first_char = '│'
	let g:indentLine_showFirstIndentLevel = 1
	let g:indentLine_setColors = 0
	let g:indentLine_fileTypeExclude = ['help', 'startify', 'coc-explorer']
	let g:indentLine_leadingSpaceChar = '·'
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

if has_key(plugs, 'vim-floaterm')
	let g:floaterm_width=0.4
	let g:floaterm_height=0.4
	let g:floaterm_position="bottomright"
	let g:floaterm_keymap_new    = '<F2>'
	let g:floaterm_keymap_next   = '<F3>'
	let g:floaterm_keymap_toggle = '<F4>'
	function! s:runner_proc(opts)
		let curr_bufnr = floaterm#curr()
		if has_key(a:opts, 'silent') && a:opts.silent == 1
			FloatermHide!
		endif
		let cmd = 'cd ' . shellescape(getcwd())
		call floaterm#terminal#send(curr_bufnr, [cmd])
		call floaterm#terminal#send(curr_bufnr, [a:opts.cmd])
		stopinsert
		if &filetype == 'floaterm' && g:floaterm_autoinsert
			call floaterm#util#startinsert()
		endif
	endfunction
	let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
	let g:asyncrun_runner.floaterm = function('s:runner_proc')
	let g:asynctasks_term_pos="floaterm"
endif

if has_key(plugs, 'vim-floaterm-repl')
	nnoremap <leader>uc :FloatermRepl<CR>
	vnoremap <leader>uc :FloatermRepl<CR>
endif

if has_key(plugs, 'tagbar')
	let g:tagbar_autofocus = 1
	" let g:tagbar_autopreview = 1
	autocmd FileType c,cpp,javascript,typescript,rust nested :TagbarOpen
	nnoremap <silent><leader>t :<C-u>TagbarToggle<cr>
	nnoremap <F9> :<C-u>TagbarToggle<cr>
	let g:tagbar_width = 50
	let g:tagbar_map_openfold = [ 'zo', 'l' ]
	let g:tagbar_map_closefold = [ 'zc', 'h' ]
	let g:tagbar_map_openallfolds = [ 'zR', '=' ]
	let g:tagbar_map_closeallfolds = [ 'zM', '-' ]
	let tagbar_map_showproto = ''
endif

if has_key(plugs, "vim-dadbod-ui")
	let g:db_ui_win_position = "right"
	nnoremap <silent><Leader>db :<C-u>DBUIToggle<cr>
endif

if has_key(plugs, 'fzf.vim')
	nnoremap <silent><leader>zf :<C-u>GitFiles?<CR>
	nnoremap <silent><leader>zg :<C-u>Tags<CR>
	nnoremap <silent><leader>zt :<C-u>BTags<CR>
	nnoremap <silent><leader>zm :<C-u>Marks<CR>
	nnoremap <silent><leader>zc :<C-u>Commits<CR>
	nnoremap <silent><leader>zb :<C-u>BCommits<CR>
	nnoremap <silent><leader>zz :<C-u>FZF<CR>
	nnoremap <silent><leader>za :<C-u>Colors<CR>
endif

if has_key(plugs, 'vim-session')
	nnoremap <silent><leader>ww :<C-u>SaveSession<CR>
	nnoremap <F5> :<C-u>SaveSession<CR>
	nnoremap <silent><leader>wo :<C-u>OpenSession<CR>
	nnoremap <F6> :<C-u>OpenSession<CR>
	nnoremap <silent><leader>wc :<C-u>CloseSession<CR>
	nnoremap <silent><leader>wd :<C-u>DeleteSession<CR>
	nnoremap <silent><leader>wv :<C-u>ViewSession<CR>
	let g:session_directory = $DATA_PATH . '/session/'
	let g:session_autoload = 'no'
endif

if has_key(plugs, 'Sierra')
"	let g:sierra_Sunset = 1
"	let g:sierra_Twilight = 1
"	let g:sierra_Midnight = 1
 	let g:sierra_Pitch = 1
endif

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
