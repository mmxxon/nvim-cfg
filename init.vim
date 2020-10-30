" by xon-dev
" Mostly use rafi/vim-config
"
" ---------------------------

let g:mapleader="\<Space>" " Leader key

" PLUG: plug-vim {{{
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
" }}}
" Paths {{{
let $DATA_PATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/nvim')
let $VIM_PATH = expand(($XDG_CONFIG_HOME ? $XDG_CONFIG_HOME : '~/.config') . '/nvim')


" Check directories & create all that not exist
for s:path in [ $DATA_PATH, $DATA_PATH . '/undo', $DATA_PATH . '/backup',
			\ $DATA_PATH . '/session', $DATA_PATH . '/spell' ]
	if ! isdirectory(s:path)
		call mkdir(s:path, 'p')
	endif
endfor

" Runtime path
if &runtimepath !~# $VIM_PATH
	set runtimepath^=$VIM_PATH
endif
" }}}
" General {{{
set mouse=nv				  " Modes that allow mouse usage
set report=0
set errorbells			  " Beep or screen flash for error messages.
set visualbell			  " Use visual bell instead of beeping
set hidden					  " Buffers won't unloads when becomes hidden
set magic							" Special characters in patterns
set path+=**					" Search all directories
set formatoptions+=1
set formatoptions-=to
set virtualedit=block " Cursor shape
set synmaxcol=2500		" Maximum column to match syntax
set autoread					" Write file if it has changed outside vim
set clipboard& clipboard+=unnamedplus " System clipboard
set termguicolors			" Colors
set scrolloff=5
set sidescrolloff=6

set number						" Enables line numbers
set numberwidth=2			" Default size of numbers field
set relativenumber		" Enables relative number
set cursorline				" Highlight caret line

set textwidth=90			" Maximum line size
set tabstop=2					" Number of spaces used in <Tab>
set shiftwidth=2			" Number of spaces used in identation
set shiftround				" Use shiftwidth when shifting lines
set softtabstop=-1		" Number of spaces that a <Tab> counts for while performing editing
set smarttab					" Assign tabs

set autoindent				" Copy indent from current line on new line
set smartindent				" Smart indent newlines in c-like syntax

set nowrap						" Dont wrap lines
set linebreak
set breakat=\ \	;:,!?
set nostartofline
set whichwrap+=h,l,<,>,[,],~
set shortmess+=c

set tags=./tags

set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=200
set redrawtime=1500

set ignorecase
set smartcase
set infercase
set incsearch
set wrapscan
set complete=.,w,b,k
set inccommand=nosplit
" }}}
" Swap settings {{{

set undofile swapfile nobackup
set directory=$DATA_PATH/swap//,$DATA_PATH,$HOME/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,$HOME/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,$HOME/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/

set history=2000				" History length
set shada=!,'300,<50,@100,s10,h

