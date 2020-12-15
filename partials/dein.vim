let s:dein_cache = $DATA_PATH . '/dein'

if &runtimepath !~# '/dein.vim'
	let s:dein_repo = s:dein_cache . '/repos/github.com/Shougo/dein.vim'
	if !isdirectory(s:dein_repo)
		exe '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo)
	endif
	exe 'se rtp^=' . s:dein_repo
endif

fu! s:TOMLation(dir)
	for s:path in split(globpath(a:dir, '*.toml'), '\n')
		if s:path =~# '\_lazy\.toml$'
			call dein#load_toml(s:path, {'lazy': 1})
		el
			call dein#load_toml(s:path, {'lazy': 0})
		en
	endfo
endf


if dein#load_state(s:dein_cache)
	call dein#begin(s:dein_cache)
	call s:TOMLation($VIM_PATH . '/toml')
	call dein#end()
	call dein#save_state()
en

filetype plugin indent on
syntax enable
