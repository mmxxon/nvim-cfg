" General {{{

set mouse=nv				  " Modes that allow mouse usage
set report=0
set errorbells			  " Beep or screen flash for error messages.
set visualbell			  " Use visual bell instead of beeping
set hidden					  " Buffers won't unloads when becomes hidden
set magic							" Special characters in patterns
set path+=**					" Search all directories
set formatoptions+=1
set formatoptions-=t
set formatoptions-=o
set virtualedit=block
set synmaxcol=2500
set autoread
set scrolloff=5
set sidescrolloff=6

" }}}
" Editor UI {{{

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

" }}}
" Directories {{{

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
" Timings {{{

set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=200
set redrawtime=1500

" }}}
" Search {{{

set ignorecase
set smartcase
set infercase
set incsearch
set wrapscan
set complete=.,w,b,k

if exists('+inccommand')
	set inccommand=nosplit
endif

" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
