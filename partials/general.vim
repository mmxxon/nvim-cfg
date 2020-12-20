" Env
se report=0
se magic
se path+=**
se cb& cb=unnamedplus
se cmdheight=2

" Appearance
se tgc
se number
se numberwidth=2
se cursorline

se textwidth=80
se smartindent
se tabstop=2
se shiftwidth=2
se shiftround
se softtabstop=-1
se smartindent
se shortmess=atToOF
se foldlevel=99
se foldnestmax=1

" Naviation
se mouse=nvi
se scrolloff=5
se sidescrolloff=6
se splitright
se splitbelow
se nowrap
se whichwrap+=h,l,<,>,[,],~
se et

" Dirs
se undofile nobackup
se directory=$DATA_PATH/swap//,$DATA_PATH,$HOME/tmp,/var/tmp,/tmp
se undodir=$DATA_PATH/undo//,$DATA_PATH,$HOME/tmp,/var/tmp,/tmp
se backupdir=$DATA_PATH/backup/,$DATA_PATH,$HOME/tmp,/var/tmp,/tmp
se viewdir=$DATA_PATH/view/

se shada=!,'300,<50,@100,s10,h

se backupskip+=/tmp/*,$tmpdir/*,$tmp/*,$temp/*,*/shm/*,/private/var/*,.vault.vim

" Timings
se timeoutlen=2000
se updatetime=200

" Search
se ignorecase
" se smartcase
se infercase
se complete=.,w,b,k
se inccommand=nosplit

" Sudo
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
    \ && $HOME !=# expand('~'.$USER)
    \ && $HOME ==# expand('~'.$SUDO_USER)

  set noswapfile
  set nobackup
  set nowritebackup
  set noundofile
  set shada="NONE"
endif

" Augroups
aug xon_fo
	au!
	au BufWinEnter,BufNewFile * setl fo-=o fo-=t fo+=1
aug end

aug xon_persistent_undo
  au!
  au BufWritePre /tmp/*          setl noundofile
  au BufWritePre COMMIT_EDITMSG  setl noundofile
  au BufWritePre MERGE_MSG       setl noundofile
  au BufWritePre *.tmp           setl noundofile
  au BufWritePre *.bak           setl noundofile
aug end

aug xon_fold
  au!
  au BufWinEnter * silent! exe "%foldclose"
aug end

augroup xon_secure
  autocmd!
  silent! autocmd bufnewfile,bufreadpre
    \ /tmp/*,$tmpdir/*,$tmp/*,$temp/*,*/shm/*,/private/var/*,.vault.vim
    \ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup end

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


