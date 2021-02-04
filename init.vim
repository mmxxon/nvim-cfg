let $DATA_PATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/nvim')
let $VIM_PATH = expand(($XDG_CONFIG_HOME ? $XDG_CONFIG_HOME : '~/.config') . '/nvim')

if has('vim_starting')
	let g:mapleader="\<Space>"
	for s:path in [ $DATA_PATH, $DATA_PATH . '/undo', $DATA_PATH . '/backup',
				\ $DATA_PATH . '/session', $DATA_PATH . '/spell', $DATA_PATH . '/tags' ]
		if ! isdirectory(s:path)
			call mkdir(s:path, 'p')
		en
	endfo
	if &rtp !~# $VIM_PATH
		se rtp^=$VIM_PATH
	endif

  nm <Space> <nop>
  xm <Space> <nop>
  nm \ <nop>
  xm \ <nop>
en

let g:python3_host_prog = '/bin/python'
let g:python_host_prog = '/bin/python2'

ru partials/general.vim
ru partials/dein.vim
ru partials/bindings.vim
ru partials/commands.vim
ru partials/theme.vim
ru partials/functions.vim
