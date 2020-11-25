let g:termdebug_popup = 0
let g:termdebug_wide = 163

if has_key ( plugs, 'vim-better-whitespace' )
	let g:better_whitespace_guicolor='#a4a4a4'
	nnoremap <silent><leader>cw		:StripWhitespace<cr>
endif

if has_key(plugs, 'goyo.vim')
	nnoremap <silent> <leader>zz :Goyo<cr>
	let g:goyo_width = '60%'
	let g:goyo_height = '100%'
endif

if has_key(plugs, 'vim-indentguides')
	let g:indentguides_tabchar = '│'
	let g:indentguides_spacechar = '┆'
	let g:indentguides_ignorelist = [ 'markdown', 'vista', 'text', 'coc-explorer']
endif

if has_key(plugs, 'indentLine')
	let g:indentLine_char = '│'
	let g:indentLine_first_char = '│'
	let g:indentLine_showFirstIndentLevel = 1
	let g:indentLine_setColors = 0
	let g:indentLine_fileTypeExclude = ['markdown', 'vista', 'json', 'coc-explorer']
	" let g:indentLine_leadingSpaceChar = '·'
	" let g:indentLine_leadingSpaceEnabled = 1
	let g:indentLine_faster = 1
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
	let g:airline_section_z = "\ue0a1:%l/%L ｃ%c"
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
	let g:AutoPairsShortcutToggle = ''
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
	let g:floaterm_keymap_new    = '<Leader>fa'
	let g:floaterm_keymap_next   = '<Leader>fs'
	let g:floaterm_keymap_toggle = '<Leader>fd'
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
	nnoremap <leader>fc :FloatermRepl<cr>
	vnoremap <leader>ff :FloatermRepl<cr>
endif

if has_key(plugs, 'tagbar')
	let g:tagbar_autofocus = 1
	" let g:tagbar_autopreview = 1
	" autocmd FileType c,cpp,javascript,typescript,rust nested :TagbarOpen
	nnoremap <silent><leader>t :TagbarToggle<cr>
	nnoremap <F9> :TagbarToggle<cr>
	let g:tagbar_width = 50
	let g:tagbar_map_openfold = [ 'zo', 'l' ]
	let g:tagbar_map_closefold = [ 'zc', 'h' ]
	let g:tagbar_map_openallfolds = [ 'zR', '=' ]
	let g:tagbar_map_closeallfolds = [ 'zM', '-' ]
	let tagbar_map_showproto = ''
	let g:tagbar_show_tag_count = 1
	let g:tagbar_iconchars = ['+', '-']
endif

if has_key(plugs, 'vista.vim')
	let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
	let g:vista_default_executive = 'ctags'
	let g:vista_fold_toggle_icons = [ '-', '+' ]
	let g:vista_cursor_delay = 100
	nnoremap <silent>\v :Vista!!<cr>
	nnoremap <silent><leader>t :Vista coc<cr>
	autocmd FileType vista,vista_kind nmap <buffer> <leader>t q
	autocmd FileType vista,vista_kind nnoremap <buffer> <silent> \/ :<c-u>call vista#finder#fzf#Run()<CR>
endif

if has_key(plugs, "vim-dadbod-ui")
	let g:db_ui_win_position = "right"
	nnoremap <silent><Leader>db :DBUIToggle<cr>
	let g:dbs = {
	\  'bd1': 'postgres://postgres:1234@localhost:5050/postgres',
	\  'bd2': 'postgres://postgres:1234@localhost/postgres'
	\ }
	let g:db_ui_use_nerd_fonts = 1
	let g:db_async = 1
	let g:db_ui_save_location = '~/work/db/dbui'
	let g:db_ui_tmp_query_location = '~/work/db/queries'
	" let g:db_ui_auto_execute_table_helpers = 1
	let g:db_ui_winwidth = 40
	let g:db_ui_show_database_icon = 1
endif

" if has_key(plugs, 'fzf.vim')
" 	nnoremap <silent><leader>zg :GitFiles?<cr>
" 	nnoremap <silent><leader>zt :Tags<cr>
" 	nnoremap <silent><leader>zbt :BTags<cr>
" 	nnoremap <silent><leader>zm :Marks<cr>
" 	nnoremap <silent><leader>zc :Commits<cr>
" 	nnoremap <silent><leader>zbc :BCommits<cr>
" 	nnoremap <silent><leader>zf :FZF<cr>
" 	nnoremap <silent><leader>za :Colors<cr>
" endif

