Plug 'junegunn/vim-plug'

" Look {{{

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do' : 'source $VIM_PATH/plugins/coc.vim' }
Plug 'Shougo/defx.nvim', { 'on' : 'Defx', 'do' : ':UpdateRemotePlugins' }
Plug 'junegunn/goyo.vim', { 'on' : 'Goyo', 'do' : 'source $VIM_PATH/plugins/goyo.vim' }

" }}}
" Perfomance {{{

Plug 'xon-dev/diffconflicts'

Plug 'rhysd/accelerated-jk'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tyru/caw.vim'
Plug 'vimwiki/vimwiki' ", { 'on' : [] }

" Plug 'ludovicchabant/vim-gutentags' Not working
Plug 'prabirshrestha/async.vim', { 'on' : [] } ", { 'for' : [ 'python', 'cpp' ] }
Plug 'stackline/vim-asynctags', { 'on' : [] } ", { 'for' : [ 'python', 'cpp' ] }

Plug 'norcalli/nvim-colorizer.lua'

" }}}
" Colorschemes {{{

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

" Airline
Plug 'vim-airline/vim-airline-themes'

" }}}
" Filetype related {{{

" Python {{{

Plug 'vim-python/python-syntax', { 'on' : [] } " , 'for' : 'python' }

" }}}

" }}}`

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
