Plug 'junegunn/vim-plug'

" Look {{{

Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'deris/vim-shot-f'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'romainl/vim-cool'
Plug 'ryanoasis/vim-devicons'
" Plug 'unblevable/quick-scope'
" Plug 'thaerkh/vim-indentguides'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'haya14busa/vim-asterisk'

" }}}
" Perfomance {{{

Plug 'xon-dev/diffconflicts', { 'on': [ 'DiffConflicts', 'DiffConflictsShowHistory', 'DiffConflictsWithHistory' ] }
Plug 'rhysd/accelerated-jk'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tyru/caw.vim'
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/linediff.vim'
" Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod' " Asynchronous
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'justinmk/vim-dirvish'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'voldikss/vim-floaterm'
Plug 'voldikss/fzf-floaterm'
Plug 'windwp/vim-floaterm-repl'
Plug 'liuchengxu/vista.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'markstory/vim-zoomwin'
Plug 'wesQ3/vim-windowswap'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'skywind3000/asyncrun.vim'
Plug 'tknightz/projectile.vim'
Plug 'easymotion/vim-easymotion'
Plug 'puremourning/vimspector', {
        \ 'do': './install_gadget.py --enable-c --enable-python --enable-bash --force-enable-node'
    \ }
Plug 'pseewald/vim-anyfold'
Plug 'airblade/vim-rooter'
Plug 'matze/vim-move'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'arithran/vim-delete-hidden-buffers'
" Plug 'shime/vim-livedown'
" Plug 'greyblake/vim-preview'
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" Plug 'vimwiki/vimwiki'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'preservim/tagbar'
" Plug 'mileszs/ack.vim'
" Plug 'Shougo/neco-vim'
" Plug 'neoclide/coc-neco'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'ivalkeen/vim-ctrlp-tjump'

" }}}
" Colorschemes {{{

" Colors
Plug 'rhysd/try-colorscheme.vim'

Plug 'whatyouhide/vim-gotham'
Plug 'tomasr/molokai'				" Bad with indentline, needed for molokayo
Plug 'fmoralesc/molokayo'
Plug 'joshdick/onedark.vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
Plug 'srcery-colors/srcery-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
Plug 'sjl/badwolf'
" Plug 'dikiaap/minimalist' " Bad with indentline
" Plug 'arcticicestudio/nord-vim' " Bad with indentline
" Plug 'AlessandroYorba/Sierra' " Bad with indentline
" Plug 'jacoborus/tender.vim' " Bad with indentline
" Plug 'owickstrom/vim-colors-paramount' " Bad with indentline
" Plug 'benjaminjamesxyz/DarkModeReloaded' " Bad with indentline

" Airline
Plug 'vim-airline/vim-airline-themes'

" }}}
" Language {{{

Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/utl.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'rhysd/committia.vim'
" Plug 'nvim-treesitter/nvim-treesitter'

Plug 'Shougo/neco-syntax'

" Python {{{

Plug 'vim-python/python-syntax', { 'for' : 'python' }
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'mattn/emmet-vim'
" Plug 'jupyter-vim/jupyter-vim', { 'for': 'python' }

" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
