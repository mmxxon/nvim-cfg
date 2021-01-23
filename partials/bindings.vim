" General {{{

" Unmap mouse {{{

map <S-ScrollWheelUp> <nop>
im <S-ScrollWheelUp> <nop>
map <S-ScrollWheelDown> <nop>
im <S-ScrollWheelDown> <nop>

" }}}

" Forward locations
nn <c-y> <c-i>

" Look
nn <silent><C-up>			:res +1<cr>
nn <silent><C-down>		:res -1<cr>
nn <silent><C-right>	:vert res +1<cr>
nn <silent><C-left>		:vert res -1<cr>

" Resize
nn <silent><up>			2<c-y>
nn <silent><down>		2<c-e>
nn <silent><right>	2zl
nn <silent><left>		2zh

" Move throught splits
nn <C-j> <C-w><C-j>
nn <C-k> <C-w><C-k>
nn <C-h> <C-w><C-h>
nn <C-l> <C-w><C-l>

" Command line
cno <C-p> <home>
cno <C-n> <end>
cno <m-k> <up>
cno <m-j> <down>
cno <m-h> <left>
cno <m-l> <right>

nn ! :!

" Fold
nn <cr> za

" Indent
xn < <gv
xn > >gv|

" Tab
nn <silent><Tab> :tabnext<CR>
nn <silent><S-Tab> :tabprevious<CR>

" Terminal
tnoremap <esc> <C-\><C-n>
au TermOpen * nn <buffer><esc> :q!<cr>

" }}}

if dein#tap('caw.vim')
	nm gc <Plug>(caw:prefix)
	xm gc <Plug>(caw:prefix)
	nm gcc <Plug>(caw:hatpos:toggle)
	xm gcc <Plug>(caw:hatpos:toggle)
en

if dein#tap('accelerated-jk')
	nm <silent>j <Plug>(accelerated_jk_gj)
	nm <silent>k <Plug>(accelerated_jk_gk)
en

if dein#tap('vim-move')
	nm <silent><A-j> <Plug>MoveLineDown
	nm <silent><A-k> <Plug>MoveLineUp
	vm <silent><A-j> <Plug>MoveBlockDown
  vm <silent><A-k> <Plug>MoveBlockUp
el
  nn <A-j> :m .+1<CR>==
  nn <A-k> :m .-2<CR>==
  vn <A-j> :m '>+1<CR>gv=gv
  vn <A-k> :m '<-2<CR>gv=gv
en

if dein#tap('vim-easymotion')
  map <M-e> <Plug>(easymotion-prefix)
en

if dein#tap('goyo.vim')
  nn <silent>zz :Goyo<cr>
en
if dein#tap('coc.nvim')
  " Coc: completion
	ino <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"
	ino <silent><expr> <c-space> coc#refresh()
	nn <expr><c-j> coc#float#has_scroll() ? coc#float#scroll(1, 3) : "\<c-w><c-j>"
	nn <expr><c-k> coc#float#has_scroll() ? coc#float#scroll(0, 3) : "\<c-w><c-k>"
	nn <expr><esc> coc#float#has_float() ?
		\ coc#float#close(coc#float#get_float_win()) : "\<esc>"
	ru plugcfg/cocfunc.vim

  " Coc: bookmarks
  nn <silent>mm       :CocCommand bookmark.toggle<cr>
  nn <silent>ma       :CocCommand bookmark.annotate<cr>
  nn <silent>mx       :CocCommand bookmark.clearForCurrentFile<cr>
  nn <silent>m<Space> :CocCommand bookmark.clearForAllFiles<cr>

  " Coc: format
  nmap <silent>=    <Plug>(coc-format-selected)
  vmap <silent>=    <Plug>(coc-format-selected)
  nmap <silent>==   <Plug>(coc-format)

  nm <silent> gd    <Plug>(coc-definition)
  nm <silent> gt    <Plug>(coc-type-definition)
  nm <silent> gi    <Plug>(coc-implementation)
  nm <silent> gr    <Plug>(coc-references)
en
if dein#tap('neosnippet.vim')
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  smap <expr><TAB> neosnippet#expandable_or_jumpable()
        \ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
en
if dein#tap('vim-expand-region')
	nm <A-l> <Plug>(expand_region_expand)
	nm <A-h> <Plug>(expand_region_shrink)
	vm <A-l> <Plug>(expand_region_expand)
	vm <A-h> <Plug>(expand_region_shrink)
en

if dein#tap('vim-choosewin')
	nm  -  <Plug>(choosewin)
en

if dein#tap('vimspector')
	let g:vimspector_enable_mappings = 'HUMAN'
  nn <silent><F7> :VimspectorReset<cr>
en

" Leader mappings {{{

nn <silent><leader><leader> <C-w><C-p>

if dein#tap('vim-dadbod-ui')
  nn <silent><leader>db :DBUIToggle<cr>
en
if dein#tap('vim-better-whitespace')
	nn <silent><leader>sw		:StripWhitespace<cr>
en
if dein#tap('vim-floaterm')
  nm <silent><leader>fa     :FloatermNew<cr>
  nm <silent><leader>fs     :FloatermNext<cr>
  nm <silent><leader>fd     :FloatermToggle<cr>