if has_key(plugs, 'vim-session')
	nmap <leader>w [vim-s]
	nnoremap <silent> [vim-s]w :SaveSession<cr>
	nnoremap <silent> [vim-s]o :OpenSession<cr>
	nnoremap <silent> [vim-s]c :CloseSession<cr>
	nnoremap <silent> [vim-s]d :DeleteSession<cr>
	nnoremap <silent> [vim-s]v :ViewSession<cr>
	let g:session_autoload = 'no'
endif

if has_key(plugs, 'vim-windowswap')
	let g:windowswap_map_keys = 0
	nnoremap <silent> <leader>ws :call WindowSwap#EasyWindowSwap()<CR>
endif

if has_key(plugs, 'vim-zoomwin')
	nnoremap <leader>wf :ZoomToggle<cr>
endif

if has_key(plugs, 'projectile.vim')
	nnoremap \pa :AddProject<cr>
	nnoremap \pl :ListProject<cr>
	nnoremap \pr :RemoveProject<cr>
endif

if has_key(plugs, 'vim-easymotion')
	map ' <Plug>(easymotion-prefix)
endif

if has_key(plugs, 'vimspector')
	let g:vimspector_enable_mappings = 'HUMAN'
	let g:ycm_semantic_triggers =  {'VimspectorPrompt': [ '.', '->', ':', '<']}
	let g:vimspector_json_path=$VIM_PATH . "/vimspector/"
	nnoremap <F7> :VimspectorReset<cr>
	command! -bar -nargs=1 VimSpectorLoadTemplate
			\ execute "0r ".g:vimspector_json_path.<q-args>
	command! -bang -nargs=* VimSpectorLoadJson call fzf#run({
							\   'source': 'ls ' . vimspector_json_path,
							\   'sink': 'e .vimspector.json | VimSpectorLoadTemplate',
							\   'down': '25%',
							\   'options': '--preview-window=hidden'
							\ })
	noremap <leader>vs :LoadVimSpectorJson<CR>
endif
if has_key(plugs, 'vim-anyfold')
	autocmd Filetype * AnyFoldActivate
	let g:anyfold_fold_comments=1
	let g:anyfold_identify_comments=2
endif

if has_key(plugs, 'vim-rooter')
	let g:rooter_patterns = ['.git', 'Makefile',
			\ '*.sln', 'build/env.sh', 'composer.json',
			\ 'composer.lock','.idea','package.json',
			\ '.git','.gitignore','.hg','.projections.json',
			\ '.vimspector.json']
	let g:rooter_targets = '/,*'
	let g:rooter_change_directory_for_non_project_files = 'current'
	let g:rooter_silent_chdir = 1
endif

if has_key(plugs, 'Sierra')
"	let g:sierra_Sunset = 1
"	let g:sierra_Twilight = 1
"	let g:sierra_Midnight = 1
	let g:sierra_Pitch = 1
endif

if has_key(plugs, 'equinusocio-material.vim')
	let g:equinusocio_material_style = 'pure'
endif

if has_key(plugs, 'badwolf')
	let g:badwolf_darkgutter = 1
	let g:badwolf_tabline = 0
endif

if has_key(plugs, 'vim-move')
	let g:move_map_keys = 0
	nmap <A-p> <Plug>MoveLineUp
	nmap <A-n> <Plug>MoveLineDown
	nmap <A-,> <Plug>MoveCharLeft
	nmap <A-.> <Plug>MoveCharRight
	vmap <A-p> <Plug>MoveBlockUp
	vmap <A-n> <Plug>MoveBlockDown
	vmap <A-,> <Plug>MoveBlockLeft
	vmap <A-.> <Plug>MoveBlockRight
endif

if has_key(plugs, 'vim-instant-markdown')
	let g:instant_markdown_autostart = 0
endif

if has_key(plugs, 'emmet-vim')
	let g:user_emmet_install_global = 0
	autocmd FileType html,css EmmetInstall
endif

if has_key(plugs, 'vim-livedown')
	nnoremap <leader>M :LivedownToggle<CR>
endif

if has_key(plugs, 'bracey.vim')
	nnoremap <Leader>P :Bracey<cr>
endif

if has_key(plugs, 'nvim-treesitter')
lua << EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "all",     -- one of "all", "language", or a list of languages
highlight = {
	enable = true,              -- false will disable the whole extension
},
refactor = {
	highlight_definition = { enable = true },
	navigation = { enable = true },
},
textobjects = { enable = true },
}
EOF
endif

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
