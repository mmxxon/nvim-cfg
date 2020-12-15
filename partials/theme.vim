let s:cache_file = $DATA_PATH . '/theme.txt'

fu! s:theme_init()
	let l:default = 'ayu'
	if ! exists('g:colors_name')
		set background=dark
		let l:scheme = filereadable(s:cache_file) ? readfile(s:cache_file)[0] : l:default
		try
			exe 'colorscheme' l:scheme
		catch /^Vim\%((\a\+)\)\=:E185/
			sil! exe 'colorscheme' l:default
		endtry
	en
endf

fu! s:theme_autoload()
	if exists('g:colors_name')
		let theme_path = $VIM_PATH . '/themes/' . g:colors_name . '.vim'
		if filereadable(theme_path)
			exe 'source' fnameescape(theme_path)
		en
		call writefile([g:colors_name], s:cache_file)
	en
endf

aug xon_theme
	au!
	au ColorScheme * call s:theme_autoload()
aug end

call s:theme_init()