en
if dein#tap('coc.nvim')
  nm <silent><leader>ac   <Plug>(coc-codeaction)
  xm <silent><leader>a    <Plug>(coc-codeaction-selected)
  nm <silent><leader>a    <Plug>(coc-codeaction-selected)
  nn <silent><Leader>A	  :CocList colors<cr>
  nn <silent><Leader>b	  :CocList buffers<cr>
  nn <silent><Leader>D    :CocList diagnostics<cr>
  nn <silent><leader>e    :call CocActionAsync('runCommand', 'explorer')<cr>
  nn <silent><Leader>g	  :CocList gitignore<cr>
  nn <silent><Leader>j    :CocNext<cr>
  nn <silent><Leader>k    :CocPrev<cr>
  nn <silent><Leader>m    :CocList bookmark<cr>
  nn <silent><Leader>o    :CocList outline<cr>
  nn <silent><Leader>p    :CocListResume<cr>
  nn <silent><Leader>y    :CocList -A --normal yank<cr>
  nn <silent><Leader>x    :CocList extensions<cr>
  nn <silent><leader>fb   :call CocActionAsync('runCommand', 'fzf-preview.Buffers')<cr>
  nn <silent><leader>fB   :call CocActionAsync('runCommand', 'fzf-preview.AllBuffers')<cr>
  nn <silent><leader>fc   :call CocActionAsync('runCommand', 'fzf-preview.Changes')<cr>
  nn <silent><leader>fg   :call CocActionAsync('runCommand', 'fzf-preview.GitActions')<cr>
  nn <silent><leader>fj   :call CocActionAsync('runCommand', 'fzf-preview.Jumps')<cr>
  nn <silent><leader>fl   :call CocActionAsync('runCommand', 'fzf-preview.LocationList')<cr>
  nn <silent><leader>fq   :call CocActionAsync('runCommand', 'fzf-preview.QuickFix')<cr>
  nn <silent><leader>ft   :call CocActionAsync('runCommand', 'fzf-preview.BufferTags')<cr>
  nn <silent><leader>fv   :call CocActionAsync('runCommand', 'fzf-preview.VistaCtags')<cr>
  nm <silent><leader>gc   <Plug>(coc-git-commit)
  nm <silent><leader>gs   <Plug>(coc-git-chunkinfo)
  nm <silent><leader>qf   <Plug>(coc-fix-current)
  nm <silent><leader>rn   <Plug>(coc-rename)
en
if dein#tap('projectile.vim')
	nn \pp :AddProject<cr>
	nn \pl :ListProject<cr>
	nn \pd :RemoveProject<cr>
en
if dein#tap('linediff.vim')
  nn <silent><leader>ld :Linediff<cr>
  nn <silent><leader>la :LinediffAdd<cr>
  nn <silent><leader>ll :LinediffLast<cr>
  nn <silent><leader>lm :LinediffMerge<cr>
  nn <silent><leader>lp :LinediffPick<cr>
  nn <silent><leader>ls :LinediffShow<cr>
  nn <silent><leader>lr :LinediffReset<cr>
  vn <silent><leader>ld :Linediff<cr>
  vn <silent><leader>la :LinediffAdd<cr>
  vn <silent><leader>ll :LinediffLast<cr>
  vn <silent><leader>lm :LinediffMerge<cr>
  vn <silent><leader>lp :LinediffPick<cr>
  vn <silent><leader>ls :LinediffShow<cr>
  vn <silent><leader>lr :LinediffReset<cr>
en
if dein#tap('vim-livedown')
	nn <silent><leader>M :LivedownToggle<CR>
endif
if dein#tap('bracey.vim')
	nn <silent><Leader>P :Bracey<cr>
endif
if dein#tap('split-term.vim')
  nn <silent><Leader>t :Term<cr>
  nn <silent><Leader>T :VTerm<cr>
en
if dein#tap('nuake')
  nn <A-t> :Nuake<CR>
  ino <A-t> <C-\><C-n>:Nuake<CR>
  tno <A-t> <C-\><C-n>:Nuake<CR>
en
if dein#tap('vista.vim')
  nn <silent><leader>V    :Vista!!<cr>
en
if dein#tap('tagbar')
  nn <silent><leader>v    :TagbarToggle<cr>
en
if dein#tap('vimspector')
	nn <silent><leader>sv :VimSpectorLoadJson<CR>
en
if dein#tap('vim-session')
  nn <silent><leader>ww :SaveSession<cr>
  nn <silent><leader>wo :OpenSession<cr>
  nn <silent><leader>wc :CloseSession<cr>
  nn <silent><leader>wd :DeleteSession<cr>
  nn <silent><leader>wv :ViewSession<cr>
en
if dein#tap('vim-zoomwin')
  nn <silent><leader>z    :ZoomToggle<cr>
en

" }}}
" Bracket mappings {{{

nm <silent> [d  <Plug>(coc-diagnostic-prev)
nm <silent> ]d  <Plug>(coc-diagnostic-next)
nm <silent> [b  <Plug>(coc-bookmark-prev)
nm <silent> ]b  <Plug>(coc-bookmark-next)
nm <silent> [g  <Plug>(coc-git-prevchunk)
nm <silent> ]g  <Plug>(coc-git-nextchunk)

" }}}
" TextObjects {{{

xm i/ <Plug>(textobj-comment-i)
om i/ <Plug>(textobj-comment-i)
xm a/ <Plug>(textobj-comment-a)
om a/ <Plug>(textobj-comment-a)
xm if <Plug>(coc-funcobj-i)
om if <Plug>(coc-funcobj-i)
xm af <Plug>(coc-funcobj-a)
om af <Plug>(coc-funcobj-a)
xm ic <Plug>(coc-classobj-i)
om ic <Plug>(coc-classobj-i)
xm ac <Plug>(coc-classobj-a)
om ac <Plug>(coc-classobj-a)
xm ih <Plug>(coc-git-chunk-inner)
om ih <Plug>(coc-git-chunk-inner)
xm ah <Plug>(coc-git-chunk-outer)
om ah <Plug>(coc-git-chunk-outer)

" }}}
" Abbreviations {{{

cnorea vpy VTerm python
cnorea tpy VTerm python

" }}}