augroup user_persistent_undo
	autocmd!
	au BufWritePre /tmp/*          setlocal noundofile
	au BufWritePre COMMIT_EDITMSG  setlocal noundofile
	au BufWritePre MERGE_MSG       setlocal noundofile
	au BufWritePre *.tmp           setlocal noundofile
	au BufWritePre *.bak           setlocal noundofile
augroup END

if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
		\ && $HOME !=# expand('~'.$USER)
		\ && $HOME ==# expand('~'.$SUDO_USER)

	set noswapfile
	set nobackup
	set nowritebackup
	set noundofile
	set shada="NONE"
endif

if exists('&backupskip')
	set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
	set backupskip+=.vault.vim
endif

augroup user_secure
	autocmd!
	silent! autocmd BufNewFile,BufReadPre
		\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
		\ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END

" }}}
" Plugins {{{
call plug#begin(system('echo -n "${XDG_CACHE_HOME:-$HOME/.cache}/nvim/plugged"'))

Plug 'junegunn/vim-plug'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim', { 'on' : 'Goyo', 'do' : 'source $VIM_PATH/plugins/goyo.vim' }
Plug 'deris/vim-shot-f'

Plug 'xon-dev/diffconflicts'
Plug 'rhysd/accelerated-jk'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tyru/caw.vim'
Plug 'vimwiki/vimwiki' ", { 'on' : [] }

Plug 'prabirshrestha/async.vim', { 'on' : [] } ", { 'for' : [ 'python', 'cpp' ] }
Plug 'stackline/vim-asynctags', { 'on' : [] } ", { 'for' : [ 'python', 'cpp' ] }
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'AndrewRadev/linediff.vim'


Plug 'norcalli/nvim-colorizer.lua'

" Colors
Plug 'whatyouhide/vim-gotham'
Plug 'dikiaap/minimalist'
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'AlessandroYorba/Sierra'
Plug 'liuchengxu/space-vim-theme'
Plug 'jacoborus/tender.vim'
Plug 'prabirshrestha/asyncomplete.vim'

" Airline
Plug 'vim-airline/vim-airline-themes'

" Programming
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-tags.vim'
Plug 'prabirshrestha/asyncomplete-necosyntax.vim'
Plug 'Shougo/neco-syntax'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-python/python-syntax', { 'on' : [] } " , 'for' : 'python' }

call plug#end()
" }}}
" Default plugins off {{{
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_2html_plugin = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
" }}}
" Theme {{{

" Autoloads theme according to user selected colorschemes

function! s:theme_init()
	" Load cached colorscheme or hybrid by default
	let l:default = 'gotham256'
	let l:cache = s:theme_cache_file()
	if ! exists('g:colors_name')
		set background=dark
		let l:scheme = filereadable(l:cache) ? readfile(l:cache)[0] : l:default
		silent! execute 'colorscheme' l:scheme
	endif
endfunction

function! s:theme_autoload()
	if exists('g:colors_name')
		let theme_path = $VIM_PATH . '/themes/' . g:colors_name . '.vim'
		if filereadable(theme_path)
			execute 'source' fnameescape(theme_path)
		endif
		" Persist theme
		call writefile([g:colors_name], s:theme_cache_file())
	endif
endfunction

function! s:theme_cache_file()
	return $DATA_PATH . '/theme.txt'
endfunction

function! s:theme_cached_scheme(default)
	let l:cache_file = s:theme_cache_file()
	return filereadable(l:cache_file) ? readfile(l:cache_file)[0] : a:default
endfunction

function! s:theme_cleanup()
	if ! exists('g:colors_name')
		return
	endif
	highlight clear
endfunction

augroup user_theme
	autocmd!
	autocmd ColorScheme * call s:theme_autoload()
augroup END

call s:theme_init()

" }}}
" Plugin settings {{{

" PLUG: Better whitespace
let g:better_whitespace_guicolor='#a4a4a4'

" PLUG: Accelerated jk
nmap <silent> j <Plug>(accelerated_jk_gj)
nmap <silent> k <Plug>(accelerated_jk_gk)

" COLOR: Sierra
let g:sierra_Pitch = 1

" PLUG: vim-lsp
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" PLUG: Asyncomplete.vim

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

" }}}
" Bindings {{{

nnoremap <silent><Up>    :resize +1<CR>
nnoremap <silent><Down>  :resize -1<CR>
nnoremap <silent><Right> :vertical resize +1<CR>
nnoremap <silent><Left>  :vertical resize -1<CR>

" Folds
nnoremap <CR> za
nnoremap <A-CR> zMzvzt

" Move throught locations
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

" Move throught errors
nnoremap ]e :cnext<CR>
nnoremap [e :cprev<CR>

" Move throught unneded whitespaces
nnoremap ]w :NextTrailingWhitespace<CR>
nnoremap [w :PrevTrailingWhitespace<CR>

" Close by simply q
nnoremap q :wq<CR>
xnoremap q :wq<CR>
nnoremap <c-s> :w<CR>
xnoremap <C-S> :<C-U>w<CR>gv
cnoremap <C-S> :<C-U>w<CR>

" Re-select blocks after indenting in visual/select mode
xnoremap < <gv
xnoremap > >gv|

nnoremap <silent> <Leader>cw :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" PLUG: asyncomplete.vim
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" }}}
" Abbreviations {{{
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
